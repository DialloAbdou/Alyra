var read = require('readline-sync')
let nombre = read.questionInt("saisir un nouveau nombre !");
function getAleatoire(nombre)
{
    const moitie= 50;
    let res = 0;
    while(nombre!==res)
    {
       let min= Math.ceil(1)
       let max = Math.ceil(100)
        res= Math.floor(Math.random()*(max-min+1))+min
        console.log(res)
        if(nombre === res)
        {
            return res;
        } else if((nombre<res)&&(res <moitie)&&(moitie<max))
        {
            console.log("c'est un ptout petit peu moins :")
        }else{
            console.log("c'est beaucoup plus :")
        }
       nombre = read.questionInt("saisir un nouveau nombre !");
    }
 
}
getAleatoire(nombre);
