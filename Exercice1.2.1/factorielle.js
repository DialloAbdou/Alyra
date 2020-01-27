
var read = require("readline-sync")
function factorielle(nbre)
{
    let val =1;
    for(let i=1;i<= nbre;i++)
    {
        val =val*i;
    }
    return val;
}

let nbre = read.questionInt("Veuillez saisir un nombre ")
console.log(factorielle(nbre))