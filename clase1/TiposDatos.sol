// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TiposDatos {

    uint8 public numeroChico;
    uint256 public numeroGrande;
    uint public numeroGrande2;

    bytes8 public texto;
    bytes32 public textoLargo;

    bool public boolean;

    address public direccion;

    string public textoVariable;

    struct Persona {
        uint edad;
        string nombre;
    }

    Persona public persona;

    mapping(address => uint) public saldos;

    uint[] public numeros;

    uint public constant VALOR=4;

    enum Estado{Pendiente, Aprobado, Rechazado}

    Estado public estado; //solo puede tomar los valores de la enum

    //tiempo
    uint public timestamp = block.timestamp;
    

}