// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Stake {
    uint256 public totalStaked;
    mapping(address => uint256) userBalance;

    function stake(uint256 _amount) public payable {
        require(_amount > 0, "Amount should be greater than zero");
        require(msg.value == _amount, "Amount should be equal to msg.value");
        totalStaked += _amount;
        userBalance[msg.sender] += _amount;
    }

    function unstake(uint256 _amount) public payable {
        require(_amount > 0, "Amount should be greater than zero");
        require(userBalance[msg.sender] >= _amount, "User Balance is insufficient");
        totalStaked -= _amount;
        payable(msg.sender).transfer(_amount);
        userBalance[msg.sender] += _amount;
    }
}