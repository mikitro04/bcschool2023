// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {

    uint16 public MAX_TWEET_LENGHT = 280;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    // definizione struttura
    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    function createTweet(string memory _tweet) public {

        // facciamo in modo che la lunghezza massima del tweet sia 280 caratteri
        /*  
            usiamo bytes(stringa).lenght per capire la llunghezza della stringa, bytes trasforma la stringa in un array di bytes e poi usiamo la proprietà .lenmght dell'array
            caratteri normali usano 1 bytes per la rapresentazione, quindi la lunghezza corrisponde, caratteri accentati 2 bytes, faccine dai 3 o 4
        */
        require(bytes(_tweet).length <= MAX_TWEET_LENGHT, "il Tweet e' troppo grande");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet(uint _i) public view returns(Tweet memory){
        return tweets[msg.sender][_i];
    }
    
    function getAllTweet(address _owner) public view returns(Tweet[] memory) {
        return tweets[_owner];
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Non sei il proprietario del contratto");
        _;
    }

    function changeTweetLength(uint16 _newMaxLength) public onlyOwner {
        MAX_TWEET_LENGHT = _newMaxLength;
    }

    function likeTweet(address _author, uint256 _id) external {
        require(tweets[_author][_id].id == _id, "Il tweet non esiste");
        
        tweets[_author][_id].likes++;
    }

    function unlikeTweet(address _author, uint256 _id) external {
        require(tweets[_author][_id].id == _id, "Il tweet non esiste");
        require(tweets[_author][_id].likes > 0, "Il tweet ha gia' 0 likes");

        tweets[_author][_id].likes--;
    }
}