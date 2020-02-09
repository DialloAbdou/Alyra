pragma solidity ^0.5.16;
contract Banque {
    
    struct Virement {
        Compte cpteDebit;
        uint[]mesVirements;
    }
    struct Compte {
        string nomCpte;
        uint solde;
        bool exits;
    }
    
    struct Client {
      bool exits;
      string nom;
      string prenom;
      mapping (string=>Compte) comptes;
    }
    address adiministrateur;
    mapping(address=>Client) clients;
    
    // Constructeur 
    constructor()public
    {
        adiministrateur= msg.sender;
    }
    
    //==modifie lors de la creation d'un compte==
    modifier OnlyAdmini {
        require(adiministrateur == msg.sender);
        _;
    }
    // Verifier si le client exits
    
    modifier IsExistClt(address adressClt)
    {
        require(clients[adressClt].exits," le client exist");
        _;
    }
    
  
     modifier IsNotExistClt(address adressClt)
    {
        require(!clients[adressClt].exits," le client n'exist pas");
        _;
    }
    
     modifier IsExistCmpte(address adressClt,string memory _nomcpte )
     {
         require(clients[adressClt].comptes[_nomcpte].exits,"le compte exits");
         _;
     }
       modifier IsNotExistCmpte(address adressClt,string memory _nomcpte )
     {
         require(!clients[adressClt].comptes[_nomcpte].exits,"le compte n'exits pas ");
         _;
     }
     
     modifier estDecouvert(address adressClt, string memory _nomcpte)
     {
         require(clients[adressClt].comptes[_nomcpte].solde <0,"Vous êtes en decouvert");
         _;
     }
    /*
    * Elle permet ajouter  
    */
    function ajoutClient(string memory _nom, string memory _prenom,address _adressClt ) 
         public OnlyAdmini IsNotExistClt(_adressClt)
    {
        Client memory clt;
        clt.nom = _nom;
        clt.prenom = _prenom;
        clt.exits = true;
        clients[_adressClt]= clt;
    }
    
    /*
    *  Ajouter Un compte à un client
    **/
    function ajouterCompteClt(string memory  _nomcpte,address _adressClt, uint _solde) public
    OnlyAdmini IsNotExistCmpte(_adressClt,_nomcpte)
    {
        Compte memory cpte;
        cpte.nomCpte =_nomcpte;
        cpte.solde = _solde;
        cpte.exits = true;
        clients[_adressClt].comptes[_nomcpte] = cpte;
    }
    
    /**
     *  Effectuer un Virement*
    */
    
    function DeposerArgent(address _adressClt, string memory _nomcpte,uint _montatnt) public
     IsExistClt(_adressClt) IsExistCmpte(_adressClt,_nomcpte)
    {
        uint resultat = 0;
        clients[_adressClt].comptes[_nomcpte].solde+=_montatnt;
       
    }
    
    /*
     *  Fonction pour Retirer l'Argent
     *
    **/
    function RetirerArgent(address _adressClt,string memory _nomcpte, uint _montatnt) public
    IsExistClt(_adressClt) IsExistCmpte(_adressClt,_nomcpte) estDecouvert(_adressClt,_nomcpte)
    {
         clients[_adressClt].comptes[_nomcpte].solde-=_montatnt;
    }

}