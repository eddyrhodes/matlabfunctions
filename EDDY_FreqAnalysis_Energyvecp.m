function y = EDDY_FreqAnalysis_Energyvecp(f,s,Fs,width)
% function y = energyvec(f,s,Fs,width)
%
% Return a vector containing the energy as a
% function of time for frequency f. The energy
% is calculated using Morlet's wavelets.
% s : signal
% Fs: sampling frequency
% width : width of Morlet wavelet (>= 5 suggested).

% If width is >= 1000 (ridiculous!) width becomes frequency dependent

if width >= 100
    width=(width/1000)*f;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dt = 1/Fs;
sf = f/width;
st = 1/(2*pi*sf);

t=-3.5*st:dt:3.5*st;
m = EDDY_FreqAnalysis_Morletp(f,t,width);
x = conv(s,m);
z = (2*abs(x)/Fs).^2;
y = z(ceil(length(m)/2):length(z)-floor(length(m)/2));
end