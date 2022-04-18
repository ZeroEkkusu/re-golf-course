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

// Samples for: Unchecked

abstract contract SharedSetup {

}

// Unoptimized sample
contract Sample0 is SharedSetup {
    function measureGas() external {
        uint zeroToTen;
        while (zeroToTen < 10) {
            ++zeroToTen;
        }
    }
}

contract Sample1 is SharedSetup {
    function measureGas() external {
        uint zeroToTen;
        while (zeroToTen < 10) {
            unchecked {
                ++zeroToTen;
            }
        }
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
    string label0 = "Checked math";
    string label1 = "Use `unchecked`";
    string label2 = "";
    string label3 = "";
    string label4 = "";
    string label5 = "";
}
