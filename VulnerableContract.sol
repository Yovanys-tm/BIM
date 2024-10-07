// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VulnerableContract {
    uint256 public balance;

    // Cualquier persona puede cambiar el balance usando esta función
    function updateBalance(uint256 _newBalance) public {
        balance = _newBalance;
    }

    // Una función interna mal gestionada
    function withdrawFunds() internal {
        // El balance del contrato se transfiere al msg.sender sin verificación adecuada
        payable(msg.sender).transfer(balance);
        balance = 0;
    }

    // Función pública sin acceso protegido, que permite que cualquiera llame a la función interna
    function exploitWithdraw() public {
        withdrawFunds();
    }

    // Función para depositar ETH en el contrato
    function deposit() public payable {
        balance += msg.value;
    }

    // Fallback para aceptar ETH
    receive() external payable {
        balance += msg.value;
    }
}
