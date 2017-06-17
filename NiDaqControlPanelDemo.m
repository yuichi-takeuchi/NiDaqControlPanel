% Demonstration of NiDaqControlPanel Matlab GUI
% (c) Yuichi Takeuchi 2017
%% 0. Generatte DC wave
stimwave = linspace(1,1,2000);

%% 0. Generate square wave
[stimwave, t] = stimf_CreateSquarePulses(5,0.01,1,2000); % PulseFreq, PulseWidth, Duration, OutputSamplingFreq

%% 0. Generate sine wave
[stimwave, t] = stimf_CreateSineWave(5,1.5*pi,1,2000); % PulseFreq, StartingPhase, Duration, OutputSamplingFreq
stimwave = stimwave/2 + 0.5;

%% 1. Scale stimwave
ScaledVoltage = 1; % peak amplitude of stimulus waveform (in volt)
ScaledStimwave = ScaledVoltage*stimwave;
ScaledStimwave(ScaledStimwave > 1.5) = 1.5;
%plot(ScaledStimwave)

%% 2. NiDaqControlPanel
guide NiDaqControlPanel

%% Appendix below

%% Square Pulse Stimulations without NiDaqControlPanel
% square wave stim (1, 2, 5, 10, 20, 50 Hz)
squarewaveHz = [1 2 5 10 20 50]; % Hz
AoCh = [0];
rate = 20000; % Hz
DoCh = '0:3';
Latency = 0; % second
for k = 1:length(squarewaveHz)
    timeout = 100/squarewaveHz(k); % 100 pulses
    [stimwave, t] = stimf_CreateSquarePulses(sinewaveHz(k),0.01,1,rate); % PulseFreq, PulseWidth, Duration, SamplingFreq
    ScaledStimwave = ScaledVoltage*stimwave;
    ScaledStimwave(ScaledStimwave > 1.5) = 1.5;
    dec = k;
    binaryVector = decimalToBinaryVector(dec, 4, 'LSBFirst');
    yfNiDaqAoBContDoConst(AoCh, ScaledStimwave, rate, timeout, DoCh, binaryVector, Latency)
end
clear AoCh rate DoCh Latency squarewaveHz timeout stimwave ScaledStimwave dec binaryVector

%% Square Pulse Stimulations with NiDaqControlPanel (with the same length control segment before each stimulation)
% sine wave stim (1, 2, 5, 10, 20, 50 Hz)
squarewaveHz = [1 2 5 10 20 50]; % Hz
AoCh = [0];
rate = 20000; % Hz
DoCh = '0:3';
Latency = 0; % second
cycles = 100; % mininum pulses
l = 1;
for k = 1:2*length(squarewaveHz)
    timeout = cycles/squarewaveHz(l);
    if(timeout < 10)
        timeout = 10;
    end
    dec = k;
    binaryVector = decimalToBinaryVector(dec, 4, 'LSBFirst');
    if(mod(k,2))
        yfNiDaqDo(DoCh, binaryVector)
        tStart = tic;
        eTime = 0;
        counter = 0;
        while(eTime < timeout)
            pause(1)
            counter = counter + 1;
            display([num2str(counter) ' s'])
            eTime = toc(tStart);
        end
    else
        [stimwave, t] = stimf_CreateSquarePulses(squarewaveHz(k/2),0.01,1,rate); % PulseFreq, PulseWidth, Duration, SamplingFreq
        ScaledStimwave = ScaledVoltage*stimwave;
        ScaledStimwave(ScaledStimwave > 1.5) = 1.5;
        yfNiDaqAoBContDoConst(AoCh, ScaledStimwave, rate, timeout, DoCh, binaryVector, Latency)
        l = l + 1;
    end
end
clear AoCh rate DoCh Latency squarewaveHz timeout stimwave ScaledStimwave dec binaryVector tStart eTime counter t k cycles l

%% Sine wave Stimulations without NiDaqControlPanel
% sine wave stim (1, 2, 5, 10, 20, 50 Hz)
sinewaveHz = [1 2 5 10 20 50]; % Hz
AoCh = [0];
rate = 20000; % Hz
DoCh = '0:3';
Latency = 0; % second
for k = 1:length(sinewaveHz)
    timeout = 100/sinewaveHz(k); % 100 cycles
    [stimwave, t] = stimf_CreateSineWave(sinewaveHz(k),1.5*pi,1,rate); % PulseFreq, StartingPhase, Duration, SamplingFreq
    stimwave = stimwave/2 + 0.5;
    ScaledStimwave = ScaledVoltage*stimwave;
    ScaledStimwave(ScaledStimwave > 1.5) = 1.5;
    dec = k;
    binaryVector = decimalToBinaryVector(dec, 4, 'LSBFirst');
    yfNiDaqAoBContDoConst(AoCh, ScaledStimwave, rate, timeout, DoCh, binaryVector, Latency)
end
clear AoCh rate DoCh Latency sinewaveHz timeout stimwave ScaledStimwave dec binaryVector

%% Sine wave Stimulations without NiDaqControlPanel (with the same length control segment before each stimulation)
% sine wave stim (1, 2, 5, 10, 20, 50 Hz)
sinewaveHz = [1 2 5 10 20 50]; % Hz
AoCh = [0];
rate = 20000; % Hz
DoCh = '0:3';
Latency = 0; % second
cycles = 100; % mininum cycles
l = 1;
for k = 1:2*length(sinewaveHz)
    timeout = cycles/sinewaveHz(l);
    if(timeout < 10)
        timeout = 10;
    end
    dec = k;
    binaryVector = decimalToBinaryVector(dec, 4, 'LSBFirst');
    if(mod(k,2))
        yfNiDaqDo(DoCh, binaryVector)
        tStart = tic;
        eTime = 0;
        counter = 0;
        while(eTime < timeout)
            pause(1)
            counter = counter + 1;
            display([num2str(counter) ' s'])
            eTime = toc(tStart);
        end
    else
        [stimwave, t] = stimf_CreateSineWave(sinewaveHz(k/2),1.5*pi,1,rate); % PulseFreq, StartingPhase, Duration, SamplingFreq
        stimwave = stimwave/2 + 0.5;
        ScaledStimwave = ScaledVoltage*stimwave;
        ScaledStimwave(ScaledStimwave > 1.5) = 1.5;
        yfNiDaqAoBContDoConst(AoCh, ScaledStimwave, rate, timeout, DoCh, binaryVector, Latency)
        l = l + 1;
    end
end
clear AoCh rate DoCh Latency sinewaveHz timeout stimwave ScaledStimwave dec binaryVector tStart eTime counter t k cycles l
