var read = require("readline-sync")
let c = require("./Cercle").default
let rayon = read.questionInt("saisir le rayon !");

let cercle = new c.Cercle(rayon)
let perimetre = cercle.perimetre()
let surface = cercle.aire();
console.log(`le perimetre est : ${perimetre}`)
console.log(`l'aire est : ${surface}`)


