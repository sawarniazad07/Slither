/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 52
 */
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;
contract Sample
{
    mapping (address => uint) public accounts;
    uint256 value;
    bool internal mutex = false;

    function deposit(uint amt) external payable {
      accounts[msg.sender] += amt;
    }

    function withdraw(uint amount) payable public {
      //<REENTRANCY>
      if(accounts[msg.sender] >= amount)
      {
        (bool res,) = msg.sender.call.value(amount)("");
        require(res, "Failed to send ethers");
        accounts[msg.sender] -= amount;
      }
    }
        
    function withdrawAll() external {
      //<UNCHECKED EXTERNAL CALL>
      require(!mutex);
      uint256 balance = accounts[msg.sender];
      if(balance > 0){
        mutex = true;
        (bool success,) = msg.sender.call.value(balance)("");
        accounts[msg.sender] = 0;
        mutex = false;
      }
    }

    function transfer(address _to, uint256 bal) external {
      //<CROSS FUNC REENTRANCY>
      if(accounts[msg.sender] >= bal){
        accounts[_to] += bal;
        accounts[msg.sender] -= bal;
      }
    }

    function delegateUser(address user, uint n) external {
      //Dangerous delegate call because the target of call is an input parameter
      (bool succ,) = user.delegatecall(abi.encodeWithSignature("setN(uint256)",n));
    }

    function getAction(uint toDelete) external payable { 
      // Block info dependency
       if(block.number != toDelete){
          value = msg.value;
       }
       value = toDelete;
    }

}