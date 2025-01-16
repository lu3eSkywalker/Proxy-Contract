# Proxy Contract - Simple Delegate Call

## Overview
This repository contains a simple implementation of a proxy contract using the `delegatecall` opcode in Solidity.  
The primary objective of this contract is to separate the **logic** (implementation contract) from the **data** (stored in the proxy contract).

---

## Contracts Overview
### 1. DelegateCall (Proxy Contract)
This contract acts as a proxy that:

- Delegates function calls to an implementation contract using `delegatecall`.
- Stores state variables (`num`, `implementation`, `owner`).
- Provides functionality to change the implementation address, ensuring upgradeability.
- 
---

### 2. ImplementationV1
This is the **initial version** of the implementation contract, containing:

- A single state variable `num`.
- A function `setNum(uint _num)` to set the value of `num`.

---

### 3. ImplementationV2
This is an **upgraded version** of the implementation contract with modified logic:

- A single state variable `num`.
- A function `setNum(uint _num)` that sets `num` to **twice the input value**.
