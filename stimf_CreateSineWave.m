function [ SineWave, Time ] = stimf_CreateSineWave( PulseFreq, StartingPhase, Duration, Fs )
% 
% PulseFreq: in Hz
% StartingPhase in pi
% Duration: in second
% Fs: sampling rate
% 
% (c) Yuichi Takeuchi 2017

Time = 0:1/Fs:Duration;
SineWave = sin(2*pi*PulseFreq*Time + StartingPhase);

%
% plot(Time,SquareWave)

