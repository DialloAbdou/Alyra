class  Crypto {

    constructor(texte){
        this.texte = texte
    }
    fn_netoyer(text)
    {
        this.texte = text
        var accents = "àâëéèêïîôüûùç";
        var voyelle = "aaeeeeiiouuuc"
        return[...this.texte.toLowerCase()].map(c=>accents.includes(c)? voyelle[accents.indexOf(c)]:c)
        .join('').replace(/[^a-z]/g,'').toUpperCase()
    }
     fn_Cesar(c,dec){
         let alpha ='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
         return alpha[(+dec+alpha.indexOf(c)+26)%26]
     }
     fn_Coder(txt,dec){
        let tabt = txt.split('')
       return tabt.map(c=>this.fn_Cesar(c,dec)).join('')
      
     }
    // fn_netoyer1(text)
    // {
    //     this.texte = text
    //   return( this.texte.toLowerCase()
    //     .replace(/[àâ]/g,'a')
    //     .replace(/[èéëê]/g,'e')
    //     .replace(/[üûù]/g,'u')
    //     .replace(/[ïî]/g,'i')
    //     .replace(/[ç]/g,'c')
    //      .replace(/[^a-z]/g,'')
    //     .toUpperCase());






    // }
  }