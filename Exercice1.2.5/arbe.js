
class Noeud {
    constructor( key, valeur ){
        this .key = key;
        this.valeur = valeur
        this.gauche = undefined;
        this.droite = undefined;
    }
    /**
     * Affiche linfo sur le ned
     */
    getInfoNoeud()
    {
        return `clée est : ${this.key}`
    }

    /**
     * 
     * @param {*} key 
     * @param {*} valeur 
     */
    ajoutValeur(key, valeur)
    {
        let  nouveauNoeud  = new Noeud(key, valeur)
      if(key < this.key)
      {
          if(this.gauche === undefined)
          {
            this.gauche = nouveauNoeud
          }else
          {
              this.ajoutValeur(key, valeur)
          }
          
      }else
      {
          if(this.droite === undefined)
          {
              this.droite = nouveauNoeud;
          }else 
          {
              this.ajoutValeur(key, valeur)
          }
      }

    }

}
//===========Class Arbes ============
class arbes {
    constructor(noeud){
        this.racine = noeud;
    }
    /**
     *  
     * @param {*} key 
     * @param {*} valeur 
     */
    ajoutNoeud(key, valeur)
    {
         let  NouveauNoeud =  new Noeud(key,valeur);
         if(this.racine === undefined)
         {
             this.racine = NouveauNoeud;
         }else{
             let noeudCourant = this.racine;
             let noeudParent;
             while(true)
             {
                 noeudParent = noeudCourant;
                 if(key < noeudCourant.key)
                 {
                     noeudCourant = noeudCourant.gauche;
                     if(noeudCourant === undefined)
                     {
                         noeudParent.gauche = NouveauNoeud;
                         return;
                     }
                 }else{
                     noeudCourant  = noeudCourant.droite;
                     if(noeudCourant=== undefined)
                     {
                         noeudParent.droite = NouveauNoeud;
                         return;
                     }
                 }
             }
         }
    }
/**
 * Affiche l'arbe selon un parcours infixe
 * @param {*} noeudCourant 
 */
   
    Infixe(noeudCourant)
    {
        if(noeudCourant!== undefined)
        {
             this.Infixe(noeudCourant.gauche)
             console.log(noeudCourant)
             this.Infixe(noeudCourant.droite)
        }
    }
/**
 * 
 * elles permet de retrouver le noeud d'un arbe à partir d'une clee  passée en parametre
 * @param {*} key 
 */
    getNoeud(key)
    {
        let  noeudCourant = this.racine;
        while(noeudCourant.key !== key)
        {
            if(key < noeudCourant.key)
            {
                noeudCourant = noeudCourant.gauche;
            }else
            {
                noeudCourant = noeudCourant.droite;
            }
            if(noeudCourant === undefined)
            {
                return undefined;
            }
        }
        return noeudCourant;
    }

    SupprimerNoeud(key)
    {
        let unNeoud = this.getNoeud(key)
        if(unNoeud!==undefined)
        {
            unNoeud = undefined;
            return true;
        }
        return false;
    }


}

// === Test D'application ===

let noeudRacine = new Noeud(20, "Président");
let arbe = new arbes(noeudRacine)
 arbe.ajoutNoeud(25,"Vice Président")
 arbe.ajoutNoeud(30,"Directeur Général")
 arbe.ajoutNoeud(35,"Chef De Projet")
 arbe.ajoutNoeud(40,"Developpeur")
 arbe.ajoutNoeud(45,"Testeur")

 arbe.Infixe(noeudRacine)
 let  unNoeud = arbe.getNoeud(40)
 if(unNoeud!== undefined)
 {
     let nom = unNoeud.valeur;
     console.log(`le Service Demande est:  ${nom}`)
 }
 estSupprime = arbe.SupprimerNoeud(20)
 if(estSupprime)
 {
     console.log(`Le Noeud est Supprimé`)
 }else
 {
    console.log(`Le Noeud n'est aps été Supprimé`)

 }