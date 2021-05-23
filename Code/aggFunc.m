function [a,b,g] = aggFunc (person,trial,ActNum,ActStart1,ActEnd1,ActStart2,ActEnd2, ActStart3, ActEnd3, ActStart4, ActEnd4)
%% Load EEGdata 
a=0;
b=0;
g=0;

if trial ~= 10
    load("Dataset/AB_UH_0"+person+"-T0"+trial+"-eeg.mat");
    % Load EMGdata 
    load("Dataset/AB_UH_0"+person+"-T0"+trial+"-emg.mat");
    % Load Kinetic 
    load("Dataset/AB_UH_0"+person+"-T0"+trial+"-kin.mat");
end
if trial == 10
    load("Dataset/AB_UH_0"+person+"-T"+trial+"-eeg.mat");
    % Load EMGdata 
    load("Dataset/AB_UH_0"+person+"-T"+trial+"-emg.mat");
    % Load Kin 
    load("Dataset/AB_UH_0"+person+"-T"+trial+"-kin.mat");
end
%% Initializing EEG Channels

c1n = 14;
c2n = 16; 
c3n = 17;


%% Rejecting Channels
rej = sort(eeg.rejectedchannels,'desc');
for index = rej
       
   if index< c1n 
       c1n = c1n-1;
   end
   
   if index< c2n 
        c2n = c2n-1;
   end
   
   if index< c3n 
        c3n = c3n-1;
   end
   
