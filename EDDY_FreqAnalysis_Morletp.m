function y = EDDY_FreqAnalysis_Morletp(f,t,width)
sf = f/width;
st = 1/(2*pi*sf);
A = 1/(st*sqrt(2*pi));
y = A*exp(-t.^2/(2*st^2)).*exp(1i*2*pi*f.*t);
end