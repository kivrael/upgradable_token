// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract TESTCOIN is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, OwnableUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
//    constructor() initializer {}  // The constructor came from openzeppelin's wizard (https://docs.openzeppelin.com/contracts/4.x/wizard)
                                    // But I commented it to solve a problem I had : the contract owner was be the address 0 instead of the address of the account which deployed the contract. 

    function initialize() initializer public {
        __ERC20_init("TestCoin", "TC");
        __ERC20Burnable_init();
        __Ownable_init();
        __UUPSUpgradeable_init();

        _mint(msg.sender, 10000000000 * 10 ** decimals());
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}

    //uint _value;
    //function getUint() public view returns (uint) { return _value; } // random function I add to make an upgrade
    
}
