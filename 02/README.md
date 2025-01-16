# Proxy Contract

## Approach

In this contract, we utilize a **fallback function**. Instead of writing functions directly in the proxy contract, all the logic resides in the implementation contract.  
The proxy contract is only responsible for **storage** and **delegatecall**.

---


## Contracts Overview

### 1. DelegateCall (Proxy Contract)
This contract acts as a proxy that:

- Delegates function calls to an implementation contract using `delegatecall`.
- Stores state variables (`num`, `implementation`, `owner`).
- Provides functionality to change the implementation address, ensuring upgradeability.

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
- Another function `multiplyNum` that sets `num` to **twice the input value**.
