// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleEscrow {
    address public payer;
    address public payee;
    address public arbiter;
    uint256 public amount;

    constructor(address _payer, address _payee, address _arbiter, uint256 _amount) {
        payer = _payer;
        payee = _payee;
        arbiter = _arbiter;
        amount = _amount;
    }

    function release() public {
        require(msg.sender == arbiter, "Only the arbiter can release funds.");
        payable(payee).transfer(amount);
    }

    function refund() public {
        require(msg.sender == arbiter, "Only the arbiter can refund funds.");
        payable(payer).transfer(amount);
    }
}