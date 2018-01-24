pragma solidity ^0.4.0;

contract CallerContract {
    
    CalledContract toBeCalled =  CalledContract(0x0c2e77121daf0270d26bf0a7e9ab0faa8bf739ef); //this is an address of CalledContract, meaning it's already on the blockchain and can be interacted with

   function getNumber() constant returns(uint) {
       return toBeCalled.getNumber();
   }
   function getWords() constant returns(bytes32) {
       return toBeCalled.getWords();
   }
    
}



contract CalledContract { 
    
    uint number = 40;
    bytes32 words = "Hello, Lovro, this is a contract"; //we use bytes instead od string because string cannot be returned in a function, it is an array
    
    function getNumber() constant returns(uint) {
        return number;
    }
    function setNumber(uint _number) {
        number = _number;
    }
    function getWords() constant returns(bytes32) {
        return words;
    }
}