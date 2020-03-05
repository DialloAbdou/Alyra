pragma solidity >0.4.22 <=0.6.0;

import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Credibilite {
  
   using SafeMath for uint256;
   mapping (address => uint256) public cred;
   bytes32[] private devoirs;
   
   /*
     qui prend en paramètre une chaîne de caractères et
     retourne le condensat keccak256 au format bytes32.
   **/
    function produireHash(string memory _url) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_url));
    }
    
    /*
     * qui permet de transférer ses “cred”. Petite particularité, 
      les creds peuvent uniquement être transférés à d’autres 
       détenteurs de cred et en gardant toujours au moinsun cred.*
    */
    
    function transfer(address destinataire, uint256 valeur) public payable
    {
        require(cred[msg.sender]>valeur);
        cred[destinataire] = cred[destinataire].add(valeur);
        cred[msg.sender] = cred[msg.sender].sub(valeur);
    }
    function remettre(bytes32 dev) public returns (uint256)
    {
        devoirs.push(dev);
        return devoirs.length;
    }
    
}