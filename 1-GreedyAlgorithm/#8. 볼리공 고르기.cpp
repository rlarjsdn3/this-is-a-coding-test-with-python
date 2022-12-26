#include <iostream>

int main(void)
{
    int n, k, count = 0;
    std::cin >> n >> k;

    int *array = new int[k+1];
    int *input = new int[n];
    for(int i=0; i<n; i++) {
        std::cin >> input[i];
    }

    for(int i=1; i<=k; i++) {
        array[input[i-1]] += 1;
    }

    for(int i=1; i<=k; i++) {
        n -= array[i];
        count += array[i] * n;
    }

    std::cout << count << '\n';
    return 0;
}
