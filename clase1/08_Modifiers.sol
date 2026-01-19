// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contador {
    address public owner;
    uint256 public contador;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "No eres el owner");
        _;
    }

    function incrementar() public onlyOwner {
        contador++;
    }

    function getContador() public view returns (uint256) {
        return contador;
    }

    function setContador(uint256 _contador) public onlyOwner {
        contador = _contador;
    }
}
