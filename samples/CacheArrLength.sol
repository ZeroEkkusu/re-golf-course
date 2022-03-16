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

contract SharedSetup is Methods {
    uint256[] arr = [uint256(1), 2, 3, 4, 5, 6, 7, 8, 9, 10];
}

contract Sample0 is SharedSetup {
    function unoptimized() external {
        for (uint256 index; index < arr.length; ++index) {}
    }
}

contract Sample1 is SharedSetup {
    function optimized() external {
        uint256 arrLength = arr.length;
        for (uint256 index; index < arrLength; ++index) {}
    }
}

contract Sample2 is SharedSetup {
    function optimized() external {}
}

contract Sample3 is SharedSetup {
    function optimized() external {}
}

contract Sample4 is SharedSetup {
    function optimized() external {}
}

contract Sample5 is SharedSetup {
    function optimized() external {}
}

// Generated from https://github.com/ZeroEkkusu/optimizooors-lab

/// @notice Customize console output
abstract contract Labels {
    string label0 = "Iterating through stg array";
    string label1 = "Cache the length first";
    string label2 = "";
    string label3 = "";
    string label4 = "";
    string label5 = "";
}

import "src/biohazard/Methods.sol";
