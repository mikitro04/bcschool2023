// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract Test_uint8 {       // Per convenzione si dichiara un solo contratto per file.sol
    uint8 public little;

    constructor () {
        little = 250;
    }

    function increment() public {
        little += 1;
    }

    function assign5() public {
        little = 5;
    }

    function decrement() public {
        little -= 1;
    }
}

/*
    uint8 va da 0 a 255

    Incrementando una variabile che cale già 255 causerà un errore
    Nella versione 0.4 non causa errore ma torna a 0; per evitare tale problema che avrebbe potuto generare bug si è implementata una libreria chiamata "safemath"

    uint32 da 0 a 4294967295

    uint256 da 0 a boh sempre la calcolatrice non me lo da, ma comunque molto
*/