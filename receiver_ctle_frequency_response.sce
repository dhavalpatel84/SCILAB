// Ctle frequency reponse model for PCIE- GEN3 receiver
//
//               ( s + wp1 * adc )
// H(s) = wp2 * --------------------------- 
//               ( s + wp1 ) * ( s + wp2 )
//
//
//

// for 8 GT/s
fp1 = 2E+09 ; // 2 Ghz
fp2 = 8E+09 ; // 8 Gh
 
Adc_db = - 6 ;  //  -6 db dc gain 

wp1 = 2 * %pi * fp1 ; 
wp2 = 2 * %pi * fp2 ;

Adc = 10 ^ ( -6 / 20 );

for n= 1E+08:2E+08:1E+09 
   H(n) = wp2 * ( 2 * %pi * n + wp1 * Adc ) / ( (2 * %pi * n + wp1 )* ( 2 * %pi * n + wp2 )) ;
   disp(H(n));
end 

plot(H);






