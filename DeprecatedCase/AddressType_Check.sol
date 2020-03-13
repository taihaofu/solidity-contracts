contract CheckAddressType {
    //1  if caller address or target address is a contract
    function isContract(address addr) public view  returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }
    //2  if caller is a contract
    function isHuman() public view returns (bool) {
        return msg.sender == tx.origin;
    }
}