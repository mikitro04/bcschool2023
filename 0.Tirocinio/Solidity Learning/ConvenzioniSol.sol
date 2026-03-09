// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Imports

// Contratti
contract MyContract {
    // 3. TYPE DECLARATIONS (Structs/Enums)

    // 4. STATE VARIABLES
        // Costanti
        uint constant X = 0;

        // Variabili
        uint x;

    // 5. EVENTS
    event evento(uint intero);

    // 6. ERRORS

    // 7. MODIFIERS
    modifier modificatore() {
        //corpo
        _;
    }

    // 8. FUNZIONI (In ordine: Constructor -> Special -> Public -> Private)
    
    // Costruttore
    constructor() {
        // corpo
    }

    // Receive (se vuoi accettare soldi)
    receive() external payable {}

    // Funzioni Pubbliche/External
    function registra(string memory _nome, uint256 _eta) external {
        // corpo
    }

    // Funzioni Private/Interne (di supporto)
    function _calcoloInterno() private view returns (uint256) {
        //corpo
    }
}