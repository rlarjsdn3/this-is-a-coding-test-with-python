#include <iostream>
#include <algorithm>

int main(void)
{
    int n, target = 1;
    std::cin >> n;

    int *coinType = new int[n];
    for(int i=0; i<n; i++) {
        std::cin >> coinType[i];
    }

    std::sort(coinType, coinType+n);
    for(int i=0; i<n; i++) {
        if(target < coinType[i]) {
            break;
        }

        target += coinType[i];
    }

    std::cout << target << '\n';
    return 0;
}
