// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BadHash {

    function computeHash(string memory _valor1, string memory _valor2) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_valor1, _valor2));
    }

}