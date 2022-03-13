// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.11;

import "src/utils/GClub.sol";

contract _FunctionOrderingDummy {
    // Method ID: 0x13216062
    bytes32 public occasionallyCalled;

    // Method ID: 0xd0755f53
    function mostCalled() external {}

    // Method ID: 0x24de5553
    function leastCalled() external {}
}

contract FunctionOrderingDummy {
    // Method ID: 0x13216062
    bytes32 public occasionallyCalled;

    // Method ID: 0x0000a818
    function mostCalled_41q() external {}

    // Method ID: 0x24de5553
    function leastCalled() external {}
}

contract FunctionOrdering is GClub {
    function _functionOrdering(_FunctionOrderingDummy _fo) public unoptimized {
        _fo.mostCalled();
        _fo.mostCalled();
        _fo.mostCalled();
        _fo.occasionallyCalled();
        _fo.occasionallyCalled();
        _fo.leastCalled();
    }

    function functionOrdering(FunctionOrderingDummy fo) public optimized {
        fo.mostCalled_41q();
        fo.mostCalled_41q();
        fo.mostCalled_41q();
        fo.occasionallyCalled();
        fo.occasionallyCalled();
        fo.leastCalled();
    }

    function testFunctionOrdering() public {
        _FunctionOrderingDummy _fo = new _FunctionOrderingDummy();
        FunctionOrderingDummy fo = new FunctionOrderingDummy();

        _functionOrdering(_fo);
        functionOrdering(fo);
    }
}
