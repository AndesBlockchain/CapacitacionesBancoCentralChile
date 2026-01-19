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

abstract contract ContadorAbstract {

    uint256 public contador;

    function incrementar()  external {
        contador++;
    }

    function getContador() external view virtual returns (uint256);
    function setContador(uint256 _contador) virtual external;
}

contract Contador is Ownable, IContador {
    uint256 public contador;

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

contract Contador2 is Ownable, ContadorAbstract {

    function getContador() public view override returns (uint256) {
        return contador;
    }

    function setContador(uint256 _contador) public onlyOwner override {
        contador = _contador;
    }
}