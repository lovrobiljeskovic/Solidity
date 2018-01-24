pragma solidity ^0.4.0;

contract SmartContractExercise {
   string word = "helloWorld";
  address creator;
  
  function SmartContractExercise() {
      creator = msg.sender; // msg.sender - reserved keyword in Solidity, everything that goes on Blockchain, sends a mesage.
  }
  
  modifier ifCreator() { //logic which is appended before the creation of contract
        if (creator != msg.sender) {
           throw;
       }else {
           _; // symbol for continue, continue what's next in the function
       }
  }
   //get function, always use "constant", never use for changing information, just for getting it
   function getWord() constant returns(string) { 
       return word;
   }
   
   //set function, doesn't need "constant", use it for changing the information
   function setWord(string newWord) ifCreator returns(string) {
             word = newWord;
       return "This is the creator";
   
       }
   }
