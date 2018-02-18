Truffle v4.0.6 - a development framework for Ethereum

Usage: truffle <command> [options]

### Commands:

  **init**      Initialize new and empty Ethereum project<br/>  
  **compile**   Compile contract source files<br/>
  **migrate**   Run migrations to deploy contracts<br/>
  **deploy**    (alias for migrate)<br/>
  **build**     Execute build pipeline (if configuration present)<br/>
  **test**      Run JavaScript and Solidity tests<br/>
  **debug**     Interactively debug any transaction on the blockchain (experimental)<br/>
  **opcode**    Print the compiled opcodes for a given contract<br/>
  **console**   Run a console with contract abstractions and commands available<br/>
  **develop**   Open a console with a local development blockchain<br/>
  **create**    Helper to create new contracts, migrations and tests<br/>
  **install**   Install a package from the Ethereum Package Registry<br/>
  **publish**   Publish a package to the Ethereum Package Registry<br/>
  **networks**  Show addresses for deployed contracts on each network<br/>
  **watch**     Watch filesystem for changes and rebuild the project automatically<br/>
  **serve**     Serve the build directory on localhost and watch for changes<br/>
  **exec**      Execute a JS module within this Truffle environment<br/>
  **unbox**     Download a Truffle Box, a pre-built Truffle project<br/>
  **version**   Show version number and exit<br/>

See more at http://truffleframework.com/docs

-------------------------------------------------

Truffle is a tool set fFramework for working with smart contracts. 
it has tools that allow: compile and build, testing, deployment, and interaction with the SC.

## installation

to install

```npm i -g truffle```

## project set up

to start a new proj with rtuffle

```truffle init```

## workflow 

new contracts should be in .sol files in dir "contracts"

to deploy new contract add to file "/migrations/1_initial_migration.js":
and same thing for file "/migrations/2_deploy_contracts.js"
```js
var ContractName = artifacts.require("./contractfilename.sol");
module.exports = function(deployer){
	deployer.deploy(ContractName);
}
```

start testrpc network and add the network to truffle.js file"

```js 
module.exports = {
	networks: {
		development: {
			host: "localhost",
			port: 8545,
			network_id: "*" // Match any network id
		}
	}
};
```

## compilation 

then we can compile:

``` truffle compile```

## deployement to blockchain

this creates a build in "build/contracts" dir. 

now we can deploy the contract to the blockchain by 

```truffle migrate```

successful deployent will output the contract hash-address on the blockchain

``` 
HelloWorldContract: 0x0d73c4a1a92b8cd0ca2d066bf0ff38a03a047b6b
Saving successful migration to network...
  ... 0xf38e2a75ac4ffbc434a6990e41fe73d046616af73c4ae1f0aa8ec13f5ddbebe6
Saving artifacts...
```

To deploy to real blockchain:
open truffle.js and create second locatin called "production" instead "development"
then run `truffle complie` again and then migrate with network-location as param `truffle migrate --network production`

## console interaction with contract

To interact with deployed contract we can use truffle console, to enter into console mode:

```truffle console```

to console to a production blockchain instead the development, pass the network param based on truffle.js settings:

```truffle console --network production```

then we'll use js to interact with the contract

>var hw;

>HelloWorldContract.deployed().then( function(deployed) { hw = deployed; });

>hw.sayHello.call(); //sayHello is a function in our contract. getters are called by adding ".call()", setters called like normal func();

to get a deployed contract id/address/hash: (from inside the console)
`ContractNameContract.deployed();` will output json, at the bottom there is the address: `address: '0x8ddbe991c6d2787841248232d494b9846fd44b2c',`




