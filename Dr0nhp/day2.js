const fs = require('fs').promises;

const parseLines = async () => {
    const dat = await fs.readFile('./input', {encoding: 'utf-8'});
    return dat.split('\n');
};

// Part 1

const solve1 = async () => {
    const lines = await parseLines();
    let depths = 0;
    let horizontal = 0;
    
    lines.forEach(e => {
        if (e.charAt(0) == "f"){
            horizontal += Number(e.split(" ")[1])
        }

        else if (e.charAt(0) == "d") {
            depths += Number(e.split(" ")[1])
        }
        else if (e.charAt(0) == "u") {
            depths -= Number(e.split(" ")[1])
        }
    });
    return (horizontal*depths)   
}

solve1().then(console.log)


// Part 2

const solve2 = async () => {
    const lines = await parseLines();
    let depths = 0;
    let horizontal = 0;
    let aim = 0;
    
    lines.forEach(e => {
        if (e.charAt(0) == "f"){
            horizontal += Number(e.split(" ")[1])
            depths += Number(e.split(" ")[1]) * aim
        }
        else if (e.charAt(0) == "d") {
            aim += Number(e.split(" ")[1])
        }
        else if (e.charAt(0) == "u") {
            aim -= Number(e.split(" ")[1])
        }});
    return (horizontal*depths)   
}

solve2().then(console.log)

