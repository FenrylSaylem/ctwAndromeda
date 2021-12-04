const fs = require('fs').promises;
const parseLines = async () => (await fs.readFile('./input', 'utf-8')).split('\n');

// Part 1

const solve1 = async () => {
    const lines = (await parseLines()).map(e => e.trim());
    const matrix = lines.map(e => e.split('').map(Number));
    const transposed = matrix[0].map((_, colIndex) => matrix.map(row => row[colIndex]));
    let gamma ="";
    let epsilon = "";

    ones = transposed.forEach(e => {
        let len = e.length/2;
        let res = e.filter( val => val == 1);
        res.length > len ? gamma += '1' : gamma += '0';

    });

    epsilon = gamma.replace(/(0)|(1)/g, function(m, p1, p2) { return p2 ? 0 : 1 })
    gMat = parseInt(gamma,2);
    eMat = parseInt(epsilon,2);

    return (gMat*eMat)    
}
solve1().then(console.log)