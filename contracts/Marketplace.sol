// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Marketplace is Ownable {
    struct Listing {
        address seller;
        uint256 price;
        bool sold;
    }

    mapping(uint256 => Listing) public listings;
    IERC721 public nftContract;

    event NFTListed(uint256 indexed tokenId, address indexed seller, uint256 price);
    event NFTSold(uint256 indexed tokenId, address indexed buyer, uint256 price);

    constructor(address nftAddress) {
        nftContract = IERC721(nftAddress);
    }

    function listNFT(uint256 tokenId, uint256 price) public {
        require(nftContract.ownerOf(tokenId) == msg.sender, "Only the owner can list the NFT");
        require(price > 0, "Price must be greater than zero");

        listings[tokenId] = Listing(msg.sender, price, false);
        emit NFTListed(tokenId, msg.sender, price);
    }

    function buyNFT(uint256 tokenId) public payable {
        Listing storage listing = listings[tokenId];
        require(listing.price > 0, "NFT not for sale");
        require(msg.value >= listing.price, "Insufficient payment");
        require(!listing.sold, "NFT already sold");

        listing.sold = true;
        nftContract.transferFrom(listing.seller, msg.sender, tokenId);
        payable(listing.seller).transfer(msg.value);
        emit NFTSold(tokenId, msg.sender, msg.value);
    }
}
