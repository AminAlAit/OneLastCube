/// @description is_even(x)
/// @param x
/*
    Checks whether x is even
    
    ARGUMENTS
        x - real - number to check
        
    RETURNS
        even - boolean - (1 or -1)
*/

var param_x = argument0;

    //return whether argument0 is even or not
    if (!(param_x & 1) == 1) return 1; else return -1;