// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DelegateCall {
    uint public num;
    address implementation;
    address owner;

    constructor (address _implementation) {
        num = 0;
        implementation = _implementation;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner can invoke this function");
        _;
    }

    fallback() external {
        (bool success, ) = implementation.delegatecall(msg.data);

        if(!success) {
            revert();
        }
    }

    function changeImplementation(address _implementation) public onlyOwner {
        implementation = _implementation;
    }
}


contract ImplementationV1 {
    uint public num;

    function setNum(uint _num) public {
        num = _num;
    }
}

contract ImplementationV2 {
    uint public num;

    function setNum(uint _num) public {
        num = 2 * _num;
    }

    function multiplyNum(uint _num) public {
        num = 5 * _num;
    }
}