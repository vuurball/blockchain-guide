/*
 * example of using events to add logs from the setters func
 */
 
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
