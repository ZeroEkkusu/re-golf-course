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

// Samples for: FunctionOrdering

contract UnoptimizedNames {
    // Method ID: 0x13216062
    bytes32 public occasionallyCalled;

    // Method ID: 0xd0755f53
    function mostCalled() external {}

    // Method ID: 0x24de5553
    function leastCalled() external {}
}

contract OptimizedNames {
    // Method ID: 0x13216062
    bytes32 public occasionallyCalled;

    // Method ID: 0x0000a818
    function mostCalled_41q() external {}

    // Method ID: 0x24de5553
    function leastCalled() external {}
}

contract SharedSetup {}

// Unoptimized sample
contract Sample0 is SharedSetup {
    UnoptimizedNames uNames = new UnoptimizedNames();

    function measureGas() external {
        uNames.mostCalled();
        uNames.mostCalled();
        uNames.mostCalled();
        uNames.occasionallyCalled();
        uNames.occasionallyCalled();
        uNames.leastCalled();
    }
}

contract Sample1 is SharedSetup {
    OptimizedNames oNames = new OptimizedNames();

    function measureGas() external {
        oNames.mostCalled_41q();
        oNames.mostCalled_41q();
        oNames.mostCalled_41q();
        oNames.occasionallyCalled();
        oNames.occasionallyCalled();
        oNames.leastCalled();
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
    string label0 = "Functions";
    string label1 = "Manipulate their Method IDs";
    string label2 = "";
    string label3 = "";
    string label4 = "";
    string label5 = "";
}
