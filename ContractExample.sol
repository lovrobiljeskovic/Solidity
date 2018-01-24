pragma solidity ^0.4.0;

contract ContractExample {
    address client;
    bool _switch = false;
    event UpdateStatus(string _message);
    event UserStatus(string _message, address user, uint amount);
    function ContractExample() {
        client = msg.sender; //being able to send creator's address through the client
    }
    
modifier ifClient() {
    if(msg.sender != client) {
        
        throw;
    }
    _;
}
    function depositFunds() payable { //payable - reserved keyword, used for making contracts payable
        UserStatus("User has transfered some money", msg.sender, msg.value); //msg.value - reserved keyword, shows the amount transfered
    }
    function withdrawFunds(uint amount) ifClient{
       if(client.send(amount)) { // send - reserved keyword
        UpdateStatus("User has transfered some money");
           _switch = true;  
       }
       else {
           _switch = false;
       }
    }
    function getFunds() ifClient constant returns(uint) { //unassiged integer
        return this.balance; //"this" points to the contract itself. 
    }
}