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

// Samples for: Reentrancy

contract SharedSetup {

}

// Unoptimized sample
contract Sample0 is SharedSetup {
    bool private locked = false;

    modifier nonReentrant() {
        require(locked == false, "REENTRANCY");
        locked = true;
        _;
        locked = false;
    }

    function measureGas() external nonReentrant {}
}

contract Sample1 is SharedSetup {
    uint256 private locked = 1;

    modifier nonReentrant() {
        require(locked == 1, "REENTRANCY");
        locked = 2;
        _;
        locked = 1;
    }

    function measureGas() external nonReentrant {}
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
    string label0 = "Reentrancy `true` `false`";
    string label1 = "Use `2` `1` instead";
    string label2 = "";
    string label3 = "";
    string label4 = "";
    string label5 = "";
}
