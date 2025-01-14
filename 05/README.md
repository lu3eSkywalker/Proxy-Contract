# Proxy-Contract


# Ethereum Staking Contract with Upgradeable Proxy

This project demonstrates a simple staking contract system with an upgradeable proxy pattern. The project simulates a real-world scenario where a bug exists in the initial implementation (`ImplementationV1`) and is later fixed in a subsequent implementation (`ImplementationV2`).

---

## Features
1. **Staking Mechanism**: Users can stake ETH to the contract.
2. **Bug in `ImplementationV1`**: Users only receive half their ETH when unstaking.
3. **Upgradeable Proxy**: A proxy contract delegates calls to the implementation contract, allowing upgrades without changing the contract's address.
4. **Bug Fix in `ImplementationV2`**: Fixes the unstaking issue and ensures users get their full ETH back.


## Staking Contract Architecture
![StakingContract](https://github.com/user-attachments/assets/00cc2819-5cbf-42e7-9586-1f5dc62e7701)
