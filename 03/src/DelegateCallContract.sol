// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/proxy/Proxy.sol";

contract DelegateCall is Proxy {
    uint256 public num;
    address implementation;
    address contractOwner;

    constructor(address __implementation) {
        implementation = __implementation;
        contractOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == contractOwner, "Only Owner can invoke this function");
        _;
    }

    function _implementation() internal view virtual override returns(address) {
        return implementation;
    }

    function changeImplementationVersion(address __implementation) public onlyOwner {
        implementation = __implementation;
    }

    receive() external payable {

    }
}