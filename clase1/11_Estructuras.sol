// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EstructurasDatos {

    struct Persona {
        uint edad;
        string nombre;
    }

    Persona public persona;

    function setPersona(uint _edad, string memory _nombre) public {
        persona = Persona(_edad, _nombre);
    }

    function getPersona() public view returns (uint, string memory) {
        return (persona.edad, persona.nombre);
    }





    Persona[] public personas;

    function addPersona(uint _edad, string memory _nombre) public {
        personas.push(Persona(_edad, _nombre));
    }

    function getPersonaIndex(uint _index) public view returns (uint, string memory) {
        return (personas[_index].edad, personas[_index].nombre);
    }




    mapping(address=>Persona) public personasPorDireccion;

    function setPersonaDireccion(uint _edad, string memory _nombre) public {
        personasPorDireccion[msg.sender] = Persona(_edad, _nombre);
    }

    function getPersonaDireccion(address _direccion) public view returns (uint, string memory) {
        return (personasPorDireccion[_direccion].edad, personasPorDireccion[_direccion].nombre);
    }
}