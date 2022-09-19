// 3. 럭키 스트레이트 - p. 321

#include <iostream>
using namespace std;

int main(void) {
    string str;
    cin >> str;

    int mid = str.size() / 2;
    int sum1 = 0, sum2 = 0;
    for(int i=0; i<str.size()/2; i++) {
        sum1 += (str[i] - '0');
        sum2 += (str[str.size()-i-1] - '0');
    }

    if(sum1 == sum2) {
        cout << "LUCKY" << endl;
    } else {
        cout << "READY" << endl;
    }

    return 0;
}
