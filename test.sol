pragma solidity ^0.6.2;
contract Sample{
    	int result;
		// address addr;
		// // int answer;
		// mapping (address => int) m;
	function factorial(int number) payable public returns(int){  
		// result = number + 10;    
		int answer;
		for(answer = 1; number>1;number--){
      		answer = answer * number;
			// m[addr] = answer;
        	}
        result = answer;
		// require(msg.value>0); this is not handled in CFG
		return result;
	}

	function factorial1(int number) public returns(int){      
		int answer;
		for(answer = 1; number>1;number--){
      		answer = answer * number;
        	}
        result = answer;
        return result;
		// answer = answer * number;
	}

}

// Here the below contract is used for checking the ast generated by solcx compiler
// contract Demo{
// 	int dummy;
// 	function customise_address(int x) public returns(int){
// 		dummy = x+20;
// 	}
// }