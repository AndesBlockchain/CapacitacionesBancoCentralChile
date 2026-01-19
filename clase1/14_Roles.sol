// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract Contador is AccessControl {

    uint256 public contador;

    //se crea por defecto el DEFAULT_ADMIN_ROLE
    bytes32 public constant INCREMENTER_ROLE = keccak256("INCREMENTER_ROLE");

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function incrementar() public onlyRole(INCREMENTER_ROLE) {
        contador++;
    }

    function getContador() public view returns (uint256) {
        return contador;
    }

    function setContador(uint256 _contador) public onlyRole(DEFAULT_ADMIN_ROLE) {
        contador = _contador;
    }
}