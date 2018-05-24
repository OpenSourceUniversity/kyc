pragma solidity ^0.4.15;


contract Owned {
		event NewOwner(address indexed old, address indexed current);

		modifier only_owner {
		    require (msg.sender == owner);
		    _;
	  }

		function setOwner(address _new) public only_owner {
	    	emit NewOwner(owner, _new); owner = _new;
	  }

		address public owner = msg.sender;
}
