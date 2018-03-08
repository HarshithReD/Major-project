pragma solidity ^0.4.19;  
contract voting {
    uint256 count=0;
    function increase() public returns (uint256){
    count++;
    return count;
    }
}