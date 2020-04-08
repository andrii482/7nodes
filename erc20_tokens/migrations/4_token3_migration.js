const Token = artifacts.require("ERCToken");

module.exports = function(deployer) {
  deployer.deploy(Token, 'Monero', 'XMR', 100000000, '0xD85fCA5D2460C6f45A8f28c29d04eE06ad6E3Bf7');
};
