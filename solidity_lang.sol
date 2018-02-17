//specifies the compiler version
pragma solidity ^0.4.0;

//contract name (like a class everything will be inside)
contract HelloWorldContract {
    //setting up a string contract-attribute that is not public and we'll make our own getters and setters funcs for it
    string  word = "Hello World";
    
    //contract-attribute of solidity type "address" which is public and has getters/setters
    address public issuer;
    
    //the constructor of the contract, runs when it's created. has the same name like the contract *class*
    function HelloWorldContract(){
        issuer = msg.sender; //every transaction has the msg param. msg.sender is the account hash of the executor
    }

   //modifier can be used like a middleware function, inserted in a function signature and it will run before the function starts
   //to stop execution before reaching the function we'll use "throw;", to continue to the function we'll use "_;"
   modifier isIssuer(){
        if(issuer != msg.sender){
           throw;
       }
       _;
   }
   
   //custom getter func for not public contract-attribute
   function getWord() constant returns(string) {
       return word;
   }
   
   //custom setter func for not public contract-attribute with modifier (middleware - isIssuer) 
   function setWord(string newWord) isIssuer returns(string) {
       word = newWord;
       return "*****************the creator ***************";
   }
}
