const OPStackFork = artifacts.require("OPStackFork");

module.exports = function (deployer) {
  deployer.deploy(OPStackFork, { gas: 8000000 });
};
