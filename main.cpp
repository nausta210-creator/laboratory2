#include <iostream>
#include <string>

using namespace std;

string sdvig (const string& S, const string& T){

    if (S.length() != T.length()){
        return "NO";
    }
    int s = S.length();
    if (s == 0){
        return "YES";
    }

    for (int i = 0; i < s; ++i){
        int Flag = 1;
        for (int j = 0; j < s; ++j){
            if (S[(j + i) % s] != T[j]){
                Flag = 0;
                break;
            }
        }
        if (Flag == 1){
            return "YES";
        }
    }
    return "NO";
}

int main(){
    string S, T;
    cout << "Введите первую строку: ";
    cin >> S;
    cout << "Введите вторую строку: ";
    cin >> T;
    cout << sdvig(S, T) << endl;
    return 0;
}