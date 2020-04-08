pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract ERCToken is ERC20, ERC20Detailed {
    constructor(string memory name, string memory asset, uint256 initialSupply, address owner) ERC20Detailed(name, asset, 18) public {
        _mint(owner, initialSupply);
    }
}
