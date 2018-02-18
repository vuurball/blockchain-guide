/*
 * interacting with other deployed contracts on the same blockchain 
 */
 
//CONTRACT 1
pragma solidity ^0.4.4;

contract ScoreStoreContract {
	  //like an array of key string->value int, called PersonScores
    mapping(string => int) PersonScores;

    function addPersonScore(string name, int startingScore)
    {
        //if key isset, don't override the value
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
