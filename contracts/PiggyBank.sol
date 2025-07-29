// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PiggyBank {
    // Mapping to track each user's balance
    mapping(address => uint256) private userBalance;

    event DepositMade(address indexed user, uint256 amount, uint256 newBalance, uint256 timestamp);
    event WithdrawalMade(address indexed user, uint256 amount, uint256 newBalance, uint256 timestamp);

    // Function to deposit money into the piggy bank
    function deposite(uint256 _amount) external {
        require(_amount > 0, "Deposit amount must be greater than zero.");
        
        // Increase the user's balance
        userBalance[msg.sender] += _amount;
        
        // Emit the event
        emit DepositMade(msg.sender, _amount, userBalance[msg.sender], block.timestamp);
    }

    // Function to withdraw money from the piggy bank
    function withdraw(uint256 _amount) external {
        require(_amount > 0, "Withdrawal amount must be greater than zero.");
        require(userBalance[msg.sender] >= _amount, "Insufficient balance.");
        
        // Decrease the user's balance
        userBalance[msg.sender] -= _amount;

        // Emit the event
        emit WithdrawalMade(msg.sender, _amount, userBalance[msg.sender], block.timestamp);
    }

    // Function to check the current balance of the user
    function getBalance() external view returns (uint256) {
        return userBalance[msg.sender];
    }
}
