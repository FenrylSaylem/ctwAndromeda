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

// Part 2

const solve2 = async () => {
    const lines = (await parseLines()).map(e => e.trim());
    const matrix = lines.map(e => e.split('').map(Number));

    oxygen = parseInt(oxygenRating(matrix)[0].join(''),2);
    carbondioxide = parseInt(carbonRating(matrix)[0].join(''),2);

    return oxygen*carbondioxide
}

const transposer = (matrix) => {
    return (matrix[0].map((_, colIndex) => matrix.map(row => row[colIndex])))
}

const gethigherValue = (array, line) => {
    let zero = 0;
    let one = 0;
    array[line].reduce((accu, curr) => {
        curr == 0 ? zero+=1 : one +=1;
    },0 )
    return (zero > one ? 0 : 1 ) 
}


const getLowerValue =  (array, line) => {
    let zero = 0;
    let one = 0;

    array[line].reduce((acc, curr) => {
        curr == 0 ? zero+=1 : one +=1
    }, 0)

    return (zero <= one ? 0 : 1 ) 
}

const delArrays =  (array, cycle = 0, numberToKeep) => {

    _tempArray = []    
    for (const e of array) {
        if (e){
            e[cycle] == numberToKeep ? _tempArray.push(e) : null
        }
    }
    return _tempArray
}

const oxygenRating = (matrix) => {

    let helper = matrix;

    for (let index = 0; index < matrix[0].length; index++) {
        
        if (helper.length == 1) {break}
        else

        transp = transposer(helper);
        numberToKeep = gethigherValue(transp,index);
        helper = delArrays(helper,index,numberToKeep);
    }
    return helper
}

const carbonRating = (matrix) => {

    let helper = matrix;

    for (let index = 0; index < matrix[0].length; index++) {

        if (helper.length == 1) {break}
        else

        transp = transposer(helper);
        numberToKeep = getLowerValue(transp,index);
        helper = delArrays(helper,index,numberToKeep);
    }
    return helper
}

solve2().then(console.log)