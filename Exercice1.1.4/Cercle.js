class Cercle{
    constructor(rayon)
    {
        this.rayon = rayon;
    }
    perimetre()
    { 
        return(2*3.14*this.rayon)
    }
    aire()
    {
       return(3.14*Math.pow(this.rayon,2))
    }
}
//=============Test================
var read = require("readline-sync")
let rayon = read.questionInt("saisir le rayon !");

let cercle = new Cercle(rayon)
let perimetre = cercle.perimetre()
let surface = cercle.aire();
console.log(`le perimetre est : ${perimetre}`)
console.log(`l'aire est : ${surface}`)

