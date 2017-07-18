% Copyright (c) 2017 Yuichi Takeuchi
%% generate sine wave
[stimwave, t] = stimf_CreateSineWave(5,1.5*pi,1,2000); % PulseFreq, StartingPhase, Duration, SamplingFreq
stimwave = stimwave/2 + 0.5;
clear t

%% NiDaqControlPanel
guide NiDaqControlPanel.fig

%% yfNiDaqAoFTrig test with loop
AoCh = [0];
AoWaveform = stimwave;
rate = 2000; % Hz
TriggerTimeout = 10;

while (1)
    yfNiDaqAoFTrig(AoCh, AoWaveform, rate, TriggerTimeout)
end

%% yfNiDaqAoBTrig test with loop
AoCh = [0];
AoWaveform = stimwave;
rate = 2000; % Hz
timeout = 0.5; % s
TriggerTimeout = inf;
ii = 0;
while (1)
    yfNiDaqAoBContTrig(AoCh, AoWaveform, rate, timeout, TriggerTimeout)
    ii = ii + 1;
    disp(ii)
end

%% yfNiDaqAoBContDoConstTrig
AoCh = [0];
AoWaveform = stimwave;
rate = 2000; % Hz
timeout = 0.5; % s
TriggerTimeout = inf;
DoCh = '0:3';
binaryVector = [1 1 1 1]; % binaryVector: [Do0, Do1, Do2, Do3]
Latency = 0; % s
ii = 0;
while(1)
    yfNiDaqAoBContDoConstTrig(AoCh, AoWaveform, rate, timeout, TriggerTimeout, DoCh, binaryVector, Latency)
    ii = ii + 1;
    disp(ii)
end
