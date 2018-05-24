pragma solidity ^0.4.24;

import './Certifier.sol';
import './Owned.sol';


contract OsuCertifier is Owned, Certifier {
    mapping (address => bool) certs;

    function certified(address _who) public constant returns (bool) {
        return certs[_who];
    }

    function certify(address _who) public only_owner {
    		certs[_who] = true;
    		emit Confirmed(_who);
  	}

    function revoke(address _who) public only_owner {
    		certs[_who] = false;
    		emit Revoked(_who);
  	}

    // Unused methods
    function get(address, string) public constant returns (bytes32) {}
    function getAddress(address, string) public constant returns (address) {}
    function getUint(address, string) public constant returns (uint) {}
}
