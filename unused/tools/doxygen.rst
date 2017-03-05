Doxygeについて
===============

http://www.stack.nl/~dimitri/doxygen/manual/docblocks.html

1. Sample project with doxygen

2. use doxygen to create uml graph
3. use doxygen to create doc

http://www.yolinux.com/TUTORIALS/LinuxTutorialC++CodingStyle.html#DOXYGEN

Doxygen         = Automated Documentation Generation
    -> can be used with java, c++, python, etc

    
How to use doxygen
--------------------

Install
    apt-get install doxygen doxygen-gui
    
Run
    make a configure file
        mkdir doc
        doxygen -g doc.cfg
    
    edit the configure file
    generate the docblocks
    generate the uml graph
		-> use doxywizard 

Doxygen doc.cfg example
---------------------------

EXTRACT_ALL          = YES
CLASS _DIAGRAMS      = YES
HIDE_UNDOC_RELATIONS = NO
HAVE_DOT             = YES
CLASS_GRAPH          = YES
COLLABORATION_GRAPH  = YES
UML_LOOK             = YES
UML_LIMIT_NUM_FIELDS = 50
TEMPLATE_RELATIONS   = YES
DOT_GRAPH_MAX_NODES  = 100
MAX_DOT_GRAPH_DEPTH  = 0
DOT_TRANSPARENT      = YES    

Doxygen syntax

.. code-block:: html

    @filename   name of file
    @brief      Brief description goes here.
    @details    Brief description goes here.
    
    @author     name1
    @version    Version number
    @depricated explanation
    @class      CAaaBbb
    @see        FunctionA()
    
    @param[in]  variableA DescriptionA
    @param[out] variableB DescriptionB
    @param[in,out] variableC DescriptionC
    Note: in and out are dOxygen specific and not used in Javadoc.
    
    @return     variableA
    @bug        Description of bug goes here
    @warning    Warning message goes here
    
    Full list of dOxygen Tags: http://www.stack.nl/~dimitri/doxygen/commands.html
    Javadoc tags: http://java.sun.com/j2se/javadoc/writingdoccomments/
    
Doxygenのcommentサンプル
-------------------------

.. code-block:: html

    /**
    *  A test class. A more elaborate class description.
    */
    class Javadoc_Test
    {
    public:
        /** 
        * An enum.
        * More detailed enum description.
        */
        enum TEnum { 
            TVal1, /**< enum value TVal1. */  
            TVal2, /**< enum value TVal2. */  
            TVal3  /**< enum value TVal3. */  
            } 
        *enumPtr, /**< enum pointer. Details. */
        enumVar;  /**< enum variable. Details. */
        
        /**
        * A constructor.
        * A more elaborate description of the constructor.
        */
        Javadoc_Test();
        /**
        * A destructor.
        * A more elaborate description of the destructor.
        */
        ~Javadoc_Test();
        
        /**
        * a normal member taking two arguments and returning an integer value.
        * @param a an integer argument.
        * @param s a constant character pointer.
        * @see Javadoc_Test()
        * @see ~Javadoc_Test()
        * @see testMeToo()
        * @see publicVar()
        * @return The test results
        */
        int testMe(int a,const char *s);
        
        /**
        * A pure virtual member.
        * @see testMe()
        * @param c1 the first argument.
        * @param c2 the second argument.
        */
        virtual void testMeToo(char c1,char c2) = 0;
    
        /** 
        * a public variable.
        * Details.
        */
        int publicVar;
        
        /**
        * a function variable.
        * Details.
        */
        int (*handler)(int a,int b);
    };
    
Doxygenがよく利用されるsyntax
--------------------------

.. code-block:: html

    /**
    * @Author Me (me@example.com)
    * @date   September, 2008
    * @brief  Brief description of file.
    *
    * Detailed description of file.
    */

    /**
    * @name    Example API Actions
    * @brief   Example actions available.
    * @ingroup example
    *
    * This API provides certain actions as an example.
    *
    * @param [in] repeat  Number of times to do nothing.
    *
    * @retval TRUE   Successfully did nothing.
    * @retval FALSE  Oops, did something.
    *
    * Example Usage:
    * @code
    *    example_nada(3); // Do nothing 3 times.
    * @endcode
    */
    boolean example(int repeat);
