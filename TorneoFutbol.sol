// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Tournament {
   mapping(string => uint) private equipo_puntos;
   mapping(string => string) private equipo_jugadores;
   uint[] private _puntos;
    string[] private _jugadores;

    function addEquipo(string memory _equipo) public {
        equipo_puntos[_equipo] = 0;
        equipo_jugadores[_equipo] = "";
    }

    function addJugador(string memory _equipo, string memory _jugador) public {
        equipo_jugadores[_equipo] = string.concat(equipo_jugadores[_equipo], _jugador, ",");
    }

    function addPuntos(string memory _equipo, uint puntos) public {
        equipo_puntos[_equipo] = equipo_puntos[_equipo] + puntos;
    }

    function getPuntos(string memory _equipo) public view returns (uint) {
        return equipo_puntos[_equipo];
    }

    function getJugadores(string memory _equipo) public view returns (string memory) {
        return equipo_jugadores[_equipo];
    }

}
