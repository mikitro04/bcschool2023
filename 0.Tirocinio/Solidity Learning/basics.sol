// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.1 < 0.9.0;


contract SaveValue {
    uint16 public myValue;

    uint16 public numWriting;

    constructor () {
        myValue = 10;
    }

    function sumTen () public view returns(uint256 result) {
        return myValue+10;
    }

    function incrementNumWriting() private  {
        numWriting += 1;
    }

    function writeValue (uint16 _val) public { // Il nome dei parametri, per convenzione, si fa precedere da un underscore -> _
        myValue = _val;
        incrementNumWriting();
    }
}