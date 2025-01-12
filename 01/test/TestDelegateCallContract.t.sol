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
        delegatecall.setNumTo2(2);
        assertEq(delegatecall.num(), 2, "DelegateCall.num() should be 2");
    }

    function test_changeImplementation() public {
        delegatecall.changeImplementation(address(implementation2));
        delegatecall.setNumTo2(2);
        assertEq(delegatecall.num(), 4, "DelegateCall.num() should be 4");
    }
}
