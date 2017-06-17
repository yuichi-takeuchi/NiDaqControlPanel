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
* Connect your Ni Daq.
* Give your Matlab pass to the m and fig files.

### How to use
* GUI
1. Launch the Matlab.
2. Launch NiDaqControlPanel
...
guide NiDaqControlPanel
...
and Run Figure (Ctrl + T)
3. or Run NiDaqControlPanel.fig directly
...
NiDaqControlPanel.fig
...

* You can do the above procedure by launching cells one-by-one in MTOPrep.m file.
* Objective and NormalValues are cells which have a string in their each cell.
* You can change strings and utilize it to another purpose.

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

