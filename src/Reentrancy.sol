// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.11;

import "src/utils/GClub.sol";

contract Reentrancy is GClub {
    bool private _locked = false;

    modifier _nonReentrant() {
        require(_locked == false, "REENTRANCY");
        _locked = true;
        _;
        _locked = false;
    }

    function _useUintForReentrancy()
        internal
        _nonReentrant
        returns (uint256 amount3)
    {
        // do some stuff
        uint256 amount1 = 1e18;
        uint256 amount2 = 1e18;
        amount3 = amount1 + amount2;
    }

    uint256 private locked = 1;

    modifier nonReentrant() {
        require(locked == 1, "REENTRANCY");
        locked = 2;
        _;
        locked = 1;
    }

    function useUintForReentrancy()
        internal
        nonReentrant
        returns (uint256 amount3)
    {
        // do some stuff
        uint256 amount1 = 1e18;
        uint256 amount2 = 1e18;
        amount3 = amount1 + amount2;
    }

    function _useUintForReentrancyDummy() public unoptimized {
        _useUintForReentrancy();
    }

    function useUintForReentrancyDummy() public optimized {
        useUintForReentrancy();
    }

    function testReentrancy() public {
        _useUintForReentrancyDummy();
        useUintForReentrancyDummy();
    }
}
