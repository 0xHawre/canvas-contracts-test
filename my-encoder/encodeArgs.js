const Web3 = require('web3').default; // Correct import for web3@4.x

// Create a new instance of Web3
const web3 = new Web3("http://localhost:8545"); // Replace with your actual RPC URL

// Your resolver address and token URI
const resolverAddress = "0x4560FECd62B14A463bE44D40fE5Cfd595eEc0113"; // Your resolver address
const tokenURI = "https://0xhawre.xyz/badges/badge.json"; // Your token URI

// Encode the constructor arguments
const encodedArgs = web3.eth.abi.encodeParameters(
    ['address', 'string'],
    [resolverAddress, tokenURI]
);

console.log(encodedArgs);
