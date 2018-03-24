var OsuCertifier = artifacts.require("./OsuCertifier.sol");

module.exports = function(deployer) {
  deployer.deploy(OsuCertifier);
};
