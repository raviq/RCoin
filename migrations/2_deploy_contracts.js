var ConvertLib = artifacts.require("./ConvertLib.sol");
var RCoin = artifacts.require("./RCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, RCoin);
  deployer.deploy(RCoin);
};
