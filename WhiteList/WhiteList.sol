pragma solidity ^0.5.16;

contract whiteList {
    
   // declaration des attributs
    address administrateur;
    uint dateExpirAdmin;
    
    // Déclaration de Structure Personne
    struct Personne {
         string nom;
         string prenom;
    }
    // ====Declaration Tableau===
     //Personne []personnes;
     mapping(address=>Personne)personnes;
     
    // constructor
    constructor()public
    {
      administrateur = msg.sender;
      dateExpirAdmin = now +10 days;
    }
    //===Les Modificateurs des differentes fonctions 
     modifier onlyAdmin {
         require(msg.sender == administrateur);
         _;
     }
     
     modifier onlyExpiration {
         require(now < dateExpirAdmin);
         _;
     }
     
     
    
    function ajoutPersonne(string memory _nom, string memory _prenom) public onlyExpiration onlyAdmin 
    {
        Personne memory p= Personne(_nom,_prenom);
        personnes[msg.sender] =p;
    
    }
    
}