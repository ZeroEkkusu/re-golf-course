// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.11;

import "optimizooors-lab/GFlask.sol";

contract RequireNeZero is GFlask {
    function _requireNeZero(uint256 notZero) public unoptimized {
        require(notZero > 0);
    }

    function requireNeZero(uint256 notZero) public optimized {
        require(notZero != 0);
    }

    function test() public {
        _requireNeZero(1);
        requireNeZero(1);
    }
}
