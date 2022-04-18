// SPDX-License-Identifier: Unlicense

pragma solidity 0.8.11;

// Welcome to the 🧪 Optimizooor's Lab!
//
// Get started:
// 1. Set  Solidity version above
// 2. Set `optimizer`       in `foundry.toml`
// 3. Set `optimizer_runs`  in `foundry.toml`
//
// Optimize! Run experiments with `forge test`.

// Samples for: CacheArrLength

abstract contract SharedSetup {
    uint256[] arr = [uint256(1), 2, 3, 4, 5, 6, 7, 8, 9, 10];
}

// Unoptimized sample
contract Sample0 is SharedSetup {
    function measureGas() external {
        for (uint256 index; index < arr.length; ++index) {}
    }
}

contract Sample1 is SharedSetup {
    function measureGas() external {
        uint256 arrLength = arr.length;
        for (uint256 index; index < arrLength; ++index) {}
    }
}

contract Sample2 is SharedSetup {
    function measureGas() external {}
}

contract Sample3 is SharedSetup {
    function measureGas() external {}
}

contract Sample4 is SharedSetup {
    function measureGas() external {}
}

contract Sample5 is SharedSetup {
    function measureGas() external {}
}

// Generated from https://github.com/ZeroEkkusu/optimizooors-lab

// Customize console output
abstract contract Labels {
    string label0 = "Storage array iteration";
    string label1 = "Cache its length";
    string label2 = "";
    string label3 = "";
    string label4 = "";
    string label5 = "";
}
