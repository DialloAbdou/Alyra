contract Cogere {

    mapping (address => uint) organisateurs;

    uint placesRestantes = 100;

   constructor() internal {
      organisateurs[msg.sender] = 100;   
   }
 
  /*
     * * Permet de transferer une part de sa responsabilité à un nouvel organisateur
    */
 function transfererOrga(address orga, uint parts) public {
     
    require(organisateurs[msg.sender]>parts,"Votre part est souffisant ");
    require(estOrga(orga),"Vous faites parti des organisateurs");
    require(orga != address(0));
    organisateurs[msg.sender] -= parts;
    organisateurs[orga]=parts;
 }
  /*
      * *Permet de savoir si le propriétaire d'une 
         Adresse Etherum donnée fait partie des organisateurs
     */
 function estOrga(address orga) public view returns (bool){
        return organisateurs[orga] >0;
 }
 

}

///=============Heritage========================

contract CagnotteFestival is Cogere {
    mapping (address=>uint)organisateurs;
    uint placesRestantes;
    mapping(address=>bool)festivaliers;
    mapping(string=>uint)sponsors;
    uint private depensesTotales;
     
     constructor(uint _nbplaces) public{
         placesRestantes =_nbplaces;
     }
      
     /*
     *
        La fonction pour permettre l’achat de billets est donc (le mot clé payable signifie
        que cette fonction peut recevoir de l’Ether, voir ci-dessous
     *
     */
     function acheterTicket() public payable
     {
        require(msg.value >=500 finney,"Place à 0.5 Ethers");
        require(placesRestantes>0,"Plus de places !");
        festivaliers[msg.sender]=true;
     }
     
     /**
      * *
     */
     function payer(address payable destinataire, uint montant) public
     {
         require(estOrga(msg.sender));// Verifie que l'iniateur est bien organisateur
         require(destinataire!= address(0));// eviter qu'on envoie des ethers a des mauvais destinataire
         require(montant>0);
         destinataire.transfer(montant);// elle permet d'annuler le transfer si l'emmeteur n'a pas le montant
     }
     /*
     *fonction uniquement accessible depuis les fonctions du smart contract pour comptabiliser les smart contract
     *
     */
     function comptabiliserDepense(uint montant) private {
       depensesTotales += montant;
     }
     /**
      * qui permet à un sponsor d’avoir son nom ajouté à une liste des sponsors en payant 30 ethers au minimum
     **/
    function sponsoriser(string memory nom) public payable {
        require(msg.value >=30,"Vous devez payer au minimum 30 ethers");
        sponsors[nom]=msg.value;
     }
}