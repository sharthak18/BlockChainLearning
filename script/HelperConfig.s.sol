// SPDX-License-Identifier: SEE LICENSE IN LICENSE

// 1. deploy mocs when we are on local anvil chain
// 2. keep track of conrtract address acrose differen chain
// Sepolia ETH/USD 
// Mainnet ETH/USD 
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/Mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {

    NetworkConfig public activeNetworkConfig;

    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8; // 2000

    constructor() {
        if (block.chainid ==    11155111) { // Sepolia
            activeNetworkConfig = getSepoliaEthConfig();
        } else if(block.chainid == 1) { // Anvil
            activeNetworkConfig = getMainnetEthConfig();
        } else {
            activeNetworkConfig = getOrCreatAnvilEthConfig();
        }
     
    }

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed address

    }
    
    function getSepoliaEthConfig() public pure returns(NetworkConfig memory) {

        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

     function getMainnetEthConfig() public pure returns(NetworkConfig memory) {

        NetworkConfig memory ethConfig = NetworkConfig({
            priceFeed : 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return ethConfig;
    }
    
    function getOrCreatAnvilEthConfig() public  returns(NetworkConfig memory) {

        if (activeNetworkConfig.priceFeed != address(0)) {
            return activeNetworkConfig; // Return existing config if already set
        }


       vm.startBroadcast();
       MockV3Aggregator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE);

       vm.stopBroadcast();
       NetworkConfig  memory anvilConfig =NetworkConfig({
        priceFeed: address(mockPriceFeed)
       });
       return anvilConfig;
    }

}
