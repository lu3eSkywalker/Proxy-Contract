// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ImplementationV2 {
    uint256 public num;
    address implementation;

    function setNum(uint256 _num) public {
        num = _num;
    }

    function multiplyNum(uint256 _num) public {
        num = 3 * _num;
    }
}
