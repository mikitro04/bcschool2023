// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {

    mapping(address => string[]) public tweets;

    /*
        per creare un array si usa:
         - Dimensione statica  -> type[n] visibility fixedArrayName;
         - Dimensione dinamica -> type[] visibility arrayName;
        
        per caricare valori in un array si usa arrayName.push(value)

        per accedere ad un valore si usa:
        arrayName[index]
    */
    function createTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);
    }

    function getTweet(address _owner, uint _i) public view returns(string memory){
        return tweets[_owner][_i];
    }
    
    function getAllTweet(address _owner) public view returns(string[] memory) {
        return tweets[_owner];
    }
}