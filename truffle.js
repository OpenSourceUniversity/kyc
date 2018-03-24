const HDWalletProvider = require("truffle-hdwallet-provider-privkey");
var privateKey = "";
const address = "0xfa4019d8b746dd95bf1331352d39ae81dcf55465";



module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
      gas: 4612388,
    },
    kovan: {
      network_id: 42,
      provider: () => {
        return new HDWalletProvider(privateKey, "https://kovan.infura.io/NJzKz6LAvwG7gOfqEMQv")
      },
      from: address,
      gasPrice: 100000,
      gas: 4612388,
    },
  }
};
