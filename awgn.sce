clc;
clear;

disp("AWGN Generation");

// row and column defination
m=3;
n=128;
snr = 1;
//channel_noise_db = -27; // in db
//while(1); 


//channel_noise_db = -27.0; // in db
channel_noise_db = -input("enter noise value in db: ");

channel_noise = 10 ^ (channel_noise_db /20) ;

channel_noise_min  = channel_noise / 2 ;
channel_noise_max  = channel_noise ;

disp(channel_noise_max);
disp(channel_noise_min);

mean_noise = channel_noise_min + (channel_noise_max - channel_noise_min) / 2 ;
standard_deviation = (channel_noise_max - channel_noise_min) / ( 2 * n);

disp(mean_noise);
disp(standard_deviation);

a=zeros(1,n);

disp("input siganl");
disp(a);
//plot(a);

a= rand(a,"normal");
ma=max(a);  //maximum value from the matrix
mi=min(a);  //minimum value from the matrix
disp("max:",ma);
disp("min:",mi);

deviation_val = (ma-mi)/(n-1);
disp("deviation value :",deviation_val);


disp("output siganl");
disp(a);
//plot(a);

//a= sqrt(standard_deviation)*a ; //rand(a,"normal");
//a= standard_deviation*a ; //rand(a,"normal");

// converting to mapped deviation 
for i=1:1:n;
   a(1,i) = (a(1,i)/deviation_val) * standard_deviation;
end
disp("output siganl");
disp(a);
//plot(a);

a=  ones(1,n) -mean_noise + a ; //sqrt(standard_deviation)*rand(a,"normal");
//a= rand(a,"normal") + mean_noise;
//a = awgn(a,1,0);

disp("output siganl");
disp(a);
plot(a);

// write to the file to generate coefficient settings for the same
u=file('open','./AWGN_coefficient_38db_128taps','unknown');
write(u,a,'(8(f10.7,'' ; ''))');
file('close',u);

//end 
//x=-5:0.01:5;
//y=0:0.00001:1;
//plot(a);

//t = 0:1:64;
//noise = channel_noise * rand(t, "normal");
//disp("noise siganl");
//disp(noise);
////plot2d2(t, noise);
//
//noisegen(1, 10, channel_noise);
//x = -5:0.01:11;
//disp(Noise);
//y = feval(x, Noise);
//plot(x, y);
