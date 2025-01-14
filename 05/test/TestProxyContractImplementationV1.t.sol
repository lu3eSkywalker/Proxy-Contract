// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {Test} from "forge-std/Test.sol";
import {ProxyContract} from "../src/ProxyContract.sol";
import {Stake} from "../src/ImplementationV1.sol";

contract TestProxyContract is Test {
    ProxyContract proxycontract;
    Stake stake;

    function setUp() public {
        stake = new Stake();
        proxycontract = new ProxyContract(address(stake));
    }

    receive() external payable {}

    function test_stake() public {
        bytes memory data = abi.encodeWithSignature("stake(uint256)", 10 ether);

        (bool success, ) = address(proxycontract).call{value: 10 ether}(data);
        require(success, "Delegate call failed");

        (bool readSuccess, bytes memory returnData) = address(proxycontract)
            .call(abi.encodeWithSignature("totalStaked()"));
        require(readSuccess, "Failed to read total Staked ETH");

        uint256 result = abi.decode(returnData, (uint256));
        assertEq(result, 10 ether, "OK");
    }

    function test_unstake() public {
        bytes memory data = abi.encodeWithSignature("stake(uint256)", 10 ether);

        (bool success, ) = address(proxycontract).call{value: 10 ether}(data);
        require(success, "Delegate call failed");

        bytes memory data2 = abi.encodeWithSignature("unstake(uint256)", 5 ether);
        (bool txSuccess, ) = address(proxycontract).call(data2);
        require(txSuccess, "Delegate call failed for unstake function");

        (bool readSuccess, bytes memory returnData) = address(proxycontract)
            .call(abi.encodeWithSignature("totalStaked()"));
        require(readSuccess, "Failed to read total Staked ETH");

        uint256 result = abi.decode(returnData, (uint256));
        assertEq(result, 7.5 ether, "OK");
    }
}