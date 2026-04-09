package main

import "fmt"

func punkt(v [][2]string) string {
	n := len(v)

	start := ""
	for i := 0; i < n; i++ {
		ok := true
		for j := 0; j < n; j++ {
			if v[j][1] == v[i][0] {
				ok = false
				break
			}
		}
		if ok {
			start = v[i][0]
			break
		}
	}

	if start == "" {
		return "Ошибка"
	}

	cur := start
	for step := 0; step < n; step++ {
		for i := 0; i < n; i++ {
			if v[i][0] == cur {
				cur = v[i][1]
				break
			}
		}
	}

	if cur == start {
		return "Ошибка"
	}
	return cur
}

func main() {
	var n int
	fmt.Print("Введите количество пар: ")
	fmt.Scan(&n)

	pairs := make([][2]string, n)

	fmt.Println("Введите пары (начало и конец):")
	for i := 0; i < n; i++ {
		fmt.Scan(&pairs[i][0], &pairs[i][1])
	}

	fmt.Println(punkt(pairs))
}