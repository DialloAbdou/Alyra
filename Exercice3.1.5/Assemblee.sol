pragma solidity ^0.5.16;
contract Assemblee {

 //===utilisation de Structure
 
 
 struct Decision {
     
     string description;
     uint votesPour;    
     uint votesContre;
     mapping(address=>bool)aVote;
     uint datefin;
   
 }
 struct Administrateur {
     string nom;
     Decision[]mesDecisions;
 }
 
  Decision[]decisions; // Un tableau contenant l'ensemble des decisions 
  address[] membres; // le tableau des membress;
  address[]administrateurs;
  address[] tabEmptyAdress;
 
  string public nombAssemblee;
 /*
    Déclaration d'un constructor 
    
 **/
 constructor(string memory nom) public {
   
   nombAssemblee = nom;
   administrateurs.push(msg.sender);
   membres.push(msg.sender); // l'administrateurs peut être membres 
 } 
 
 function demissionnerAdmin(address utilisateur) public
 {
     address[]memory tabSupprimer;
     require(estAdministrateur(utilisateur),"il faut être administrateur");
     require(administrateurs.length > 1,"Il faut nommer un administrateur avant de demissionner");
     for(uint i=0; i< administrateurs.length;i++)
     {
         if(administrateurs[i]== utilisateur){
             tabSupprimer[i]= administrateurs[i];
             administrateurs[administrateurs.length-1];
         }
     }
 }
 //Une proposition de décision peut être fermée par un administrateur
 function fermeDecision(uint indice, address admin) public
 {    address[]memory tabSupDecision;
       tabEmptyAdress = tabSupDecision;
      require(estAdministrateur(msg.sender),"il faut être administrateur");
      require(indice< decisions.length, "la decisions doit être existée");
      for(uint i=0; i< administrateurs.length; i++){
            if(administrateurs[i]==admin)
            {
              for(uint j =0; j< decisions.length;j++)
              {
                   if(j == indice)
                   {
                     tabEmptyAdress[i] =administrateurs[i];
                   }
              }
            }
      }
     
      
      
 }
 /*
  *Un administrateur peut démissionner
  */
  
 /*

    Il peut nommer un administrateur
 **/
 function nommerAdmministrateur(address utilisateur) public
 {
      require(estMembre(msg.sender),"il faut être membres");
      require(estAdministrateur(utilisateur),"il faut être administrateur");
      administrateurs.push(utilisateur);
      
 }

 /**
   estAdministrateur 
 */
 function estAdministrateur(address membre) public view returns(bool)
 {
     for(uint i=0;i< administrateurs.length; i++)
     {
         if(administrateurs[i]==membre)
         {
             return true;
         }else
         {
             return false;
         }
     }
 }
 
  function rejoindre() public {
   membres.push(msg.sender);
  }
 
 function estMembre(address utilisateur) public view returns (bool) {
  
     for (uint i=0; i<membres.length; i++) {
         
         if(membres[i]== utilisateur)
         {
             return true;
         }else
         {
             return false;
         }
     }
  }
  
function proposerDecision(string memory description) public {
    
    require(estMembre(msg.sender),"il faut être membres");
    Decision memory decisionSimple;
    decisionSimple.description = description;
    decisionSimple.votesPour= 0;
    decisionSimple.votesContre=0;
    decisions.push(decisionSimple);
 }

 
 ///Définir la fonction voter, qui prend en paramètres:

///l’indice d’une décision proposée  
//et un booléen  pour déterminer le sens du vote (false : contre, true: pour) 
//Cette fonction doit incrémenter le tableau votePour ou voteContre, en fonction du deuxième paramètre.

  function voter(uint indice, bool value) public {
     require(estMembre(msg.sender),"il faut etre membres");
     if(indice <decisions.length)
     {
        require(!decisions[indice].aVote[msg.sender],"Interdit de voter deux fois ") ;
         require(decisions[indice].datefin > now ,"Le vote est terminer pour cette decision");
        if(value == true)
        {
            decisions[indice].votesPour+=1;
        }else
        {
             decisions[indice].votesContre+=1;
        }
     }
     
  }
  //Définir une fonction comptabiliser qui retourne pour une décision proposée la différence entre les votes pour et les votes contre.
  //Le résultat est un nombre positif si les votes sont plutôt pour et négatif si le vote est plutôt contre. 
  
  function comptabiliser(uint indice) public view returns (int){
      Decision memory decisionSimple;
      uint resultat=0;
      if(indice < decisions.length)
      {
         resultat = decisions[indice].votesPour - decisions[indice].votesContre;
         return int( resultat);
      }else
      {
         return int( resultat);
      }
  }
 
  
}