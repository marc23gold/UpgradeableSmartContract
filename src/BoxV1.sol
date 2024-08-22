//SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

//storage is stored in the proxy, NOT the implementation

//Proxy (borrowing funcitions from the implementation)
//Proxy contracts don't use a constructor
//Proxy -> deploy implementation -> call some "initalizer" function

contract BoxV1 is UUPSUpgradeable, OwnableUpgradeable, Initializable {
    uint256 internal number;

    //@custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function inialize() public initializer {
        __Ownable_init(); //sets owner to the deployer
        __UUPSUpgradeable_init();
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}
