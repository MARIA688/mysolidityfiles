pragma solidity ^0.5.0;
/*
1. Start with 0.5
2. Create fallback with payable to accept Ether
3. Create fallback without payable so Ether transfer failed
4. 
*/
contract SimpleContract{
    uint public callCounter = 0;
    event log(uint);
   
    function doSomething() public{
        callCounter++;
    }
    //fallback method 0.5;
    function() payable external{
        emit log(gasleft());
        doSomething();
        emit log(gasleft());
    }
    

}

contract CallContract{

    function pay(address payable adr) payable public returns(uint) {
        
        (adr).transfer(msg.value);
        return adr.balance;
    }
    
    /*
    function runDoSomething(address adr) public payable returns(bool success, bytes memory data,uint balance) {
        
        bytes memory payload = abi.encodeWithSignature("doSomething1()");
        (success,data) = adr.call.value(msg.value)(payload);
        balance = adr.balance;
    }
    */
    
}
