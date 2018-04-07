pragma solidity ^0.4.19;
contract votingcontract{
    struct Voter{
        bool voted;
        address voter_adddress;
        uint256 proposalid;
    }
    struct Proposal{
        uint256 votecount;
    }
    
    mapping(address => Voter) voters;
    Proposal[] proposals;
    function castvote(address sender,uint256 proposalid) constant public {
       if(!voters[sender].voted||proposalid>=proposals.length){
            voters[sender].voted=true;
            proposals[proposalid].votecount+=1;
            voters[sender].proposalid=proposalid;
            
            
        }
        
    }
    function changevote(uint256 proposalid,address sender) public {
        if(voters[sender].voted||proposalid>=proposals.length){
           uint256 oldproposalid=voters[sender].proposalid;
            proposals[oldproposalid].votecount-=1;
            voters[sender].proposalid=proposalid;
            proposals[proposalid].votecount+=1;
            
            
        }
        
        
    }
    function setproposalslength(uint256 len) public{
        proposals.length=len;
    }
    function getproposallength() public returns (uint256){
        return proposals.length;
    }
    function getproposalcount(uint256 proposalid) constant public returns (uint256){
        return proposals[proposalid].votecount;
        
    }
    
    
}