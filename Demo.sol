// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
contract Sample{
    // int32 number;
    // // int mul;
    // function addition(int32 a, int32 b) payable public returns(int32){
    //     int32 mul;
    //     number = a + b ;
    //     for(int32 i = number; i < 100; i = i + 1)
    //     {
    //         number = number + i;
    //     }
    //     mul= mul + a;
    //     number = mul +number;         
    //     return number;
    // }

    // mapping (int => int) tmp;

    function fun(int32 a, int32 b) payable public returns(int32){
        int32 mul;
        require (a >= 0);
        require (b >= 0);  
        if(a == 0){
            b = 100;
            // tmp [a] = b;
        }
        else if (a == 1){
            b = 1000;
            // tmp [a] = b;
        }
        else{
            b = 10000;  
            // tmp [a] = b;
        }      
        
        while (b > 500){
            // require (b <100000 && mul > 0);
            mul = mul + a * b ;
            b = b/2;
            // mul += tmp[b];
        }

        assert (b < 11000);

        // assert(mul >= 10);
        return mul;
    //    return b; 
    }

   
}


