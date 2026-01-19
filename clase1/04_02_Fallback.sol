// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EjemploFallback {

    event EtherRecibido(address indexed _emisor, uint _cantidad);

    fallback() external {
        //Codigo si se llama una funcion que no existe       
    }

    receive() external payable {
        //Codigo si se envia ether      
        emit EtherRecibido(msg.sender, msg.value); 
    }
    
}