// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {Test} from "forge-std/Test.sol";
import {DelegateCall} from "../src/DelegateCallContract.sol";
import {ImplementationV1} from "../src/ImplementationV1.sol";
import {ImplementationV2} from "../src/ImplementationV2.sol";

contract TestDelegateCall is Test {
    DelegateCall delegatecall;
    ImplementationV1 implementationv1;
    ImplementationV2 implementationv2;

    function setUp() public {
        implementationv1 = new ImplementationV1();
        implementationv2 = new ImplementationV2();
        delegatecall = new DelegateCall(address(implementationv1));
    }

    function test_Implementationv1() public {
        bytes memory data = abi.encodeWithSignature("setNum(uint256)", 5);

        (bool success, ) = address(delegatecall).call(data);
        require(success, "Delegate Call Failed");

        (bool readSuccess, bytes memory returnData) = address(delegatecall)
            .call(abi.encodeWithSignature("num()"));
        require(readSuccess, "Failed to read num");

        uint256 result = abi.decode(returnData, (uint256));
        assertEq(result, 5, "num value is incorrect");
    }

    function test_Implementationv2() public {
        delegatecall._setImplementation(address(implementationv2));

        bytes memory data = abi.encodeWithSignature(("multiplyNum(uint256)"), 5);

        (bool success, ) = address(delegatecall).call(data);
        require(success, "Delegate Call Failed");

        (bool readSuccess, bytes memory returnData) = address(delegatecall)
            .call(abi.encodeWithSignature("num()"));
        require(readSuccess, "Failed to read num");

        uint256 result = abi.decode(returnData, (uint256));
        assertEq(result, 15, "num value is incorrect");
    }
}
