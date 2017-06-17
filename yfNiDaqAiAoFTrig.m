function [Data, Time] = yfNiDaqAiAoFTrig(AiCh, AoCh, AoWaveform, rate)
%
%   [Data, Time] = yfNiDaqAiAoFTrig(AiCh, AoCh, AoWaveform, rate)
%   AiCh: Vector
%   AoCh: Vector
%   AoWaveform: Vector or Matrix
%   rate: sampling rate in Hz
%   Data: Matrix or Matrix
%   Time: Vector
%
% Copyright (c) 2015 Yuichi Takeuchi
%

d = daq.getDevices;
s = daq.createSession('ni');
s.Rate = rate;

aich = addAnalogInputChannel(s, d.ID, AiCh, 'Voltage');
for i = (1:length(AiCh))
    aich(i).Range = [-10.0 10.0];    % Set the same ragen and terminals for all the channels.
    aich(i).TerminalConfig = 'SingleEnded';   % Configure the terminal and range of the chanels in the session.
end

addTriggerConnection(s, 'External', 'Dev1/PFI0', 'StartTrigger');   % Create an externaal trigger connection and set the trigger to run on time.
s.Connections(1).TriggerCondition = 'RisingEdge';
s.TriggersPerRun = 1;
% s.ExternalTriggerTimeout = 30;
% s.TriggersPerRun = 2;

aoch = addAnalogOutputChannel(s, d.ID, AoCh, 'Voltage');

OutputSignal = AoWaveform';
queueOutputData(s, OutputSignal);

[Data, Time] = s.startForeground();

subplot(2, 1, 1)
plot(Time, AoWaveform)
ylabel('Voltage');
xlabel('Time');
title('Output wave')
grid on
subplot(2, 1, 2)
plot(Time, Data)
ylabel('Voltage');
xlabel('Time');
title('Acquired Signal')
grid on;

end