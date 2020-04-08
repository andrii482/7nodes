const Token = artifacts.require("ERCToken");

module.exports = function(deployer) {
  deployer.deploy(Token, 'Tezos', 'XTZ', 100000000, '0x3984fbc0af90C71d349F565eC8536a8Ab2A5C702');
};
