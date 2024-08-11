// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract IdentityManagement is Ownable {
    struct Identity {
        address user;
        string dataHash;  // Hash of identity data
        bool verified;
    }

    mapping(address => Identity) private identities;

    event IdentityRegistered(address indexed user, string dataHash);
    event IdentityVerified(address indexed user);

    function registerIdentity(string memory dataHash) public {
        identities[msg.sender] = Identity(msg.sender, dataHash, false);
        emit IdentityRegistered(msg.sender, dataHash);
    }

    function verifyIdentity(address user) public onlyOwner {
        require(identities[user].user != address(0), "Identity not found");
        identities[user].verified = true;
        emit IdentityVerified(user);
    }

    function getIdentity(address user) public view returns (Identity memory) {
        return identities[user];
    }
}
