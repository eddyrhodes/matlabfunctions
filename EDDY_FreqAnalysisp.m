function [IVspec] = EDDY_FreqAnalysisp( data, Fs, freqVec, width )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%No matter what happens the data variable should contain a row per trace
%with each column representing a sampled datapoint. At a sampling rate of
%2048Hz there will be more datapoints than channels on a 300-channel MEG
%system after 147ms of recording. These first 3 lines make sure that the
%matrix is in the correct shape.
[ro,cl] = size(data);
if ro>cl
    data=data';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B = zeros(length(freqVec),size(data,2));
for i=1:size(data,1)
    Sd=data(i,:);
    for j=1:length(freqVec)
        B(j,:) = EDDY_FreqAnalysis_Energyvecp(freqVec(j),Sd,Fs,width);
    end
end
IVspec = B/size(data,1);
end