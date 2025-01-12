// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Implementation {
    uint public num; // Slot 0, matches DelegateCall's storage layout

    function setNum(uint _num) public {
        num = _num;
    }
}