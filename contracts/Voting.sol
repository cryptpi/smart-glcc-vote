// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Voting {

    string public candidat1 = "Moussa Moussaoui";
    string public candidat2 = "Ziad Moussaoui";

    uint256 public votesCandidat1 = 0;
    uint256 public votesCandidat2 = 0;
    uint256 public scoreFinal = 0;
    
    function vote(uint256 noCandidat) public {
        require(noCandidat == 1 || noCandidat == 2, "Numero de candidat invalide");
        if (noCandidat == 1) {
            votesCandidat1 += 1;
            scoreFinal = votesCandidat1;
        } else {
            votesCandidat2 += 1;
            scoreFinal = votesCandidat2;
        }
    }
    
    function getTotalDesVotes(uint256 noCandidat) public view returns (uint256) {
        require(noCandidat == 1 || noCandidat == 2, "Numero de candidat invalide");
        if (noCandidat == 1) {
            return votesCandidat1;
        } else {
            return votesCandidat2;
        }
    }
    
function getScoreFinal() public view returns (string memory) {
    string memory result = string(abi.encodePacked("[",candidat1,"]: ", toString(votesCandidat1), "------ [", candidat2,"]: ",toString(votesCandidat2)));
    return result;
}

function toString(uint256 value) private pure returns (string memory) {
    
    if (value == 0) {
        return "0";
    }
    uint256 temp = value;
    uint256 digits;
    while (temp != 0) {
        digits++;
        temp /= 10;
    }
    bytes memory buffer = new bytes(digits);
    while (value != 0) {
        digits -= 1;
        buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
        value /= 10;
    }
    return string(buffer);
}
}