end
%% sampling (Change this if you want to modify the Sample Rates 
sr = 1000; 
srnew = 1000;
c1 = resample(eeg.processdata(c1n,:),1,sr/srnew);
c2 = resample(eeg.processdata(c2n,:),1,sr/srnew);
c3 = resample(eeg.processdata(c3n,:),1,sr/srnew);

ActStart1 = srnew*ActStart1; 
ActStart2 = srnew*ActStart2;
ActStart3 = srnew*ActStart3; 
ActStart4 = srnew*ActStart4;
ActEnd1 = srnew*ActEnd1; 
ActEnd2 = srnew*ActEnd2;
ActEnd3 = srnew*ActEnd3; 
ActEnd4 = srnew*ActEnd4;

%% Load emg data (Left) 

m1 = resample(emg.left(1,:),1,sr/srnew); 
m2 = resample(emg.left(2,:),1,sr/srnew); 
m3 = resample(emg.left(3,:),1,sr/srnew); 
m4 = resample(emg.left(4,:),1,sr/srnew); 
m5 = resample(emg.left(5,:),1,sr/srnew); 
m6 = resample(emg.left(6,:),1,sr/srnew); 

%% Initializing Filters - Alpha, Beta and Gamma 

A = designfilt('bandpassiir','FilterOrder',20, ...
   'passbandFrequency1',8,'passbandFrequency2',14, 'passbandRipple',0.0001, ...
   'SampleRate',srnew);
B = designfilt('bandpassiir','FilterOrder',20, ...
   'passbandFrequency1',14,'passbandFrequency2',30, 'passbandRipple',0.0001, ...
   'SampleRate',srnew);
G = designfilt('bandpassiir','FilterOrder',20, ...
   'passbandFrequency1',30,'passbandFrequency2',50, 'passbandRipple',0.0001, ...
   'SampleRate',srnew);

%% Task Seperation 

%Stair and Ramp
if ActNum == 1 || ActNum == 3 || ActNum == 5 || ActNum == 6
    c = {[c1(ActStart1:ActEnd1) c1(ActStart2:ActEnd2)];
         [c2(ActStart1:ActEnd1) c2(ActStart2:ActEnd2)]; 
         [c3(ActStart1:ActEnd1) c3(ActStart2:ActEnd2)]};
    m = {[m1(ActStart1:ActEnd1) m1(ActStart2:ActEnd2)]; 
         [m2(ActStart1:ActEnd1) m2(ActStart2:ActEnd2)];
         [m3(ActStart1:ActEnd1) m3(ActStart2:ActEnd2)];
         [m4(ActStart1:ActEnd1) m4(ActStart2:ActEnd2)];
         [m5(ActStart1:ActEnd1) m5(ActStart2:ActEnd2)];
         [m6(ActStart1:ActEnd1) m6(ActStart2:ActEnd2)]}; 
end

%Level Walking
if ActNum == 2
    c = {[c1(ActStart1:ActEnd1) c1(ActStart2:ActEnd2) c1(ActStart3:ActEnd3) c1(ActStart4:ActEnd4)] ; 
         [c2(ActStart1:ActEnd1) c2(ActStart2:ActEnd2) c2(ActStart3:ActEnd3) c2(ActStart4:ActEnd4)] ; 
         [c3(ActStart1:ActEnd1) c3(ActStart2:ActEnd2) c3(ActStart3:ActEnd3) c3(ActStart4:ActEnd4)]};
     
    m = {[m1(ActStart1:ActEnd1) m1(ActStart2:ActEnd2) m1(ActStart3:ActEnd3) m1(ActStart4:ActEnd4)];
         [m2(ActStart1:ActEnd1) m2(ActStart2:ActEnd2) m2(ActStart3:ActEnd3) m2(ActStart4:ActEnd4)]; 
         [m3(ActStart1:ActEnd1) m3(ActStart2:ActEnd2) m3(ActStart3:ActEnd3) m3(ActStart4:ActEnd4)];
         [m4(ActStart1:ActEnd1) m4(ActStart2:ActEnd2) m4(ActStart3:ActEnd3) m4(ActStart4:ActEnd4)];
         [m5(ActStart1:ActEnd1) m5(ActStart2:ActEnd2) m5(ActStart3:ActEnd3) m5(ActStart4:ActEnd4)]; 
         [m6(ActStart1:ActEnd1) m6(ActStart2:ActEnd2) m6(ActStart3:ActEnd3) m6(ActStart4:ActEnd4)]};
end

%No Movement 
if ActNum == 4
    c = {[c1(ActStart1:ActEnd1) c1(ActStart2:ActEnd2) c1(ActStart3:ActEnd3)] ; 
         [c2(ActStart1:ActEnd1) c2(ActStart2:ActEnd2) c2(ActStart3:ActEnd3)] ; 
         [c3(ActStart1:ActEnd1) c3(ActStart2:ActEnd2) c3(ActStart3:ActEnd3)]} ;
     
    m = {[m1(ActStart1:ActEnd1) m1(ActStart2:ActEnd2) m1(ActStart3:ActEnd3)];
         [m2(ActStart1:ActEnd1) m2(ActStart2:ActEnd2) m2(ActStart3:ActEnd3)]; 
         [m3(ActStart1:ActEnd1) m3(ActStart2:ActEnd2) m3(ActStart3:ActEnd3)];
         [m4(ActStart1:ActEnd1) m4(ActStart2:ActEnd2) m4(ActStart3:ActEnd3)];
         [m5(ActStart1:ActEnd1) m5(ActStart2:ActEnd2) m5(ActStart3:ActEnd3)]; 
         [m6(ActStart1:ActEnd1) m6(ActStart2:ActEnd2) m6(ActStart3:ActEnd3)]} ;
end   
    
%% Filter and Coherence - Alpha

a = zeros(18,1);
aindex = 1;
for mindex = 1:6    
for cindex = 1:3

cx = cell2mat(c(cindex));
mx = cell2mat(m(mindex)); 
cdim = size(cx); 
cdim = cdim(2); 
%alpha 
cx = filter(A,cx);
mx = filter(A,mx);
[wcoh,~,period,coi] = wcoherence(cx,mx,seconds(1/srnew),'PeriodLimits',[seconds(1/14),seconds(1/8)]);
t = 0:1/srnew:((cdim-1)/srnew);

%Plotting Alpha
figure

ax=nexttile(); 
period = seconds(period);
coi = seconds(coi);
h = pcolor(t,log2(1./(period)),wcoh);
h.EdgeColor = 'none';
ytick=(pow2(ax.YTick));
ax.YTickLabel=ytick;

ax.XLabel.String='Time';
ax.YLabel.String='Frequency (Hz)';
ax.Title.String = 'Wavelet Coherence Alpha';
hcol = colorbar;

f = gcf;
exportgraphics(f,"P"+person+"T"+trial+"A"+ActNum+"alpha.jpg");
close(f);



%Aggregation 
threshold = 0.5;
agg1 = zeros(1,size(wcoh,2)); 
period = double(period);
freq = 1./period;
delf = (freq(1)-freq(end))/size(freq,1); 

for t1 = 1:size(wcoh,2)
   for f = 1:size(wcoh,1)
        if wcoh(f,t1) > threshold
             agg1(t1) = agg1(t1) + delf*(wcoh(f,t1)-threshold);
        end
    
   end

end

a(aindex,1) = mean(agg1); %this a is returned to main function
aindex = aindex+1;
end
end

%% 
%% Filter and Coherence - Beta

b = zeros(18,1);
bindex = 1;
for mindex = 1:6    
for cindex = 1:3

cx = cell2mat(c(cindex));
mx = cell2mat(m(mindex)); 
cdim = size(cx); 
cdim = cdim(2); 

%beta
cx = filter(B,cx);
mx = filter(B,mx);
[wcoh,~,period,coi] = wcoherence(cx,mx,seconds(1/srnew),'PeriodLimits',[seconds(1/30),seconds(1/14)]);
t = 0:1/srnew:((cdim-1)/srnew);
%Plotting
figure
ax=nexttile(); 
period = seconds(period);
coi = seconds(coi);
h = pcolor(t,log2(1./(period)),wcoh);
h.EdgeColor = 'none';
ytick=(pow2(ax.YTick));
ax.YTickLabel=ytick;

ax.XLabel.String='Time';
ax.YLabel.String='Frequency (Hz)';
ax.Title.String = 'Wavelet Coherence Beta';
hcol = colorbar;

f = gcf;
exportgraphics(f,"P"+person+"T"+trial+"A"+ActNum+"alpha.jpg");
close(f);
% hold on;

delf = (freq(1)-freq(end))/size(freq,1)/((freq(1)+freq(end))/2); 

for t1 = 1:size(wcoh,2)
   for f = 1:size(wcoh,1)
        if wcoh(f,t1) > threshold
             agg1(t1) = agg1(t1) + delf*(wcoh(f,t1)-threshold);
        end
    
   end

end

b(bindex,1) = mean(agg1); %this a is returned to main function
bindex = bindex + 1; 
end
end
%% Filter and Coherence - Gamma

g = zeros(18,1);
gindex = 1;
for mindex = 1:6    
for cindex = 1:3

cx = cell2mat(c(cindex));
mx = cell2mat(m(mindex)); 
cdim = size(cx); 
cdim = cdim(2); 
%gamma
cx = filter(G,cx);
mx = filter(G,mx);
[wcoh,~,period,coi] = wcoherence(cx,mx,seconds(1/srnew),'PeriodLimits',[seconds(1/50),seconds(1/30)]);
%Plotting

t = 0:1/srnew:((cdim-1)/srnew);

figure

ax = nexttile();
period = seconds(period);
coi = seconds(coi);
h = pcolor(t,log2(1./(period)),wcoh);
h.EdgeColor = 'none';
ytick=(pow2(ax.YTick));
ax.YTickLabel=ytick;

ax.XLabel.String='Time';
ax.YLabel.String='Frequency (Hz)';
ax.Title.String = 'Wavelet Coherence Gamma of P';
hcol = colorbar;


f = gcf;
exportgraphics(f,"P"+person+"T"+trial+"A"+ActNum+"gamma.jpg");
close(f);


%Aggregation 
threshold = 0.5;
agg1 = zeros(1,size(wcoh,2)); 
period = double(period);
freq = 1./period;
delf = (freq(1)-freq(end))/size(freq,1);  

for t1 = 1:size(wcoh,2)
   for f = 1:size(wcoh,1)
        if wcoh(f,t1) > threshold
             agg1(t1) = agg1(t1) + delf*(wcoh(f,t1)-threshold);
        end
    
   end

end

g(gindex,1) = mean(agg1); %this a is returned to main function
gindex = gindex +1; 
end
end




end



% %% Draw Plot 
% figure
% tiledlayout(5,1)
% ax = nexttile(1,[4,1]);
% period = seconds(period);
% coi = seconds(coi);
% h = pcolor(t,log2(1./(period)),wcoh);
% h.EdgeColor = 'none';
% ytick=(pow2(ax.YTick));
% ax.XLabel.String='Time';
% ax.YLabel.String='Frequency (Hz)';
% ax.Title.String = 'Wavelet Coherence ';
% hcol = colorbar;
% hcol.Label.String = 'Magnitude-Squared Coherence';