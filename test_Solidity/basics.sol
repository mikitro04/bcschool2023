// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.1 < 0.9.0;

contract SaveValue {
    uint16 public value;

    constructor () {
        value = 10;
    }
}