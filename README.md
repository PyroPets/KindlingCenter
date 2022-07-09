[![GitHub license](https://img.shields.io/github/license/PyroPets/KindlingCenter)](https://github.com/PyroPets/KindlingCenter/blob/main/LICENSE.md)

# KindingCenter

KindlingCenter is a simple smart contract that allows pyros to be played with in bulk.

Since the PyroPets contract sends all MBRS to the owner of a pyro, this contract can safely iterate over an accounts pyros and call the `play(uint256)` method on the PyroBase contract with the tokenId of each pyro owned by an account.

Approve the KindlingCenter for all of an accounts PYRO tokens using the `setApprovalForAll(address,bool)` method on the PyroBase contract and simply call `playAll()`, `playGeneration(uint256)`, `playForAddr(address)` or `playGenerationForAddr(uint256,address)` method on the KindlingCenter contract to play with all of the pyros owned by the sender, or a given addresss.
