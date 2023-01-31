clear all
close all
clc

fs=1000;
numfiles=4;
FN=[];
for i=1:numfiles
   
    filename=sprintf('L (%d).mat',i);
    x=importdata(filename);
  
    
    
%     for k=1:3
   
%        
%        E=x(k,:);
       
       [imf,res]=emd(x,'Interpolation','pchip');
       [r,c]=size(imf);
%        emd(x,'MaxNumIMF',10)
       Sum=zeros(r,1);
       for l=2:2
          Sum=Sum+imf(:,l); 
       end
      
    M = mean(Sum);
    STD = std(Sum);
    VAR = var(Sum);
    SK = skewness(Sum);
    KR = kurtosis(Sum);
    P2P = peak2peak(Sum);
    RMS = rms(Sum);
    CF = max(Sum)/RMS;
    SF = RMS/mean(abs(Sum));
    IF = max(Sum)/mean(abs(Sum));
    MF = max(Sum)/mean(abs(Sum))^2;
    EN = sum(Sum.^2);
    MAV = max(Sum);
    MIV = min(Sum);
    MFr = meanfreq(Sum,fs);
    MeFr = medfreq(Sum,fs);
    Me = median(Sum);  
    P2RMS = peak2rms(Sum);
    RSSL = rssq(Sum);
    BP = bandpower(Sum);
    OB= obw(Sum,fs);
    FCP = findchangepts(Sum);
    PB = powerbw(Sum,fs);
    LE = -log(sum(Sum.^2));
    SE = -sum((Sum.^2).*log((Sum.^2)));         
       
       F=[M STD VAR SK KR P2P RMS CF SF IF MF EN MAV MIV MFr MeFr Me P2RMS RSSL BP OB FCP PB LE SE];
       FN=[FN;F];
       
% %     end
    
end