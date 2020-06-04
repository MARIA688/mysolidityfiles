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
