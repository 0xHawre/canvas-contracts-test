// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ScrollBadge} from "./ScrollBadge.sol";
import {Attestation} from "@eas/contracts/IEAS.sol";

/// @title ScrollBadge
/// @notice This contract implements the basic functionalities of a Scroll badge.
///         It serves as the base contract for more complex badge functionalities.
contract MyScrollBadge is ScrollBadge {
    string public staticTokenURI;

    // Custom error declarations
    error SingletonBadge();
    error Unauthorized();

    // Constructor to set the resolver and token URI
    constructor(address resolver_, string memory tokenURI_) ScrollBadge(resolver_) {
        staticTokenURI = tokenURI_;
    }

    // Function to return the badge token URI
    function badgeTokenURI(bytes32 /*uid*/) public view override returns (string memory) {
        return staticTokenURI;
    }

    // Hook called when a badge is issued
    function onIssueBadge(Attestation calldata attestation) internal virtual override returns (bool) {
        // Check eligibility through the parent contract
        if (!super.onIssueBadge(attestation)) {
            return false;
        }

        // Ensure that the recipient does not already have a badge
        if (hasBadge(attestation.recipient)) {
            revert SingletonBadge();
        }

        // Ensure that the recipient is minting for themselves
        if (attestation.recipient != attestation.attester) {
            revert Unauthorized();
        }

        return true;
    }

    // Hook called when a badge is revoked
    function onRevokeBadge(Attestation calldata attestation) internal virtual override returns (bool) {
        return super.onRevokeBadge(attestation);
    }

    // Function to check if a recipient is eligible for a badge
    function isEligible(address recipient) external virtual returns (bool) {
        return !hasBadge(recipient);
    }
}
