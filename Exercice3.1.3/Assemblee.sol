pragma solidity ^0.5.16;
contract Assemblee {
 address[] membres;
 string[] descriptionDecisions;
 uint[]  votesPour;
 uint[] votesContre;

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
   if(estMembre(msg.sender)){
     descriptionDecisions.push(description);
     votesPour.push(0);
     votesContre.push(0);
   }
 }
 
 ///Définir la fonction voter, qui prend en paramètres:

///l’indice d’une décision proposée  
//et un booléen  pour déterminer le sens du vote (false : contre, true: pour) 
//Cette fonction doit incrémenter le tableau votePour ou voteContre, en fonction du deuxième paramètre.

  function voter(uint indice, bool value) public {
      
      if(value == true)
      {
        votesPour[indice]++;
      }else
      {
          votesContre[indice]++;
      }
     
  }
  //Définir une fonction comptabiliser qui retourne pour une décision proposée la différence entre les votes pour et les votes contre.
  //Le résultat est un nombre positif si les votes sont plutôt pour et négatif si le vote est plutôt contre. 
  
  function comptabiliser(uint indice) public view returns (int){
      
      uint resultat=0;
      if(indice < descriptionDecisions.length)
      {
         resultat = votesPour[indice]-votesContre[indice];
         return int( resultat);
      }else
      {
         return int( resultat);
      }
  }

}