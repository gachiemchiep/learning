#include <iostream>
#include <bitset>

int main(int argc, char* argv[]) {

	int a = 181;
	int b = 74;

	int c = a & b;

	std::cout << "a & b = " << std::bitset<8>(c) << std::endl;
	std::cout << "a & b = " << std::bitset<8>(c) << std::endl;
	std::cout << "a & b = " << std::bitset<8>(c) << std::endl;

	return 0;
}
