contract constructorDemo {
    
    constructor (address owner) public payable {
        Defi defi = new Defi();
        defi.init();
    }
}

contract Defi {
    function init() public {

    }
}