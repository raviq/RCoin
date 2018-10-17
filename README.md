
## RCoin

This is just a simple example of a coin-like contract. It is not standards compatible and cannot talk to other
coin/token contracts. If you want to create a standards-compliant token, check [ConsenSys/Tokens](https://github.com/ConsenSys/Tokens).

## Starting point


Important files:
- `contracts/RCoin.sol` is a smart contract (written in Solidity) that creates a RCoin token.
- `contracts/Migrations.sol file` manages and updates the status of your deployed smart contract. This file comes with every [Truffle](https://truffleframework.com/) project, and is usually not edited.
- `truffle.js` is the Truffle configuration file, for setting network information and other project-related settings. The file is blank, but this is okay, as we will be using a Truffle command that has some defaults built-in.
- `test/TestRcoin.sol`  is a test file written in Solidity which ensures that your contract is working as expected.
- `test/rcoin.js` is a test file written in JavaScript which performs a similar function to the Solidity test above.

Running the solidity test: `truffle test ./test/TestRCoin.sol`

Running the JavaScript test: `truffle test ./test/RCoin.js`

*Compiling* the smart contracts: `truffle compile`

Migrating:

- Migrating with Truffle Develop:
To deploy our smart contracts, we're going to need to connect to a blockchain. Truffle has a built-in personal blockchain that can be used for testing. This blockchain is local to your system and does not interact with the main Ethereum network. You can create this blockchain and interact with it using Truffle Develop: `truffle develop`

then, on truffle develop prompt type `migrate`. The output will show the transaction IDs and addresses of your deployed contracts.

- Migrating with Ganache, a desktop application, to launch your personal blockchain.

Edit `truffle.js` content to the following to allow a connection using Ganache's default connection parameters.

from 

```
module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
};
```

to


```
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    }
  }
};
```

Then launch Ganache (...)

To interact with the contract, you can use the Truffle console. The Truffle console is similar to Truffle Develop, except it connects to an existing blockchain (in this case, the one generated by Ganache).

On the terminal, migrate the contract to the blockchain created by Ganache: `truffle migrate`. Ganache has to run.

```
truffle console
```

Example of commands:

```
RCoin.deployed().then(function(instance){return instance.getBalance(web3.eth.accounts[0]);}).then(function(value){return value.toNumber()});
RCoin.deployed().then(function(instance){return instance.getBalanceInEth(web3.eth.accounts[0]);}).then(function(value){return value.toNumber()});
RCoin.deployed().then(function(instance){return instance.sendCoin(web3.eth.accounts[1], 500);});
RCoin.deployed().then(function(instance){return instance.getBalance(web3.eth.accounts[1]);}).then(function(value){return value.toNumber()});
RCoin.deployed().then(function(instance){return instance.getBalance(web3.eth.accounts[0]);}).then(function(value){return value.toNumber()});
```



