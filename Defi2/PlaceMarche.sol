pragma solidity ^0.5.16;

contract PlaceMarche {
    
    // Les differentes declarations
    address administrateur;
    
    /**struct Bannie {
       bool estbannie;
        mapping(string=>Participant) participants;
    }*/
    struct Participant {
        string nom;
        address adresse;
        uint reputation;
        bool estvalide;
    }
    
    mapping(address=>Participant)participants;
    mapping(address=>bool)bannies;
    
    // ======constructor========
    
    constructor() public {
        administrateur =msg.sender;
    }
    
    //===Modification =========
    modifier estBannie(address _adresse)  {
        require( bannies[_adresse] == false,"vous n'êtes pas bannie");
      
        _;
    }
    modifier OnlyAdmin(){
        require(msg.sender==administrateur);
        _;
    }
    modifier estInscrit(address _adresseParticip) {
        require(!participants[_adresseParticip].estvalide,"vous n'êtes pas inscrit ");
        _;
    }
    //======Inscription=====
    
    /*-*
    -* Inscription d'un participant avec une réputation est mise à 1 au minimum
    -*/ 
    function inscription(string memory _nom, address _adresse)public estBannie(_adresse) estInscrit(_adresse) {
        
         participants[msg.sender] = Participant(_nom,_adresse,1,true);
        
    }
    /*-*
    -* Bannir un Participant avec une réputation qui est mise à 0;
    */
    
    function bannirParticipant(address _adresse) public estInscrit(_adresse) estBannie(_adresse) {
        participants[_adresse].reputation = 0;
        bannies[_adresse] = true;
        
    }
}