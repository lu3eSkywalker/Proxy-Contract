# Proxy Contract

## Approach

In this contract, We Inherit the proxy contract from Openzeppelin contracts library and we also implement the EIP-1967 spec by using the `StorageSlot` utility to store the implementation address at a fixed, well-defined storage location (_IMPLEMENTATION_SLOT).

---

## Contracts Overview

### 1. DelegateCall (Proxy Contract)
This contract acts as a proxy that:

- Delegates function calls to an implementation contract using `delegatecall`.
- Stores state variables (`num`, `implementation`, `owner`).
- Provides functionality to change the implementation address, ensuring upgradeability.
- Use of the StorageSlot utility to store the implementation address at a fixed, well-defined storage location (_IMPLEMENTATION_SLOT).

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
- Another function `multiplyNum` that sets `num` to **thrice the input value**.
