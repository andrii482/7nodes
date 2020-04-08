const Token = artifacts.require("ERCToken");

module.exports = function(deployer) {
  deployer.deploy(Token, 'Litecoin', 'LTC', 100000000, '0xc8310DAEb11ba13f2A052d00bAb5BB0c9c6896Ba');
};
