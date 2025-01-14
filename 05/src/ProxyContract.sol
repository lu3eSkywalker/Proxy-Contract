// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/proxy/Proxy.sol";
import "@openzeppelin/contracts/utils/StorageSlot.sol";

contract ProxyContract is Proxy {
    uint256 public totalStaked;
    mapping(address => uint256) userBalances;
    address contractOwner;

    constructor(address __implementation) {
        StorageSlot.getAddressSlot(_IMPLEMENTATION_SLOT).value = __implementation;
        contractOwner = msg.sender;
    }

    bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    modifier onlyOwner {
        require(msg.sender == contractOwner);
        _;
    }

    function _implementation() internal view virtual override returns (address) {
        return StorageSlot.getAddressSlot(_IMPLEMENTATION_SLOT).value;
    }

    function getImplementation(address newImplementation) public onlyOwner() {
        StorageSlot.getAddressSlot(_IMPLEMENTATION_SLOT).value = newImplementation;
    }

    receive() external payable {}
}