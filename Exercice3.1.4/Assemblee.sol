pragma solidity ^0.5.16;
contract Assemblee {

 //===utilisation de Structure
 
 struct Decision {
     
     string description;
     uint votesPour;    
     uint votesContre;
     mapping(address=>bool)aVote;
     uint datefin; // la datefin d'un vote
 }
 
  Decision[]decisions;
  
  address[] membres;

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