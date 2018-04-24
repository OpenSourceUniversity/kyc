pragma solidity ^0.4.15;

import './Certifier.sol';
import './Owned.sol';


contract OsuCertifier is Owned, Certifier {

    Certifier public picopsCertifier;

    function OsuCertifier() public {
      picopsCertifier = Certifier(0x1e2F058C43ac8965938F6e9CA286685A3E63F24E);
    }

    function certified(address _who) public constant returns (bool) {
      if (certs[_who]) {
        return certs[_who];
      } else {
        return picopsCertifier.certified(_who);
      }
    }

    function certify(address _who) public only_owner {
  		certs[_who] = true;
  		Confirmed(_who);
  	}

    function revoke(address _who) public only_owner {
  		certs[_who] = false;
  		Revoked(_who);
  	}

    // Unused methods
    function get(address, string) public constant returns (bytes32) {}
    function getAddress(address, string) public constant returns (address) {}
    function getUint(address, string) public constant returns (uint) {}

    mapping (address => bool) certs;
}
