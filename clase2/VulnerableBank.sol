// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
CONTRATO VULNERABLE A REENTRANCY
NO USAR EN PRODUCCION
 */
contract VulnerableBank {

    mapping(address => uint256) public balances;

    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);

    function deposit() external payable {
        require(msg.value > 0, "Must deposit some ETH");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw() external {
        uint256 balance = balances[msg.sender];
        require(balance > 0, "Insufficient balance");
        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Transfer failed");
        balances[msg.sender] = 0;

        emit Withdrawal(msg.sender, balance);
    }

    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }

    function getTotalBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
