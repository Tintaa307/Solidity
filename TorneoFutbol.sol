// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Tournament {
    mapping(string => string) private jugadores_equipo;
    mapping(string => uint256) private puntos_equipo;
    string[] private _jugadores;

    function set_jugadores_equipo(string memory jugador_) public {
        if (keccak256(abi.encodePacked(jugadores_equipo[jugador_])) == "") {
            _jugadores.push(jugador_);
        }
    }

    function delete_jugadores_equipo(string memory jugador_) public {
        for (uint256 i = 0; i < _jugadores.length; i++) {
            if (
                keccak256(abi.encodePacked(jugadores_equipo[_jugadores[i]])) ==
                keccak256(abi.encodePacked(jugador_))
            ) {
                delete _jugadores[i];
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
            puntos_equipo[equipo1_] += 3;
            puntos_equipo[equipo2_] += 0;
        } else if (goles1_ < goles2_) {
            puntos_equipo[equipo1_] += 0;
            puntos_equipo[equipo2_] += 3;
        } else {
            puntos_equipo[equipo1_] += 1;
            puntos_equipo[equipo2_] += 1;
        }
    }

    function get_puntos_equipo(string memory equipo_)
        public
        view
        returns (uint256)
    {
        return puntos_equipo[equipo_];
    }

    function get_jugadores_equipo() public view returns (string[] memory) {
        string[] memory jugadores_totales;
        for (uint256 i = 0; i < _jugadores.length; i++) {
            jugadores_totales[i] = jugadores_equipo[_jugadores[i]];
        }
        return jugadores_totales;
    }

    function puntero() public view returns (string memory) {
        uint256 mayor_puntos = 0;
        string memory _equipo_mayor_puntos = "";
        for (uint256 i = 0; i < _jugadores.length; i++) {
            if (puntos_equipo[_jugadores[i]] > mayor_puntos) {
                mayor_puntos = puntos_equipo[_jugadores[i]];
                _equipo_mayor_puntos = jugadores_equipo[_jugadores[i]];
            }
        }
        return _equipo_mayor_puntos;
    }
}
