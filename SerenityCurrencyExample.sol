pragma solidity ^0.4.0;

contract Serenity {
    address public creator;
    mapping(address => uint) public balances;


//event that notifies when transfer has completed
event Delivered(address from, address to, uint ammount);


function Serenity() {
    creator = msg.sender;
}

function create(address receiver, uint ammount) {
    if(msg.sender != creator) throw;
    balances[receiver] += ammount;
}

function transfer(address receiver, uint ammount) {
    if(balances[msg.sender] < ammount) throw;
    balances[msg.sender] -= ammount;
    balances[receiver] += ammount;
    Delivered(msg.sender, receiver, ammount);
}
}