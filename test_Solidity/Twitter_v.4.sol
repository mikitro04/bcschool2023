// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {
    // definizione struttura
    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    // costanti

    // variabili
    uint16 public MAX_TWEET_LENGHT = 280;
    address owner;
    mapping(address => Tweet[]) public tweets;

    // eventi
    event TweetCreated(uint256 id, address author, string content, uint256 timestamp);

    event TweetLiked(address liker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);
    event TweetUnliked(address unliker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount);

    // errori

    // modificatori
    modifier onlyOwner() {
        require(msg.sender == owner, "Non sei il proprietario del contratto");
        _;
    }

    // costruttore
    constructor() {
        owner = msg.sender;
    }

    // funzioni

    function createTweet(string memory _tweet) public {

        require(bytes(_tweet).length <= MAX_TWEET_LENGHT, "il Tweet e' troppo grande");

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

        emit TweetCreated(newTweet.id, newTweet.author, newTweet.content, newTweet.timestamp);
    }

    function getTweet(uint _i) public view returns(Tweet memory){
        return tweets[msg.sender][_i];
    }
    
    function getAllTweet(address _owner) public view returns(Tweet[] memory) {
        return tweets[_owner];
    }


    function changeTweetLength(uint16 _newMaxLength) public onlyOwner {
        MAX_TWEET_LENGHT = _newMaxLength;
    }

    function likeTweet(address _author, uint256 _id) external {
        require(tweets[_author][_id].id == _id, "Il tweet non esiste");
        
        tweets[_author][_id].likes++;

        emit TweetLiked(msg.sender, _author, _id, tweets[_author][_id].likes);
    }

    function unlikeTweet(address _author, uint256 _id) external {
        require(tweets[_author][_id].id == _id, "Il tweet non esiste");
        require(tweets[_author][_id].likes > 0, "Il tweet ha gia' 0 likes");

        tweets[_author][_id].likes--;

        emit TweetUnliked(msg.sender, _author, _id, tweets[_author][_id].likes);
    }
}