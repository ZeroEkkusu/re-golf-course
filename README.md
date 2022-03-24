# ⛳ Re:Golf Course

<div style="width: fit-content; height: fit-content">
A list of common Solidity optimization tips and myths.
<div style="text-align:right;">
<sub>- Transmissions Eleven, 2021<sub>
</div>
</div>

## Table of contents
  - [Tips](#tips)
    - [Caddie](#-caddie)
    - [Golf Pro](#-golf-pro)
    - [World Champ](#-world-champ)
  - [Myths](#myths)

# Tips

## 🧒 Caddie

### Make state variables `immutable` if their value never changes

All references to `immutable` state variables will be replaced with the assigned values by the compiler, which removes the need to `SLOAD`.

  - [Full Example](samples/Immutable.sol)

```solidity
// 🚩 Unoptimized
uint internal four = 4;

// 🏌️ Optimized (-100 gas)
uint internal immutable four = 4;
```

### When iterating through a storage array, cache the array length first

Caching the array length first saves an `SLOAD` on each iteration of the loop.

  - [Full Example](samples/CacheArrLength.sol)

```solidity
uint256[] public arr = [uint256(1), 2, 3, 4, 5, 6, 7, 8, 9, 10];

// 🚩 Unoptimized
for (uint256 index; index < arr.length; ++index) {}

// 🏌️ Optimized (-1000 gas)
uint256 arrLength = arr.length;
for (uint256 index; index < arrLength; ++index) {}
```

## 🧤 Golf Pro

### Use `unchecked` when the arithmetic cannot underflow / overflow

In Solidity version 0.8.0 and above, a series of opcodes are added before  adding, diving, and multiplying to check for underflow and overflow.

Put code in an `unchecked` block when it is impossible for the arithmetics to underflow or overflow.

**Warning:** Using `unchecked` with code that would otherwise underflow or overflow will result in the wrapping behavior. Use with caution.

  - [Full Example](samples/Unchecked.sol)

```solidity
uint zeroToTen;

// 🚩 Unoptimized
while (zeroToTen < 10) {
    ++zeroToTen;
}

// 🏌️ Optimized (-660 gas)
while (zeroToTen < 10) {
    unchecked {
        ++zeroToTen;
    }
}
```

### Make functions `payable`

Making functions `payable` eliminates the need for an initial check of `msg.value == 0` and saves 21 gas.

**Note:** This conservatively assumes the function could be `pure` if not for the `payable`.  When compared against a non-`pure` function the savings is 24 gas. When used with a constructor, the savings is on deployment.

**Warning:** Adding a `payable` function where none existed previously could introduce a security risk. Use with caution.

  - [Full Example](samples/PayableFunctions.sol)

```solidity
// 🚩 Unoptimized
function doSomething() public {}

// 🏌️ Optimized (-24 gas)
function doSomething() payable public {}
```

## 🏆 World Champ

### Prioritize functions by lowering Method ID

The compiler orders public and external members by their Method ID.

Calling a function at runtime will be cheaper if the function is positioned earlier in the order (has a relatively lower Method ID) because 22 gas are added to the cost for every position that came before it. The average caller will save on gas if you prioritize most called functions.

- [Full Example](samples/FunctionOrdering.sol)

```solidity
// 🚩 Unoptimized

bytes32 public occasionallyCalled;
// Method ID: 0x13216062  (position: 1, gas: 2261)

function mostCalled() public {}
// Method ID: 0xd0755f53  (position: 3, gas:  142)

function leastCalled() public {}
// Method ID: 0x24de5553  (position: 2, gas:  120)


// 🏌️ Optimized

bytes32 public occasionallyCalled;
// Method ID: 0x13216062  (position: 2, gas: 2283)

function mostCalled_41q() public {}
// Method ID: 0x0000a818  (position: 1, gas:   98)

function leastCalled() public {}
// Method ID: 0x24de5553  (position: 3, gas:  142)
```

# Myths