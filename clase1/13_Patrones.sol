// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Ownable} from "./Ownable.sol";

//(solo las firmas de las funciones, no se puede poner logica)
//Usese para APIs
interface IContador {
    function incrementar() external;
    function getContador() external view returns (uint256);
    function setContador(uint256 _contador) external;
}

contract Pausable is Ownable {
    bool public paused;

    modifier notPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }
}

contract Contador is Pausable, IContador {

    uint256 public contador;

    function incrementar() public notPaused {
        contador++;
    }

    function getContador() public view returns (uint256) {
        return contador;
    }

    function setContador(uint256 _contador) public notPaused onlyOwner {
        contador = _contador;
    }
}