// SPDX-License-Identifier: Unlicense

/// @title GClub
/// @author Zero Ekkusu
/// @notice Measure gas savings with different optimizations
contract GClub {
    event log(string);
    event log_named_uint(string key, uint256 val);
    event log_named_int(string key, int256 val);

    uint256 private gasUnoptimized;
    //uint256 private funCounter;

    modifier unoptimized() {
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gClub(false, startGas - endGas);
    }

    modifier optimized() {
        uint256 startGas = gasleft();
        _;
        uint256 endGas = gasleft();
        gClub(true, startGas - endGas);
    }

    function gClub(bool _optimized, uint256 gas) private {
        if (gas == 10) {
            return;
        }
        if (!_optimized) {
            require(
                gasUnoptimized == 0,
                "More than 1 unoptimized function found!"
            );
            gasUnoptimized = gas;
            return;
        }
        //emit log("");
        //emit log_named_uint("::", ++funCounter);
        int256 savings = int256(gasUnoptimized) - int256(gas);
        bool saved = savings > 0;
        if (savings == 0) {
            emit log("No savings.");
        } else {
            emit log_named_int(
                saved ? "SAVES (GAS)" : "[!] More expensive (gas)",
                savings
            );
        }
    }
}
