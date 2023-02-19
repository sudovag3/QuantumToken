pragma solidity ^0.5.0;

import "./TRC20.sol";

/**
 * @dev Optional functions from the TRC20 standard.
 */
contract TRC20Detailed is TRC20 {
    address private owner;
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Sets the values for `name`, `symbol`, and `decimals`. All three of
     * these values are immutable: they can only be set once during
     * construction.
     */
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        owner = msg.sender;
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function burn(uint256 value) public returns (bool) {
        _burn(msg.sender, value);
        return true;
    }

    function burnFrom(address from, uint256 value) public onlyOwner returns (bool) {
        _burnFrom(from, value);
        return true;
    }
    /**
     * @dev Function to mint tokens
     * @param to The address that will receive the minted tokens.
     * @param value The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address to, uint256 value) public onlyOwner returns (bool) {
        _mint(to, value);
        return true;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {ITRC20-balanceOf} and {ITRC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
}

