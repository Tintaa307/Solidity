// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Tournament {
    mapping(string => string[]) private jugadores_equipo;
    mapping(string => uint256[]) private puntos_equipo;
    string private _equipo;

    constructor(string memory equipo_) {
        _equipo = equipo_;
    }

    function getEquipo() public view returns (string memory) {
        return _equipo;
    }

    function set_jugador_equipo(string memory jugador_, string memory equipo_)
        public
    {
        jugadores_equipo[equipo_].push(jugador_);
    }

    function delete_jugadores_equipo(string memory jugador_) public {
        for (uint256 i = 0; i < jugadores_equipo[jugador_].length; i++) {
            if (
                keccak256(abi.encodePacked(jugadores_equipo[jugador_][i])) ==
                keccak256(abi.encodePacked(jugador_))
            ) {
                delete jugadores_equipo[jugador_][i];
            }
        }
    }

    function set_puntos_equipo(
        string memory equipo1_,
        string memory equipo2_,
        uint256 goles1_,
        uint256 goles2_
    ) public {
        if (goles1_ > goles2_) {
            puntos_equipo[equipo1_].push(3);
            puntos_equipo[equipo2_].push(0);
        } else if (goles1_ < goles2_) {
            puntos_equipo[equipo1_].push(0);
            puntos_equipo[equipo2_].push(3);
        } else {
            puntos_equipo[equipo1_].push(1);
            puntos_equipo[equipo2_].push(1);
        }
    }

    function get_puntos_equipo(string memory equipo_)
        public
        view
        returns (uint256)
    {
        uint256 suma = 0;
        for (uint256 i = 0; i < puntos_equipo[equipo_].length; i++) {
            suma += puntos_equipo[equipo_][i];
        }
        return suma;
    }

    function get_jugadores_equipo() public view returns (string[] memory) {
        string[] memory jugadores = new string[](
            jugadores_equipo[_equipo].length
        );
        for (uint256 i = 0; i < jugadores_equipo[_equipo].length; i++) {
            jugadores[i] = jugadores_equipo[_equipo][i];
        }
        return jugadores;
    }

    function equipo_mas_puntos() public view returns (string memory) {
        uint256 puntos_max = 0;
        string memory equipo_max = "";
        for (uint256 i = 0; i < puntos_equipo[_equipo].length; i++) {
            if (get_puntos_equipo(_equipo) > puntos_max) {
                puntos_max = get_puntos_equipo(_equipo);
                equipo_max = _equipo;
            }
        }
        return equipo_max;
    }
}
