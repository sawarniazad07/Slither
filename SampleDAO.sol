// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
contract SampleDAO {
   mapping(address => uint) public accounts;


   function donate(uint amt) public payable {
       accounts[msg.sender] += amt;
   }


   function withdraw(uint amount) payable public {
       if( accounts[msg.sender] >= amount ){
       (bool sent,)  = msg.sender.call.value(amount)("");
       require(sent, "Failed to send Ether");
       accounts[msg.sender] -= amount;
	}
   }
}
