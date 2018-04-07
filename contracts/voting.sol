pragma solidity ^0.4.19;  
contract voting {
	struct Voter{
        bool voted;
        address voter_adddress;
        uint256 proposalid;
    }
    uint256 public count=0;
    bool public voted=false;
    mapping(address => Voter) public voters;
    uint256[5] public proposals;
    address sender;
    function  increase(uint256 proposalid)  public{
   	sender=msg.sender;
    assert(voters[sender].voted == false);
    proposals[proposalid]++;
    voters[sender].voted=true;
    voters[sender].proposalid=proposalid;
    }
    function getvalue(uint256 prosid) constant public returns(uint256){
    	return proposals[prosid];
    }
    function getstatus() constant public returns(bool){
    	return voters[sender].voted;
    }
     function changevote(uint256 proposalid) public {
	     	sender=msg.sender;
	        assert(voters[sender].voted == true);
            uint256 oldproposalid=voters[sender].proposalid;
            proposals[oldproposalid]-=1;
            voters[sender].proposalid=proposalid;
            proposals[proposalid]+=1;
            
            }
        
}