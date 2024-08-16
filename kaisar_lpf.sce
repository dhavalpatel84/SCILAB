
clear ;
clc ;
close ;

fs   = input ("sampling frequency:");
fst  = input ("stopband frequency:");
fp   = input ("passband frequency:");
wsf  = 2*%pi*fs ; // r a d / s e c
ws   = 2*%pi*fst; // r a d / s e c
wp   = 2*%pi*fp ; // r a d / s e c

as   = input ("attenuation stopband"); //120.0 / gain_div_factor ;//dB
ap   = input ("attenuation passband"); //30/ gain_div_factor  ; //dB

B = ws - wp ;         // bandwidth 
wc =0.5*( ws + wp ) ; // cut-off frequency
wc1 = wc *2* %pi / wsf ;
delta1 =10^( -0.05* as ) ;
delta2 =(10^(0.05* as ) -1) /(10^(0.05* as ) +1) ;
delta = min ( delta1 , delta2 ) ;
alphas = -20* log10 ( delta ) ;
alpha =0.5842*( alphas -21) ^0.4+0.07886*( alphas -21)
D =(alphas -7.95) /14.36;
N1 = wsf * D / B +1;
N = ceil(N1) ;
U = ceil(N/2) ;
disp(N);
disp(U);
win_l = window ("kr",N+1,alpha ) ;
for n = -floor(N/2)+U+1:1:floor(N/2)+U+1
if (n == ceil(N/2) ) then  
hd(n) =0.5;
else
hd(n) = (sin(%pi*(n-U)/2))/(%pi*(n-U)) ;
end
h(n) = hd(n) * win_l(n) ;
disp(n)
end
[hzm , fr ]= frmag ( h ,256) ;
hzm_dB = 20* log10 ( hzm ) ./ max ( hzm ) ;
figure
plot (2* fr , hzm_dB )
a = gca () ;
xlabel ( "F r e q u e n c y  w∗pi");
ylabel ( "Magnitude i n dB" ) ;
title ( "F r e q u e n c y R e s p o n s e o f g i v e n LPF u s i n g K a i s e r Window") ;
xgrid (2) ;
disp (h,"FilterCoefficie n t s  h ( n )" ) ;
disp (length(h));

// i was trying to map those values within resolution
//
//h_max = max(h);
//h_min = min(h);
//
//h_factor_actual = ( h_max - h_min ) / length(h) ;
//
//h_min_assumed = 0.000001 ;
//h_max_assumed = h_max    ;
//
//h_factor_assumed = ( h_max_assumed - h_min_assumed ) / length(h) ;
//
//for i=1:length(h);
//h_digital(i) = ( h(i) - h_min ) / h_factor_actual ;
//h_assumed(i) = h_min_assumed + h_factor_assumed * h_digital(i);
//end 

u=file('open','./Kaisar_Low_pass_filter_coefficients_105_taps_gen3','unknown');
write(u,h,'((f10.7,'' ; ''))');
file('close',u);
