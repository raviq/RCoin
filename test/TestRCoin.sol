pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/RCoin.sol";

contract TestRcoin {

  function testInitialBalanceUsingDeployedContract() public {
    RCoin r = RCoin(DeployedAddresses.RCoin());

    uint expected = 10000;

    Assert.equal(r.getBalance(tx.origin), expected, "Owner should have 10000 RCoin initially");
  }

  function testInitialBalanceWithNewRCoin() public {
    RCoin r = new RCoin();

    uint expected = 10000;

    Assert.equal(r.getBalance(tx.origin), expected, "Owner should have 10000 RCoin initially");
  }

}
