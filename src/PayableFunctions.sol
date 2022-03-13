// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.11;

import "src/utils/GClub.sol";

contract _PayableFunctionsDummy {
    function _payableFunctions() public {}
}

contract PayableFunctionsDummy {
    function payableFunctions() public payable {}
}

contract PayableFunctions is GClub {
    function _payableFunctions(_PayableFunctionsDummy _pf) public unoptimized {
        _pf._payableFunctions();
    }

    function payableFunctions(PayableFunctionsDummy pf) public optimized {
        pf.payableFunctions();
    }

    function testPayableFunctions() public {
        _PayableFunctionsDummy _pf = new _PayableFunctionsDummy();
        PayableFunctionsDummy pf = new PayableFunctionsDummy();

        _payableFunctions(_pf);
        payableFunctions(pf);
    }
}
