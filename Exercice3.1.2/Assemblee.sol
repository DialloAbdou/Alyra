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
}