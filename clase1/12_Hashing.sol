// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Calculator {

    function computeHash(string memory _secreto) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_secreto));
    }

}

contract Hashing {

    bytes32 public hashMensaje;

    constructor(bytes32 _mensaje) payable {
        hashMensaje = _mensaje;
    }

    function giveMeTheMoney(string memory _mensaje) public {
        require(keccak256(abi.encodePacked(_mensaje)) == hashMensaje, "No sabes el secreto...");
        (bool result, )=payable(msg.sender).call{value: address(this).balance}("");
        require(result,"Problema transfiriendo");
    }

}