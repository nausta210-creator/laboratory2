import Foundation

func countEvenDigits(_ num: Int) -> Int {
    if num < 10 {
        return -1
    }
    
    var count = 0
    var temp = num
    
    while temp > 0 {
        let digit = temp % 10
        if digit % 2 == 0 {
            count += 1
        }
        temp /= 10
    }
    
    return count
}

func main() {
    print("Введите количество чисел N: ", terminator: "")
    guard let N = Int(readLine() ?? "") else {
        return
    }
    
    print("Введите \(N) чисел: ", terminator: "")
    guard let input = readLine() else {
        return
    }
    
    let numbers = input.split(separator: " ").compactMap { Int($0) }
    
    print("Результат: ", terminator: "")
    
    for i in 0..<N {
        let result = countEvenDigits(numbers[i])
        
        if result == -1 {
            print("-", terminator: "")
        } else {
            print(result, terminator: "")
        }
        
        if i < N - 1 {
            print(" ", terminator: "")
        }
    }
    
    print()
}

main()