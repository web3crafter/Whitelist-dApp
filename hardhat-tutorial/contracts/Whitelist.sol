// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addressToWhitelist() public {
        // Check if the sender already has been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not, throwa an error
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Can not add more addressese, limit reached"
        );
        // adds the address that called the function to whitelistedArray
        whitelistedAddresses[msg.sender] = true;
        // increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}
