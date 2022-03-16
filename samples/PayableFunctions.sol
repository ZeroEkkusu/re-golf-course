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

// Samples for: PayableFunctions

contract SharedSetup is Methods {

}

contract Sample0 is SharedSetup {
    function unoptimized() external {
        doSomething();
    }
}

contract Sample1 is SharedSetup {
    function optimized() external payable {
        doSomething();
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
    string label0 = "Function";
    string label1 = "Make it `payable`";
    string label2 = "";
    string label3 = "";
    string label4 = "";
    string label5 = "";
}

import "src/biohazard/Methods.sol";
