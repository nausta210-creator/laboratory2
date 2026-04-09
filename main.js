function sdvig(S, T) {
    if (S.length !== T.length) {
        return "NO";
    }
    const s = S.length;
    if (s === 0) {
        return "YES";
    }

    for (let i = 0; i < s; i++) {
        let flag = 1;
        
        for (let j = 0; j < s; j++) {
            if (S[(j + i) % s] !== T[j]) {
                flag = 0;
                break;
            }
        }
        
        if (flag === 1) {
            return "YES";
        }
    }
    
    return "NO";
}

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Введите первую строку: ", (S) => {
    rl.question("Введите вторую строку: ", (T) => {
        console.log(sdvig(S, T));
        rl.close();
    });
});