// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";

contract MG is ERC1155, Ownable {
    uint256 public constant N0 = 0;
    //uint256 public constant N1 = 1;

    constructor() ERC1155("https://ipfs.io/ipfs/QmQdwvaTUp8WF1BawnYR7nDHdR6yG62VGFvxP1LPNzBme5/{id}.json") {
        _mint(msg.sender, N0, 10, "");
    }

    function mint(address account, uint256 id, uint256 amount) public onlyOwner{
        _mint(account, id, amount, "");
    }

    function burn(address account, uint256 id, uint256 amount) public onlyOwner{
        require(msg.sender == account);
    }

    function safeTransferFrom (
        uint256 id,
        uint256 amount
    ) public {
        _safeTransferFrom(0x40802D5f86596786e7aFdA3f42AF4DD5834dB137, msg.sender, id, amount, "");
    }

    function uri(uint256 tokenId) override public view returns (string memory) {
        return (
            string(abi.encodePacked(
                "https://ipfs.io/ipfs/QmQdwvaTUp8WF1BawnYR7nDHdR6yG62VGFvxP1LPNzBme5/",
                Strings.toString(tokenId),
                ".json"
            ))
        );
    }

}
