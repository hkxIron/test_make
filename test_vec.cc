#include <vector>
#include <iostream>
#include <iterator>
#include <algorithm>
 
int main()
{
    std::vector<int> v{1,2,3,4,5,6};
    std::reverse(std::begin(v), std::end(v));
    for(auto e : v) std::cout << e;
    std::cout << '\n';

    v.reserve(10);
    for(auto e : v) std::cout << e;
    std::cout << '\n';
 
    int a[] = {4, 5, 6, 7};
    std::reverse(std::begin(a), std::end(a));
    for(auto e : a) std::cout << e;
}
