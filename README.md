# Automated Liquidity Staking Pool

This repository contains a high-performance Staking implementation designed for ERC-20 tokens. It uses a scalable reward distribution algorithm to ensure that gas costs remain constant regardless of the number of participants.

## Key Features
- **Scalable Rewards**: Implements the "Synthetix" reward distribution pattern.
- **Fair Distribution**: Rewards are calculated per-block based on the duration of the stake.
- **Security First**: Protected against common re-entrancy and arithmetic overflow vulnerabilities.

## Technical Overview
Users deposit a `StakingToken` and earn a `RewardToken` over time. The rate of rewards is set by the contract owner and distributed proportionally based on each user's share of the total pool.

## License
MIT
