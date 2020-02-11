contract CagnotteFestival {
    mapping (address=>uint)organisateurs;
    constructor()public
    {
        organisateurs[msg.sender]=100;
    }
    
    /*
     * * Permet de transferer une part de sa responsabilité à un nouvel organisateur
    */
     function transfererOrga(address orga, uint parts) public {
         
         require(organisateurs[msg.sender]-parts>organisateurs[msg.sender],"Votre part est insouffisant ");
          organisateurs[msg.sender] -= parts;
          organisateurs[orga]+=parts;
     }
     
     /*
      * *Permet de savoir si le propriétaire d'une 
         Adresse Etherum donnée fait partie des organisateurs
     */
      function estOrga(address orga) public view returns (bool){
         
          if(organisateurs[orga]>0)  
          {
              return true;
          }else
          {
              return false;
          }
      }
}