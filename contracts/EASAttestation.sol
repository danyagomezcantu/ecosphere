// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@eas/contracts/EAS.sol";

contract EASAttestation is Ownable {
    EAS private eas;

    constructor(address easAddress) {
        eas = EAS(easAddress);
    }

    function attestAction(string memory actionHash) public returns (bool) {
        eas.attest(msg.sender, actionHash);
        return true;
    }
}
