// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {Test} from "forge-std/Test.sol";
import {DelegateCall} from "../src/DelegateCallContract.sol";
import {ImplementationV1} from "../src/DelegateCallContract.sol";
import {ImplementationV2} from "../src/DelegateCallContract.sol";

contract DelegateCallTest is Test {
    DelegateCall delegatecall;
    ImplementationV1 implementation;
    ImplementationV2 implementation2;

    function setUp() public {
        implementation = new ImplementationV1();
        implementation2 = new ImplementationV2();
        delegatecall = new DelegateCall(address(implementation));
    }

    function test_CallStorage() public {
    // Encode the function signature and arguments for `setNum(uint)`
    bytes memory data = abi.encodeWithSignature("setNum(uint256)", 2);
    
    // Call the delegatecall contract with the encoded data
    (bool success, ) = address(delegatecall).call(data);
    require(success, "Delegatecall failed");
    
    // Assert the value was updated
    assertEq(delegatecall.num(), 2, "DelegateCall.num() should be 2");
    }

    function test_Implementation2() public {
        delegatecall.changeImplementation(address(implementation2));
        bytes memory data = abi.encodeWithSignature("setNum(uint256)", 2);

        (bool success, ) = address(delegatecall).call(data);
        require(success, "Delegatecall failed");

        assertEq(delegatecall.num(), 4, "DelegateCall.num() should be 4");
    }

    function test_Implementation2Functions() public {
        delegatecall.changeImplementation(address(implementation2));
        bytes memory data = abi.encodeWithSignature("setNum(uint256)", 2);

        (bool success, ) = address(delegatecall).call(data);
        require(success, "Delegatecall failed");

        assertEq(delegatecall.num(), 4, "DelegateCall.min() should be 4");

        bytes memory data2 = abi.encodeWithSignature("multiplyNum(uint256)", 5);
        (bool success1,) = address(delegatecall).call(data2);
        require(success1, "Delegatecall failed");

        assertEq(delegatecall.num(), 25, "DelegateCall.min() should be 25");
    }

}