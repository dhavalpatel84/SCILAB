clc;
clear;
close;

// isn't pcie channel is bandlimited to ppm calculation 
// cut off frequency will be dependent on no of taps * maximum bit rate frequency i think : need to confirm that 
// fmax for 16 gtps is 16ghz


no_of_taps  = input ("no of taps:"); //number of samples to be considered
low_frequency_cut_off  =input("low cut off frequency:") ;    // maximum cut off frequency or sampling frequency 
//high_frequency_cut_off =  ;   

[c]=ffilt("lp",no_of_taps,low_frequency_cut_off);  
[a,b]=frmag(c,1024);

a_db = 20 * log10 (a)/ max(a);
disp(c);
plot (2*b,a_db)

