# NiDaqControlPanel
Matlab GUI controlling a National Instruments Daq

## Getting Started

### Prerequisites
* National Intruments Daq board (http://www.ni.com/data-acquisition/)
* Matlab (https://www.mathworks.com/products/matlab.html)
* Data Acquisition Toolbox (https://jp.mathworks.com/products/daq.html)

* The code has been tested with a USB-6212, Matlab version 8.6 (R2015b), and Data Acquisition Toolbox ver. 3.5.2 (R2015b).

### Installing
* Install Matlab, Data Acquisition Toolbox, and Driver (NI-DAQmx).
* Connect your Ni Daq to your PC.
* Give your Matlab pass to the m and fig files.

### How to use
* With GUI (NiDaqControlPanel)
1. Launch the Matlab.
2. Launch NiDaqControlPanel
```
guide NiDaqControlPanel
```
and Run Figure (Ctrl + T)
3. or Run NiDaqControlPanel.fig directly
```
NiDaqControlPanel.fig
```
4. Set channels (Analog inputs: AiX, Analog outputs: AoX, and Digital outputs: DoX), and parameters including sampling rate, timeout, latency on the control panel.
5. If needed, set output analog waveform as stimulus wave by making it in the pseude command line in the control panel (edit10). Stimulation waves can be imported from workspace of Matlab by selecting it with popupmenu9. The output stimulus wave will be displayed on the axes2 (axis below on the panel).
6. Select a function you want to launch from popupmenu10 in function group.
7. Press Run button.

* Without GUI
Functions with yf prefixes can work by stand alone. It would be useful when multiple trials with differenct parameters needed to be automated. Several examples are given in NiDaqControlPanelDemo.m.

## DOI

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

