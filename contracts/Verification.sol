// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Verification {
    AggregatorV3Interface internal oracle;

    struct VerificationData {
        address user;
        string actionType;
        int256 verifiedValue;
        uint256 timestamp;
    }

    mapping(address => VerificationData) public verifications;

    event DataVerified(address indexed user, string actionType, int256 verifiedValue, uint256 timestamp);

    constructor(address oracleAddress) {
        oracle = AggregatorV3Interface(oracleAddress);
    }

    function verifyAction(address user, string memory actionType) public {
        (,int data,,,) = oracle.latestRoundData();
        VerificationData memory verification = VerificationData(user, actionType, data, block.timestamp);
        verifications[user] = verification;
        emit DataVerified(user, actionType, data, block.timestamp);
    }
}
