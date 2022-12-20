// Below is where you state your license type.
// SPDX-License-Identifier: MIT

// state your compiler
pragma solidity ^0.8.0;

// next is where you declare any contracts you intent to
// inherit from i.e. "parent" contracts.
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// state that your contracts will act like / are the 
// parent / inherited contract as such:
 contract YOURCONTRACT is ERC721, Ownable {
   // and that you are using the Counters contract
   using Counters for Counters.Counter;
   // use this to initialize the "_tokenIdCounter"
   // variable which will keep track of the individual tokens (NFTs.)
   Counters.Counter private _tokenIdCounter;
      
    // initiallize your smart contract with a constructor
    // (a line of code used only "once" in the creation of
    // your contract and never again) and name it, you must
    // also choose a symbol in all capitals, upto 5 letters
    constructor() ERC721("YOURCONTRACT", "SYM") {}
    
    // last but definitely not least, we add in the actual 
    // mint function to your contract. The workload
    function safeMint(address to) public onlyOwner {
        _safeMint(to, _tokenIdCounter.current());
        _tokenIdCounter.increment();
    }

}
