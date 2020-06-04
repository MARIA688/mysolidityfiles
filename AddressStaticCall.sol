pragma solidity ^0.6.0;

contract SimpleContract{
    uint public callCounter = 0;
    function doSomething() public{
        callCounter++;
    }
    
    function doSomething(uint8 a) public pure returns(uint _a){
        _a = ++a;
    }
}

contract CallerCall{
    //this will run successfully and increment the callCounter of SimpleContract
    function runCall(address adr) public returns(bool success, bytes memory data) {
        
        bytes memory payload = abi.encodeWithSignature("doSomething()");
        (success,data) = adr.call(payload);
    }
    
    //this will failed since SampleContract.doSomething changing state varilable
    function runStaticCall(address adr) public returns(bool success, bytes memory data) {
        
        bytes memory payload = abi.encodeWithSignature("doSomething()");
        (success,data) = adr.staticcall(payload);
        
    }
    
    //this will failed since SampleContract.doSomething changing state varilable
    
    function runStaticCall2(address adr) public returns(uint a, bool success, bytes memory data) {
        
        bytes memory payload = abi.encodeWithSignature("doSomething(uint8)",2);
        (success,data) = adr.staticcall(payload);
        a = abi.decode(data,(uint));
        
    }
    
    
    
}
