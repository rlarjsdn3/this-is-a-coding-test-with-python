// #1. 왕실의 나이트 - p. 115

#include <iostream>
#include <string>

#define ARRAY_SIZE 8
#define CHESS_SIZE 8

using namespace std; 

int moveX[ARRAY_SIZE] = { 2, -2, 2, -2, 1, -1, 1, -1 };
int moveY[ARRAY_SIZE] = { 1, 1, -1, -1, 2, 2, -2, -2 };

int main(void)
{
    string data;
    cin >> data;

    int x = (int)(data.at(1) - '0');
    int y = (int)(data.at(0) - 'a') + 1;
    int count = 0;

    for(int i=0; i<ARRAY_SIZE; i++) {
        int tx = x; tx += moveX[i];
        int ty = y; ty += moveY[i];

        if(tx>CHESS_SIZE || tx<=0 || ty>CHESS_SIZE || ty<=0) {
            continue;
        } 
        count++;
    }

    cout << count << endl;
}
