var read = require("readline-sync")
function estPalindrome(str){
    str = str.split("")
   let j= [str.length-1]
   let estJust =false
    for(let car of str)
    { 
        if(car === str[j])
        {
            estJust = true;
            j;
        }else
        {
            estJust = false;
        }
        return estJust;
    
    }
  
}

 let chaine= read.question("saisir une chaine !")
 console.log(estPalindrome(chaine))