// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {

    /*
        Associazione chiave valore
        e.g.
        matricola -> nome studente
        address -> owner name

        la variabile `mapping` letteralmente mappa da un valore a un'altro così dichiarato:
        mapping(key => value) visibility nameValue;

        per aggiongere alla mappa:
        nameValue[key] = value;

        per rimuovere:
        delete nameValue[key];

        per leggere e.g. un return:
        return nameValue[key];
    */
    mapping(address => string) public tweets;

    /*
        la keyword memory permette di salvare la stringa (che occupa tanto spazio) in una memoria temporanea

        msg.sender accede all'address di chi sta compiendo l'azione 
    */

    function createTweet(string memory _tweet) public {
        tweets[msg.sender] = _tweet;
    }

    /*
        Le funzioni possono essere di due tipi
         - view = leggono senza scrivere niente dalla blockchain
         - pure = eseguono funzioni di puro calcolo (non leggono e non scrivono niente)
         - _ = se non si mette niente resta in modalità default per leggere e/o scrivere (consuma più gas)
    */
    function getTweet(address _owner) public view returns(string memory){
        return tweets[_owner];
    }
}