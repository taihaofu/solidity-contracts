contract test {
    event callFullback(address);
    function () public payable {
        emit callFullback(msg.sender);
    }
}

/**
 *  serveral ways for fallback trigger
 */
contract Caller {
    function callTest(Test test) public {
        // first
        (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        require(success);
        success = address(test).call.value(1 trx)();
        require(success);
        //second
        address(test).send(2 trx);
        address(test).transfer(2 trx);
    }
}
