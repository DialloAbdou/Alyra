

const crypto = require('crypto')
const secp256k1 = require('secp256k1')
class AdressBitcoin {

    constructor()
    {
        this.cleePriveeBitcoin = undefined;
        this.cleePublicBitcoin = undefined;
    }
    /**
     *  Cette fonction permet de Génerer Une clée Privée
     */
    getCleePriveeBitcoin(){
        while(true)
        {
            this.cleePriveeBitcoin = crypto.randomBytes(32)
            if(secp256k1.privateKeyVerify(this.cleePriveeBitcoin))return this.cleePriveeBitcoin;
        }
    }
    getCleePublicBitcoin(){
        this.cleePublicBitcoin = secp256k1.publicKeyCreate(this.getCleePriveeBitcoin)
    }


}
 let addreBitcoin =  new AdressBitcoin();
 let cleePrive = addreBitcoin.getCleePriveeBitcoin();
 let cleePublic = addreBitcoin.getCleePublicBitcoin();
  console.log(` la clée privée est :${cleePrive}`)
//   console.log(` la clée public est :${cleePublic}`)
