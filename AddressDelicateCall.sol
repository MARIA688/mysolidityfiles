pragma solidity ^0.6.0;

contract SimpleContract{
    uint public callCounter = 0;
    function doSomething() public{
        callCounter++;
    }
}

contract CallerCall{
    uint public callCounter = 0;
    
    //callConter of SimpleContract will increment on Success
    function runCall(address adr) public returns(bool success, bytes memory data) {
        
        bytes memory payload = abi.encodeWithSignature("doSomething()");
        (success,data) = adr.call(payload);
    }
    
    //Local callCouter will increment instead of SimpleContract.CallCounter;
    function runDelegate(address adr) public returns(bool success, bytes memory data) {
        
        bytes memory payload = abi.encodeWithSignature("doSomething()");
        (success,data) = adr.delegatecall(payload);
    }
    
    
    
}
