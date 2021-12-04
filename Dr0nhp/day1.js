const fs = require('fs').promises;

const parseLines = async () => {
    const dat = await fs.readFile('./input', {encoding: 'utf-8'});
    return dat.split('\n');
};

// Part 1

const solve1 = async () => {
    const lines = await parseLines();
    const numbers = lines.map(Number);
    let cur = numbers[0];
    let inc = 0;

    for (let i = 0; i < numbers.length; i++) {

        if (numbers[i] > cur) {
            inc ++;
        }
        cur = numbers[i];
    }
    return inc;
}

solve1().then(console.log)

// Part 2

const solve2 = async () => {
    const lines = await parseLines();
    const numbers = lines.map(Number);
    let inc = 0;
    let sum = numbers[0] + numbers[1] + numbers[2];

    for (let i = 1; i < numbers.length-1; i++) {
        let comp = numbers[i] + numbers[i+1] + numbers[i+2];

        if (sum < comp) {
            inc ++;
        }
        sum = comp;
    }
    return inc;
}

solve2().then(console.log)