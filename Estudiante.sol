// SPDX-License-Identifier: MIT
pragma solidity <= 0.8.14;

contract Bimestre {
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private notas_materias;
    string[] private _arrayMaterias;

    constructor (string memory nombre_, string memory apellido_, string memory curso_) {
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = _curso;
        _docente = msg.sender;
    }

    function getApellido() public view returns (string memory) {
        return _apellido;
    }

    function getNombre() public view returns (string memory) {
        return _nombre;
    }

    function fullName() public view returns (string memory) {
        string memory nombreFull = getNombre();
        string memory apellidoFull = getApellido();
        string memory nombreCompleto = string.concat(nombreFull, " ", apellidoFull);
        return nombreCompleto;
    }

    function getCurso() public view returns (string memory) {
        return _curso;
    }

    function set_nota_materia (string memory _materia, uint _nota) public {
        require(msg.sender == _docente, "Solo el docente designado puede acceder a las notas");
        
        if (notas_materias[_materia] == 0){
            _array.push(_materia);
        }
        notas_materias[_materia] = _nota;
        
    }

    function nota_materia (string memory _materia) public view returns (uint) {
        return notas_materias[_materia];
    }

    function aprobo(string memory materia) public view returns (bool) {
        uint nota = nota_materia(materia);
        if(nota < 60) {
            return false;
        } else if (nota > 60 && nota < 100) {
            return true;
        }
        return false;
    }

    function promedio () public view returns (uint) {
        uint notasTotales;
        uint i;
        for(i = 0; i <= _arrayNotas.lenght; i++) {
            notasTotales += notas_materias[_arrayMaterias[i]];
        }
            
        return notasTotales / i;
    }

}