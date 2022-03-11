# ⛳ Re:Golf Course

Proof-of-concept [Golf Course](https://github.com/Rari-Capital/golf-course), reimagined with [Optimizooor's Lab](https://github.com/ZeroEkkusu/optimizooors-lab)'s `GFlask` and a golf theme.

## Table of contents
  - [Tips](#tips)
    - [Caddie](#-caddie)
    - [Golf Pro](#-golf-pro)
    - [World Champ](#-world-champ)
  - [Myths](#myths)

## Tips

### 🧒 Caddie

#### When iterating through a storage array, cache the array length first

Caching the array length first saves an `SLOAD` on each iteration of the loop.
  - [Full Example](src/CacheArrLength.sol)

```solidity
uint256[] public arr = [uint256(1), 2, 3, 4, 5, 6, 7, 8, 9, 10];

// 🚩 Unoptimized
for (uint256 index; index < arr.length; ++index) {}

// 🏌️ Optimized (45% cheaper)
uint256 arrLength = arr.length;
for (uint256 index; index < arrLength; ++index) {}
```

### 🧤 Golf Pro

#### In `require()`, use `!= 0` instead of `> 0` with `uint` values

In a require, when checking a `uint`, using `!= 0` instead of `> 0` saves 6 gas. 

Note: This only works in require but not in other situations.  For more info see [this thread](https://twitter.com/transmissions11/status/1469848358558711808?s=20&t=hyTZxmZKXq06opE8wgo1aA).
  - [Full Example](src/RequireNeZero.sol)

```solidity
uint256 notZero = 4;

// 🚩 Unoptimized
require(notZero > 0);

// 🏌️ Optimized (19% cheaper)
require(notZero != 0);
```

### 🏆 World Champ

#### Function ordering

The compiler orders public and external members of a contract by their Method ID.

You can get the Method ID of a function as follows:

```solidity
bytes4 methodId = bytes4(keccak256("<function_signature>"));
```

Calling a function at runtime will be cheaper if the function is positioned earlier in the order (has a relatively lower Method ID) because 22 gas are added to the cost of a function for every position that came before it. The average caller will save on gas if you prioritize most called functions.

[This tool](https://emn178.github.io/solidity-optimize-name/) helps you find alternative function names with lower Method IDs.

- [Full Example]()

```solidity
// 🚩 Unoptimized
// Method ID: 0x13216062 (position: 1, gas: 2261)
bytes32 public occasionallyCalled;
// Method ID: 0xd0755f53 (position: 3, gas: 142)
function mostCalled() external {}
// Method ID: 0x24de5553 (position: 2, gas: 120)
function leastCalled() external {}

// 🏌️ Optimized
// Method ID: 0x13216062 (position: 2, gas: 2283)
bytes32 public occasionallyCalled;
// Method ID: 0x0000a818 (position: 1, gas: 98)
function mostCalled_41q() external {}
// Method ID: 0x24de5553 (position: 3, gas: 142)
function leastCalled() external {}
```

## Myths