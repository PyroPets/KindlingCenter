// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@pyropets/pyropets-contracts/contracts/PyroBase.sol";

contract KindlingCenter {
    PyroBase public base;

    constructor(PyroBase _base) {
        base = _base;
    }

    function playAll() public {
        bool approved = base.isApprovedForAll(msg.sender, address(this));
        require(approved == true, "KindlingCenter: Not approved");
        uint256 balance = base.balanceOf(msg.sender);
        for (uint256 i = 0; i < balance; i++) {
            uint256 tokenId = base.tokenOfOwnerByIndex(msg.sender, i);
            uint256 lastPlayed = base.lastPlayed(tokenId);
            if (lastPlayed + 1 days < block.timestamp) {
                base.play(tokenId);
            }
        }
    }

    function playAllForAddr(address owner) public {
        bool approved = base.isApprovedForAll(owner, address(this));
        require(approved == true, "KindlingCenter: Not approved");
        uint256 balance = base.balanceOf(owner);
        for (uint256 i = 0; i < balance; i++) {
            uint256 tokenId = base.tokenOfOwnerByIndex(owner, i);
            uint256 lastPlayed = base.lastPlayed(tokenId);
            if (lastPlayed + 1 days < block.timestamp) {
                base.play(tokenId);
            }
        }
    }

    function playGenerationForAddr(uint256 generation, address owner) public {
        bool approved = base.isApprovedForAll(owner, address(this));
        require(approved == true, "KindlingCenter: Not approved");
        uint256 balance = base.balanceOf(owner);
        for (uint256 i = 0; i < balance; i++) {
            uint256 tokenId = base.tokenOfOwnerByIndex(owner, i);
            uint256 lastPlayed = base.lastPlayed(tokenId);
            if (lastPlayed + 1 days < block.timestamp) {
                uint256 gen = base.generationOfPyro(tokenId);
                if (gen == generation) {
                    base.play(tokenId);
                }
            }
        }
    }

    function playGeneration(uint256 generation) public {
        bool approved = base.isApprovedForAll(msg.sender, address(this));
        require(approved == true, "KindlingCenter: Not approved");
        uint256 balance = base.balanceOf(msg.sender);
        for (uint256 i = 0; i < balance; i++) {
            uint256 tokenId = base.tokenOfOwnerByIndex(msg.sender, i);
            uint256 lastPlayed = base.lastPlayed(tokenId);
            if (lastPlayed + 1 days < block.timestamp) {
                uint256 gen = base.generationOfPyro(tokenId);
                if (gen == generation) {
                    base.play(tokenId);
                }
            }
        }
    }
}
