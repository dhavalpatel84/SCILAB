clc;
clear;
close;

// isn't pcie channel is bandlimited to ppm calculation 
// cut off frequency will be dependent on no of taps * maximum bit rate frequency i think : need to confirm that 
// fmax for 16 gtps is 16ghz

//while(1)

no_of_taps  = input ("enter no of taps :"); //number of samples to be considered
low_frequency_cut_off   = 00 * 10^6 ; // 02 Mhz // minimum cut off frequency  
high_frequency_cut_off  = input ( "enter high cut off freq:"); //20 * 10^9 ; // 20 Ghz // maximum cut off frequency or sampling frequency 
//high_frequency_cut_off =  ;   

[c]= ffilt("bp",no_of_taps,low_frequency_cut_off,high_frequency_cut_off);  
//plot(c);

[a,b]=frmag(c,500);
disp(c);
//plot (a);
//disp(b);
//plot(a);

//end 
// write to the file to generate coefficient settings for the same
u=file('open','./Channel_band_pass_filter_coefficients_128_taps_gen3','unknown');
write(u,c,'((f10.7,'' ; ''))');
file('close',u);
