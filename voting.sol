pragma solidity ^0.4.11;

contract Voting {
    
    mapping(bytes32 => uint) public votesReceived;
    bytes32[] public candidateList;
    
    
    function Voting(bytes32[] candidateNames) {
    candidateList = candidateNames;
}

function totalVotes(bytes32 candidate) returns (uint) {
    return votesReceived[candidate];
}
function voteForeCandidate(bytes32 candidate) {
    if(validCandidate(candidate) == false) throw;
    votesReceived[candidate] +=1;
}
function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
        if(candidateList[i] == candidate) {
            return true;
        }
    }
    return false;
}
}

