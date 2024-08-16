// Evaluate magnitude response of the filter
fcut = input("enter cut off frequency"); //hz
n = 20; // Filter order
hc1 = analpf(n, 'cheb1', [0.1 0], fcut*2*%pi);
hc2 = analpf(n, 'cheb2', [0 0.1], fcut*2*%pi);
he = analpf(n, 'ellip', [0.1 0.1], fcut*2*%pi);
hb = analpf(n, 'butt', [0 0], fcut*2*%pi);
hc1.dt = 'c';
hc2.dt = 'c';
he.dt = 'c';
hb.dt = 'c';
clf();
[fr, hf] = repfreq(hc1, 0, fcut*2);
plot(fr, abs(hf), 'b')
[fr, hf] = repfreq(hc2, 0, fcut*2);
plot(fr,abs(hf),'g')
[fr, hf] = repfreq(he, 0, fcut*2);
plot(fr,abs(hf),'r')
[fr, hf] = repfreq(hb, 0, fcut*2);
plot(fr, abs(hf), 'c')

legend(["Chebyshev I", "Chebyshev II", "Elliptic", "Butterworth"]);
xgrid()
xlabel("Frequency (Hz)")
ylabel("Gain")
title("Analog filters of order 7")

//
// do the inverse fourier transform of the He ( elliplticle ) filter response 
// will get coefficients ??
//
Ht = ifft(he);
disp(Ht);


