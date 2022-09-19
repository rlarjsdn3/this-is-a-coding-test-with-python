// 4. 문자열 재정렬 - p. 322

#include <iostream>
#include <list>
#include <iterator>
using namespace std;

bool compare(const char c1, const char c2) {
    return c1 < c2;
}

int main(void) {
    string data;
    list<char>::iterator it;
    cin >> data;

    list<char> mylist;
    int value = 0;
    for(int i=0; i<data.size(); i++) {
        if(!('0'<=data[i] && data[i]<='9')) {
            mylist.push_back(data[i]);
        } else {
            value += (data[i] - '0');
        }
    }

    mylist.sort(compare);

    string result = "";
    for(it=mylist.begin(); it!=mylist.end(); it++) {
        result += *it;
    }
    result += to_string(value);

    cout << result << endl;

    return 0;
}

