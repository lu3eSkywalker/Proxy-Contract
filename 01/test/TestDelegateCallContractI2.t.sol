// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {Test} from "forge-std/Test.sol";
import {DelegateCall} from "../src/DelegateCallContract.sol";
import {ImplementationV2} from "../src/DelegateCallContract.sol";

contract DelegateCallTest is Test {
    DelegateCall delegatecall;
    ImplementationV2 implementation;

    function setUp() public {
        vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        implementation = new ImplementationV2();
        delegatecall = new DelegateCall(address(implementation));
        vm.stopPrank();
    }

    function test_CallStorage() public {
        vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        delegatecall.setNumTo2(2);
        assertEq(delegatecall.num(), 4, "CallStorage.num() should be 4");
    }
}
