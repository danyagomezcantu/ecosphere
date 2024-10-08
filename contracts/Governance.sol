// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Governance is Governor, GovernorVotes {
    constructor(ERC20Votes _token)
        Governor("ecoSphereGovernance")
        GovernorVotes(_token)
    {}

    function votingDelay() public pure override returns (uint256) {
        return 1; // 1 block
    }

    function votingPeriod() public pure override returns (uint256) {
        return 45818; // 1 week
    }

    function quorum(uint256 blockNumber) public pure override returns (uint256) {
        return 4e18; // 4% of total supply
    }
}
