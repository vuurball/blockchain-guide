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


////////////////////////////////////////////////////

pragma solidity ^0.4.0;

contract CustodialContract {
    address client;
    bool public flag = false;
    
    //events are like a loggin function, here we declare the event name and params it will log. 
    //events can be used only in setters, not getters
    event UserStatusEvent(string _msg, address user, uint amount);
    
    function CustodialContract(){
         client =  msg.sender;
    }

    function depositFunds() payable{
        //calling an event to log this action
        UserStatusEvent("new deposit", msg.sender, msg.value);
    }
    
    //getter funcs will hve the word "constant", setters won't.
    function getFunds() ifClient constant returns(uint){
        //"this" refers to current contract object
        return this.balance;
    }
    
    function withdrawFunds(uint amount) ifClient {
        //adds amount to clients' account balance
        if(client.send(amount)){
            flag = true;
        }else{
            flag = false;
        }
    }
    
    modifier ifClient(){
        if(msg.sender != client){
            throw;
        }
        _;
    }
}

/***** interacting with other deployed contracts on the same blockchain ************/
//CONTRACT 1
pragma solidity ^0.4.4;

contract ScoreStoreContract {
	mapping(string => int) PersonScores;

	function addPersonScore(string name, int startingScore)
	{
		if(PersonScores[name] > 0)
		{
			throw;
		}

		PersonScores[name] = startingScore;
	}

	function getScore(string name) returns (int) 
	{
		return PersonScores[name];
	}
}

//CONTRACT 2 will use CONTRACT 1
pragma solidity ^0.4.4;

//create an interface tot he 1st contract
contract IScoreStoreContract{
    //set a signatrure func to the function we are going to use from contract 1 (same name, params,returns)
	function getScore(string name) returns (int) ;
}

contract MyGameContract {
    //wrapper func to call a function from contract 1
	function showScore(string name) returns (int) {
        //create an instance to the interface, pass the addressHash of contract 1 (output when was deployed)
		IScoreStoreContract scoreStore = IScoreStoreContract(0x8DDbe991C6D2787841248232D494b9846fD44B2C);
        //call the function in contract 1 and return value.
		return scoreStore.getScore(name);
	}
}
