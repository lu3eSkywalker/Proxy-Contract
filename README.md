# Proxy-Contract

## Summary
This repository explores the implementation of proxy contracts in various forms, starting from basic concepts like using delegate call and progressing to more advanced techniques like
implementing proxy contracts from openzepplin and using EIP-1967 spec.
We then, also make a simple ETH Staking smart contract and leave a bug in it and then upgrade the implementation using proxy contract.

---

#### 01 Basic Proxy Contract: 
Simple implementation of a proxy contract using the delegatecall opcode in Solidity.

---
<br />

#### 02 Using Fallback Function:
In this contract, we utilize a fallback function. Instead of writing functions directly in the proxy contract, all the logic resides in the implementation contract.

---

#### 03 Inheriting From OpenZeppelin Lib
In this contract, We Inherit the proxy contract from Openzeppelin contracts library.

---

#### 04 Implementing EIP-1967
In this contract, We Inherit the proxy contract from Openzeppelin contracts library and implement the EIP-1967 spec.

---

#### 05 Simple Staking Contract:
Simple staking contract system with an upgradeable proxy pattern.

#### Implementation Architecture
<img src="https://github.com/user-attachments/assets/00cc2819-5cbf-42e7-9586-1f5dc62e7701" alt="Implementation Architecture" width="800" />
