// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import "../lib/forge-std/src/Script.sol";
import "../src/badge/MyScrollBadge.sol";

contract DeployMyScrollBadge is Script {
    function run() external {
        vm.startBroadcast();

        address resolverAddress = 0x4560FECd62B14A463bE44D40fE5Cfd595eEc0113; // Your resolver address
        string memory tokenURI = "https://0xhawre.xyz/badges/badge.json"; // Your token URI

        MyScrollBadge badge = new MyScrollBadge(resolverAddress, tokenURI);
        console.log("MyScrollBadge deployed to:", address(badge));

        vm.stopBroadcast();
    }
}
