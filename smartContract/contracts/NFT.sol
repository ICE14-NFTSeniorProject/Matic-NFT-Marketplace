// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721URIStorage {
  using Counters for Counters.Counter;

  // unique token for each NFTs
  Counters.Counter private _tokenIds;

  // address of the marketplace that we will allow the NFT to be intereacted with
  address contactAddress;
  
  constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
    contactAddress = marketplaceAddress;
  }

  /* Mints a token and lists it in the marketplace */
  function createToken(string memory tokenURI) public returns (uint) {
    _tokenIds.increment();
    uint256 newTokenId = _tokenIds.current();

    _mint(msg.sender, newTokenId);
    _setTokenURI(newTokenId, tokenURI);
    setApprovalForAll(contactAddress, true);
    return newTokenId;
  }
}