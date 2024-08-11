// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@pythnetwork/contracts/Pyth.sol";

contract PythOracleIntegration {
    Pyth private pyth;

    constructor(address pythAddress) {
        pyth = Pyth(pythAddress);
    }

    function getEnvironmentalData() public view returns (uint256) {
        uint256 data = pyth.getPrice("environmental_metric");
        return data;
    }
}
