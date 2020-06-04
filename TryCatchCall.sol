pragma solidity ^0.6.0;

contract SimpleContract{
    
    function getAge(uint age) public pure returns(string memory){
        //age = 140 > 6 = ture;
        string memory errorMessage = "Under Age not allowed"; 
        require(age > 6,errorMessage);
        
    
        //age = 140 > 150 false;
        if(age > 150){
            //true body
            revert("overflow value are not allowed");
        }
        
        
        //age = 140 >=2 ture  && 140 <=105 false
        assert(age >= 2 && age <= 105 );
        return "Success";
    }
}



contract Caller{
    SimpleContract public simple = new SimpleContract();
    function doSomething(uint value) public view returns(string memory s,bool success){
        
        try simple.getAge(value) returns(string memory sRtn)
        {
            //On Success.. No error
            s = sRtn;
            success = true;
        }catch Error(string memory sError){
            //revert or require
            s = sError;
            success = false;
            
        }catch (bytes memory Error){
            //assert
            s = "Assertion failed";
            success = false;
        }
    }
}
