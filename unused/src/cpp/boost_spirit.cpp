#include <boost/config/warning_disable.hpp>
#include <boost/spirit/include/qi.hpp>
#include <boost/spirit/include/phoenix_core.hpp>
#include <boost/spirit/include/phoenix_operator.hpp>	/// operator#include <boost/spirit/include/phoenix_stl.hpp>
#include <boost/spirit/include/phoenix_stl.hpp>			/// vector
#include <boost/spirit/include/qi_repeat.hpp>

#include <iostream>
#include <string>
#include <vector>

/**
 * Text parsing using boost spirit
 * Boost spirit use grammar to perform parsing
 * It can also perform addition action like : math,
 */

/**
 * Boost cool trick
 * 		double_ >> *(',' >> double_)	=	double_ % ','
 */

namespace client {

    namespace qi = boost::spirit::qi;
    namespace ascii = boost::spirit::ascii;
    namespace phoenix = boost::phoenix;

    /** Parsing list of number
    *	1.0,2.0,3.0,...
    * Optionals: e.g. -p. Match the parser p zero or many time.
    */
    template <typename Iterator>
    bool parse_numbers(Iterator first, Iterator last) {
        using qi::double_;
        using qi::phrase_parse;
        using ascii::space;

        bool r = phrase_parse(
            first,                          /*< start iterator >*/
            last,                           /*< end iterator >*/
            double_ >> *(',' >> double_),   /*< the parser >*/
            space                           /*< the skip-parser >*/
        );

        if (first != last) // fail if we did not get a full match
            return false;
        return r;
    }

    /** Parsing complex number
    * (123.45, 987.65)	(123.45)	123.45
    *	double_[ref(rN) = _1]  -> parse double into rN
    * Alternates: e.g. a | b. Try a first. If it succeeds, good. If not, try the next alternative, b.
    * Optionals: e.g. -p. Match the parser p zero or one time.
	*/
    template <typename Iterator>
    bool parse_complex(Iterator first, Iterator last, std::complex<double>& c) {
    	using boost::spirit::qi::double_;
		using boost::spirit::qi::_1;
		using boost::spirit::qi::phrase_parse;
		using boost::spirit::ascii::space;
		using boost::phoenix::ref;

		double rN = 0.0;
		double iN = 0.0;
		bool r = phrase_parse(first, last,
			//  Begin grammar
			(
					'(' >> double_[ref(rN) = _1]
						>> -(',' >> double_[ref(iN) = _1]) >> ')'
				|   double_[ref(rN) = _1]
			),
			//  End grammar
			space);

		if (!r || first != last) // fail if we did not get a full match
			return false;
		c = std::complex<double>(rN, iN);
		return r;
    }

    /**
     * Parsing list of number and perform number summing
     * 1,2,3,4,5,6 	-> 21
     * ref(n) = _1
	 * This assigns the parsed result (actually, the attribute of double_) to n.
	 * ref(n) tells Phoenix that n is a mutable reference.
	 * _1 is a Phoenix placeholder for the parsed result attribute.
     */
    template <typename Iterator>
	bool adder(Iterator first, Iterator last, double& n) {
        using qi::double_;
        using qi::_1;
        using ascii::space;
        using phoenix::ref;

		bool r = qi::phrase_parse(first, last,
			//  Begin grammar
			(
				double_[ref(n) = _1] >> *(',' >> double_[ref(n) += _1])
			)
			,
			//  End grammar
			space);

		if (first != last) // fail if we did not get a full match
			return false;
		return r;
	}

    /**
     * Number List - stuffing numbers into a std::vector
     */
    template <typename Iterator>
    bool stuff_numbers(Iterator first, Iterator last, std::vector<double> &v) {
    	using qi::double_;
		using qi::phrase_parse;
		using qi::_1;
		using ascii::space;
		using phoenix::push_back;

		bool r = phrase_parse(first, last,

			//  Begin grammar
			(
				double_[push_back(phoenix::ref(v), _1)]
					>> *(',' >> double_[push_back(phoenix::ref(v), _1)])
			)
			,
			//  End grammar

			space);

		if (first != last) // fail if we did not get a full match
			return false;
		return r;
    }

    /**
     * Parse into struct
     */
    struct employee {
        int age;
        std::string surname;
        std::string forename;
        double salary;
    };
    template <typename Iterator>
    struct employee_parser : qi::grammar<Iterator, employee(), ascii::space_type> {
        employee_parser() : employee_parser::base_type(start) {
            using qi::int_;
            using qi::lit;
            using qi::double_;
            using qi::lexeme;
            using ascii::char_;

            quoted_string %= lexeme['"' >> +(char_ - '"') >> '"'];

            start %=
                lit("employee")
                >> '{'
                >>  int_ >> ','
                >>  quoted_string >> ','
                >>  quoted_string >> ','
                >>  double_
                >>  '}'
                ;
        }

        qi::rule<Iterator, std::string(), ascii::space_type> quoted_string;
        qi::rule<Iterator, employee(), ascii::space_type> start;
    };

}

////////////////////////////////////////////////////////////////////////////
//  Main program
////////////////////////////////////////////////////////////////////////////
int main(int argc, char* argv[]) {

    std::cout << "/////////////////////////////////////////////////////////\n\n";
    std::cout << "\t\tA comma separated list parser for Spirit...\n\n";
    std::cout << "/////////////////////////////////////////////////////////\n\n";

    std::cout << "Give me a comma separated list of numbers.\n";
    std::cout << "Type [q or Q] to quit\n\n";

    std::string str;
    while (getline(std::cin, str)) {

        if (str.empty() || str[0] == 'q' || str[0] == 'Q')
            break;

//        if (client::parse_numbers(str.begin(), str.end())) {
//            std::cout << "-------------------------\n";
//            std::cout << "Parsing succeeded\n";
//            std::cout << str << " Parses OK: " << std::endl;
//        }

//        std::complex<double> c;
//        if (client::parse_complex(str.begin(), str.end(), c)) {
//        	std::cout << "-------------------------\n";
//			std::cout << "Parsing succeeded\n";
//			std::cout << "got: " << c << std::endl;
//			std::cout << "\n-------------------------\n";
//        }

        double sum;
        if (client::adder(str.begin(), str.end(), sum)) {
        	std::cout << "-------------------------\n";
			std::cout << "Parsing succeeded\n";
			std::cout << "got: " << sum << std::endl;
			std::cout << "\n-------------------------\n";
        }
        else {

            std::cout << "-------------------------\n";
            std::cout << "Parsing failed\n";
            std::cout << "-------------------------\n";
        }
    }

    std::cout << "Bye... :-) \n\n";
    return 0;
}
