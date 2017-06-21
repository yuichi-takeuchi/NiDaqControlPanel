# NiDaqControlPanel
Matlab GUI for controlling National Instruments data acquisition boards

## Getting Started

### Prerequisites
* National Intruments Daq board (http://www.ni.com/data-acquisition/)
* Matlab (https://www.mathworks.com/products/matlab.html)
* Data Acquisition Toolbox (https://www.mathworks.com/products/daq.html)
* Singal Processing Toolbox (https://www.mathworks.com/products/signal.html) (Optional: required only for stimf_CreateSquarePulses.m)

The code has been tested with a USB-6212, Matlab ver 8.6 (R2015b), Data Acquisition Toolbox ver 3.5.2 (R2015b), and Signal Processing Toolbox ver 7.1 (R2015b).

### Installing
* Install Matlab, Data Acquisition Toolbox, and Driver (NI-DAQmx).
* Connect your Ni Daq to your PC.
* Give your Matlab pass to the m and fig files.

### How to use
* With GUI (NiDaqControlPanel)
1. Launch the Matlab.
2. Launch NiDaqControlPanel as
```
guide NiDaqControlPanel.fig
```
and Run Figure (Ctrl+T).
3. or Run NiDaqControlPanel.fig directly.
```
NiDaqControlPanel
```
4. Set channels (Analog inputs: AiX, Analog outputs: AoX, and Digital outputs: DoX), and parameters including sampling rate, timeout, latency on the control panel.
5. If needed, set output analog waveform as stimulus wave by making it in the pseude command line in the control panel (edit10). Stimulation waves can be imported from workspace of Matlab by selecting it with popupmenu9. The output stimulus wave will be displayed on the axes2 (axis below on the panel).
6. Select a function you want to launch from popupmenu10 in function group.
7. Press Run button.

* Without GUI

Functions with yf prefixes can work in stand-alone. It would be useful when multiple trials with differenct parameters needed to be automated. Several examples are given in NiDaqControlPanelDemo.m.

## Functions
* yfNiDaqAiAoB: AnalogInput scans and AnalogOutput stimuli as a bachground process.
* yfNiDaqAiAoF: AnalogInput scans and AnalogOutput stimuli as a forward process.
* yfNiDaqAiFoFTrig: AnalogInput scans and AnalogOutput stimuli as a forward process triggered by an external digital input.
* yfNiDaqAiB: AnalogInput scans as a bachground process.
* yfNiDaqAiBCont: AnalogInput scans as a contineous bachground process.
* yfNiDaqAiF: AnalogInput scans as a forward process.
* yfNiDaqAiFTrig: AnalogInput scans as a forward process triggered by an external digital input.
* yfNiDaqAoB: AnalogOutput stimuli as a bachground process.
* yfNiDaqAoBCont: AnalogOutput stimuli as a contineous bachground process.
* yfNiDaqAoBContDoConst: AnalogOutput stimuli as a contineous bachground process with constant digital outputs.
* yfNiDaqAoF: AnalogOutput stimuli as a forward process.
* yfNiDaqAoSS: Single scan of analog output channels.
* yfNiDaqDo: Single scan of digital output channels.
* yfNiDaqLoadLog: Load log (log.bin).

## Help
Use the help function as below.
```
help yfNiDaqAoBContDoConst
```

## DOI
[![DOI](https://zenodo.org/badge/94625377.svg)](https://zenodo.org/badge/latestdoi/94625377)

## Versioning
We use [SemVer](http://semver.org/) for versioning.

## Releases
* Ver 1.0.0, 2017/06/17

## Authors
* **Yuichi Takeuchi PhD** - *Initial work* - [GitHub](https://github.com/yuichi-takeuchi)
* Affiliation: Department of Physiology, University of Szeged, Hungary
* E-mail: yuichi-takeuchi@umin.net

## License
This project is licensed under the MIT License.

## Acknowledgments
* The Uehara Memorial Foundation
* Department of Physiology, University of Szeged, Hungary

