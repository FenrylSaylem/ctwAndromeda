const fs = require('fs').promises;
const parseLines = async () => (await fs.readFile('./tinput', 'utf-8')).split('\n');

const solve1 = async () => {
    const lines = (await parseLines()).map(e => e.trim());
    let input = (lines.map(e => e.split(',').map(Number)))[0]

    let

    //zwischen index und index +4 liegt ein spielbrett
    //index +5 ist eine leerzeile
    //index +6 ist die erste zeile des neuen spielbretts

    for (let index = 2; index < lines.length-2; index += 6) {
        
        
    }
    

return true
}

solve1().then(console.log)