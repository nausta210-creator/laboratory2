#include <iostream>
#include <string>
#include <vector>

using namespace std;

string punkt(vector<pair<string, string>>& v) {
    int n = v.size();
    
    string start = "";
    for (int i = 0; i < n; ++i) {
        bool ok = true;
        for (int j = 0; j < n; ++j)
            if (v[j].second == v[i].first) ok = false;
        if (ok) { start = v[i].first; break; }
    }
    
    if (start == "") return "Ошибка";
    
    string cur = start;
    for (int step = 0; step < n; step++) {
        for (int i = 0; i < n; i++) {
            if (v[i].first == cur) {
                cur = v[i].second;
                break;
            }
        }
    }
    
    return (cur == start) ? "Ошибка" : cur;
}

int main() {
    setlocale(LC_ALL, "Russian");
    int n;
    cout << "Введите количество пар: ";
    cin >> n;
    
    vector<pair<string, string>> pairs(n);
    
    cout << "Введите пары (начало и конец):" << endl;
    for (int i = 0; i < n; i++) {
        cin >> pairs[i].first >> pairs[i].second;
    }
    cout << punkt(pairs) << endl;
}