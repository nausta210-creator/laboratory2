package main

import "fmt"

func countEvenDigits(num int) int {
    if num < 10 {
        return -1
    }
    
    count := 0
    temp := num
    
    for temp > 0 {
        digit := temp % 10
        if digit%2 == 0 {
            count++
        }
        temp /= 10
    }
    
    return count
}

func main() {
    var N int
    
    fmt.Print("Введите количество чисел N: ")
    fmt.Scan(&N)
    
    numbers := make([]int, N)
    
    fmt.Printf("Введите %d чисел: ", N)
    for i := 0; i < N; i++ {
        fmt.Scan(&numbers[i])
    }
    
    fmt.Print("Результат: ")
    
    for i := 0; i < N; i++ {
        result := countEvenDigits(numbers[i])
        
        if result == -1 {
            fmt.Print("-")
        } else {
            fmt.Print(result)
        }
        
        if i < N-1 {
            fmt.Print(" ")
        }
    }
    
    fmt.Println()
}