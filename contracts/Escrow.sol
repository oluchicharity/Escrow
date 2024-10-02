// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Escrow {
    address public agent;
    address public buyer;
    address public seller;

    uint256 public depositAmount;

    constructor(address _buyer, address _seller, uint256 _depositAmount) {
        agent = msg.sender;
        buyer = _buyer;
        seller = _seller;
        depositAmount = _depositAmount;
    }

    function deposit() public payable {
        require(msg.sender == buyer, "Only the buyer can deposit funds");
        require(msg.value == depositAmount, "Incorrect deposit amount");
    }

    function releaseFundsToSeller() public {
        require(msg.sender == agent, "Only the agent can release funds");
        payable(seller).transfer(address(this).balance);
    }

    function refundBuyer() public {
        require(msg.sender == agent, "Only the agent can refund the buyer");
        payable(buyer).transfer(address(this).balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}