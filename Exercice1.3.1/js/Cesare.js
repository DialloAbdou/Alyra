

// Declartion des variables 
let clair = document.querySelector("#clair");
let  netoyer = document.querySelector("#netoyer")
let btcoder = document.querySelector("#coder");
let btdecoder = document.querySelector("#decoder");
let dec = document.querySelector("#dec");
let sortie = document.querySelector("#sortie")

let crypto = new Crypto(clair.value)
//=====Evenement
clair.addEventListener("keyup", function(){
    netoyer.value = crypto.fn_netoyer(this.value)  
    if(this.value=== "")
    {
        netoyer.value=""
    }
 
},false)

btcoder.addEventListener('click',()=>{
   sortie.innerHTML = crypto.fn_Coder(this.netoyer.value,dec.value)
})