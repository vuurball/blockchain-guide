### Proof of Work
It is a simple method for proving that you have *probably* performed a large number of mathematical operations. It is implemented in the majority of cases using a cryptographic hash function; given an arbitrary piece of data, (like a list of transactions and the header of a block) you must find a second piece of data which, when combined with the first, produces a hash that has certain characteristics (like a number of trailing zeros). Because it is impossible to predict what second piece of data will produce the required hash, you must randomly iterate through possible data until you find one that produces the hash you require.

### Proof of stake
--todo


### Smart contract

If-This-Than-That logic program, on to the blockcahin and run by all the computer nodes on that system which automatically then updates the transparent lefger that everyone can see.
It's a pre-written code on the blockchain that can execute a bunch of different actions.

### Solidity
language for writing smart contracts on the ethereum blockchain.
online compilers: https://remix.ethereum.org

### Truffle
--todo

### RPC
--todo

### Gas
--todo

### testrpc
testrpc networkstrpc
https://github.com/trufflesuite/ganache-cli
this allows us to spun a virtual blockchain in memory and play with it, without needing to install a real blockchain
install based on repo readme intructions:
>npm install -g ganache-cli
open new terminal and start the testrpc by typing:
>ganache-cli
this will run a blockchain on localhost:8545
to connect to it we'll use web3.js lib


### web3.js
js library that allows us to connect to the blockchain
https://github.com/ethereum/web3.js/
use 1.0 version not the developer branch
add to project with:
>yarn add web3
or
>npm i web3 --save

## Ethereum Technologies

### Ethereum Virtual Machine

The Ethereum Virtual Machine is the primary innovation of the Ethereum project. This is a virtual machine designed to be run by all participants in a peer to peer network, it can read and write to a blockchain both executable code and data, Verify digital signatures, and is able to run code in a quasi-Turing complete manner. It will only execute code when it receives a message verified by a digital signature, and the information stored on the blockchain tells it is appropriate to do so.

### The Decentralized Consensus Network and the Generalised Blockchain

Ethereum is a peer to peer network where every peer stores the same copy of a blockchain database and runs an Ethereum virtual machine to maintain and alter it’s state. Proof of work is integrated into the blockchain technology by making the creation of a new block require all members of the network undertake the proof of work. Consensus is achieved via incentivization for peers to always accept the longest chain of blocks in the blockchain by distribution of a cryptographic token of value: ‘ether’.
