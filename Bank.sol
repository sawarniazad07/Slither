// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;

contract Bank {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        require(msg.value > 0);
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(_amount <= balances[msg.sender]);
        require(_amount > 0);
        msg.sender.send(_amount);
        balances[msg.sender] -= _amount;
    }
}