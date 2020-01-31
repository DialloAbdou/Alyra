
/**
 * 
 */
  function netoyer(text)
  {
      var accents = "àâëéèêïîôüûùç";
      var voyelle = "aaeeeeiiouuuc";
      return [...text.toLowerCase()].map(c=>accents.includes(c)?voyelle[accents.indexOf(c)]: c)
      .join('').replace(/[^a-z]/g,'').toUpperCase()
    
  }
/**
 *  
 * Une fonction qui prend en entree
 * un Texte et retourne le nombre d'occurence de chaque
 * Caractère dans le texte
 * @param {*} texte 
 */
function frequence(texte)
{
  
    let analyse=[]
    if(typeof(texte)!='string')
    {
        throw "Vous devez saisir une chaine de caractère!"
    }else
    {
          analyse = netoyer(texte);
          analyse = [...analyse].reduce((a,c)=>a.set(c,(a.get(c)||0)+1),new Map())
          analyse = [...analyse.entries()]
          analyse = analyse.map(([k,v])=>k+' : '+v+' ').join('')
    }
    return analyse;
}
let text="Etre contesté, c’est être constaté"
console.log(frequence(text))