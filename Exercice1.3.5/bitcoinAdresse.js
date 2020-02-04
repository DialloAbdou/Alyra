
const crypto = require('crypto')
const secp256k1 = require('secp256k1')
 const CryptoJS = require("crypto-js");
const SHA256 = require("crypto-js/sha256");
const bs58 = require('bs58')
const RIPEMD160 = require("crypto-js/ripemd160")
class BitCoinAdresse {
    constructor()
    {
        this.cleePriveeAdresseBitcoin = undefined;
        this.cleePublicAdresseBitcoin = undefined;

    }
    /**
     * Elle genère une clée privée aléatoirement
     *  Qui est une clée de 32 octect dont 256 bits
     */
    getCleePriveBitcoin(){
      while(true)
      {
        this.cleePriveeAdresseBitcoin = crypto.randomBytes(32);
        if (secp256k1.privateKeyVerify(this.cleePriveeAdresseBitcoin)) return this.cleePriveeAdresseBitcoin;
      }
    }

    getCleePublicBitcoin()
    {
      this.cleePublicAdresseBitcoin = secp256k1.publicKeyCreate(this.cleePriveeAdresseBitcoin)
    }
    /**
     * Calcul le rndom poour 2 *32 =  64 bytes
     * dont la clée bitcoin est composées de deux nombres 32 bytes 
     */
    choixCleePublicBitcoin()
    {
        this.cleePublicAdresseBitcoin = crypto.randomBytes(64)
    }
    /**
     * Calculer le hash SHA 256
     */
    CalculSHA256 (cleeBuffer)
    {
        return SHA256 (CryptoJS.lib.WordArray.create(cleeBuffer))
    }
    /**
     *  puis RIPEMD160 (voir librairies dans le cours), on appelle ce résultat hash160 
     */
    CalculRIPEMD160(cleeBuffer)
    {
        return RIPEMD160(cleeBuffer)
    }
    /***
     *   /**
     * Ajouter l’identifiant (0x00) au début, et le contrôle à la fin 
     * (4 premiers octets du sha256(sha256(0x00 + hash160)) )
     */
     ajoutIdentifiant(hash160Key)
     {
        let clee = "0x00"+hash160Key.toString();
        let shasha256 = SHA256(SHA256(clee))
        return clee+shasha256.toString().substring(0,4);
     }
     /**
      * Convertir le nombre en base 58
      */
    convertBase58(cleeString)
    {
         //----------------------------------------------
        // PublicKey       = "123"
        // keyAsString     = "0x004872dd8b2ceaa54f922e8e6ba6a8eaa77b48872144b"
        // adresseAsString = "12EHDzypjuALLPyopJHU37QuhyQs3bG"
        //----------------------------------------------
        let  k = "0"+cleeString.substring(2); // Faut Enlever le "x"
        let bytes = Buffer.from(k,'hex')
        let adresseAsString = bs58.encode(bytes);
        return adresseAsString;

    }

}
let  bticoin = new BitCoinAdresse();

console.log( bticoin.choixCleePublicBitcoin());

