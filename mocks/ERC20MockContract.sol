// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

contract ERC20MockContract is ERC20 {

	uint8 private _decimals;

	constructor(string memory name_, string memory symbol_, uint8 decimals_) ERC20(name_, symbol_) {
		_decimals = decimals_;
	}

	function mint(address to_, uint256 amount_) public {
		_mint(to_, amount_);
	}

	function init(address[] memory tos_, uint[] memory amounts) public {
		for (uint i = 0; i < tos_.length; i++) {
			_mint(tos_[i], amounts[i]);
		}
	}

	function decimals() public view virtual override returns (uint8) {
		return _decimals;
	}
}
