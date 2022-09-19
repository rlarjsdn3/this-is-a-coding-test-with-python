// 3. 럭키 스트레이트 - p. 321

#include <iostream>
using namespace std;

int main(void) {
    string str;
    cin >> str;

    int mid = str.size() / 2;
    int sum = 0
    for(int i=0; i<str.size()/2; i++) {
        sum += (str[i] - '0');
        sum -= (str[str.size()-i-1] - '0');
    }

    if(sum == 0) {
        cout << "LUCKY" << endl;
    } else {
        cout << "READY" << endl;
    }

    return 0;
}
