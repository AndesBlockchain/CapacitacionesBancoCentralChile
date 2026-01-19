// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contador {
    address public owner;
    uint256 public contador;

    constructor() {
        owner = msg.sender;
    }

    function incrementar() public {
        require(msg.sender == owner, "No eres el owner");
        contador++;
    }

    function getContador() public view returns (uint256) {
        return contador;
    }

    function setContador(uint256 _contador) public {
        require(msg.sender == owner, "No eres el owner");
        contador = _contador;
    }
}
