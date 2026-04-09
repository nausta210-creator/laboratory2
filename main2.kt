import java.util.Scanner

fun punkt(v: Array<Array<String>>): String {
    val n = v.size
    
    var start = ""
    for (i in 0 until n) {
        var ok = true
        for (j in 0 until n) {
            if (v[j][1] == v[i][0]) {
                ok = false
                break
            }
        }
        if (ok) {
            start = v[i][0]
            break
        }
    }
    
    if (start == "") {
        return "Ошибка"
    }
    
    var cur = start
    for (step in 0 until n) {
        for (i in 0 until n) {
            if (v[i][0] == cur) {
                cur = v[i][1]
                break
            }
        }
    }
    
    return if (cur == start) "Ошибка" else cur
}

fun main() {
    val scanner = Scanner(System.`in`)
    
    print("Введите количество пар: ")
    val n = scanner.nextInt()
    
    val pairs = Array(n) { arrayOfNulls<String>(2) }
    
    println("Введите пары (начало и конец):")
    for (i in 0 until n) {
        pairs[i][0] = scanner.next()
        pairs[i][1] = scanner.next()
    }
    
    println(punkt(pairs.map { arrayOf(it[0]!!, it[1]!!) }.toTypedArray()))
}