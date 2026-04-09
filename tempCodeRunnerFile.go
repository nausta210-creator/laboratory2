package main
import "fmt"

func sdvig (S, T string) string{
	if len(S) != len(T){
		return "NO"
	}
	s := len(S)
	if s == 0 {
		return "YES"
	}
	for i := 0; i < s; i++{
		Flag := 1
		for j := 0; j < s; j++{
			if S[(j + i) % s] != T[j]{
				Flag = 0
				break
			}
		}
		if Flag == 1{
			return "YES"
		} 
	}
	return "NO"
}

func main(){
	var S, T string
	fmt.Print("Введите первую строку: ")
	fmt.Scan(&S)
	fmt.Print("Введите вторую строку: ")
	fmt.Scan(&T)

	fmt.Println(sdvig(S, T))
}