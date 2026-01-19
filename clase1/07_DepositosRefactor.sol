// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Depositos {

    mapping(address => uint256) public saldos;

    function depositar() public payable {
        saldos[msg.sender] += msg.value;
    }

    function retirar(uint256 _cantidad) public {
        require(saldos[msg.sender] >= _cantidad, "Saldo insuficiente");
        saldos[msg.sender] -= _cantidad;
        payable(msg.sender).call{value: _cantidad};
    }

    function getSaldo(address _direccion) public view returns (uint256) {
        return saldos[_direccion];
    }

}