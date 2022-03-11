// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.11;

import "optimizooors-lab/GFlask.sol";

contract CacheArrLength is GFlask {
    uint256[] public arr = [uint256(1), 2, 3, 4, 5, 6, 7, 8, 9, 10];

    function _cacheArrLength() public unoptimized {
        for (uint256 index; index < arr.length; ++index) {}
    }

    function cacheArrLength() public optimized {
        uint256 arrLength = arr.length;
        for (uint256 index; index < arrLength; ++index) {}
    }

    function test() public {
        _cacheArrLength();
        cacheArrLength();
    }
}
