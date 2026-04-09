def count_even_digits(num):
    if num < 10:
        return -1
    
    count = 0
    temp = num
    
    while temp > 0:
        digit = temp % 10
        if digit % 2 == 0:
            count += 1
        temp //= 10
    
    return count

def main():
    N = int(input("Введите количество чисел N: "))
    
    numbers = list(map(int, input(f"Введите {N} чисел: ").split()))
    
    print("Результат: ", end="")
    
    for i in range(N):
        result = count_even_digits(numbers[i])
        
        if result == -1:
            print("-", end="")
        else:
            print(result, end="")
        
        if i < N - 1:
            print(" ", end="")
    
    print()

if __name__ == "__main__":
    main()