// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contador {
    uint256 public contador;

    function incrementar() public {
        contador++;
    }

    function getContador() public view returns (uint256) {
        return contador;
    }

    function setContador(uint256 _contador) public {
        contador = _contador;
    }

}