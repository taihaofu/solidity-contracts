contract ModifierDemo {
    address public owner; 
    modifier auth {
        require(msg.sender == owner);
        _;
    }
    
    function approveRegister(address targetAddress) public auth {
        approve(targetAddress);
    }

    function approve(address targetAddress) private{

    }
}