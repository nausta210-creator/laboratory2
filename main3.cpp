#include <iostream>
#include <string>
#include <vector>

using namespace std;

int countEvenDigits(int num) {
    if (num < 10) {
        return -1;
    }
    
    int count = 0;
    int temp = num;
    
    while (temp > 0) {
        int digit = temp % 10;
        if (digit % 2 == 0) {
            count++;
        }
        temp /= 10;
    }
    
    return count;
}

int main() {
    int N;
    
    cout << "Введите количество чисел N: ";
    cin >> N;
    
    vector<int> numbers(N);
    
    cout << "Введите " << N << " чисел: ";
    for (int i = 0; i < N; i++) {
        cin >> numbers[i];
    }
    
    cout << "Результат: ";
    
    for (int i = 0; i < N; i++) {
        int result = countEvenDigits(numbers[i]);
        
        if (result == -1) {
            cout << "-";
        } else {
            cout << result;
        }
        
        if (i < N - 1) {
            cout << " ";
        }
    }
    
    cout << endl;
    
    return 0;
}