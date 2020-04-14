# mass-vscrimmage-headless

## Overview
### vSCRIMMAGE-headless
This repository contains a GUI-less image for running [SCRIMMAGE](https://github.com/gtri/scrimmage).  For scrimmage-related questions and issues, please see the [tutorials and documentation for SCRIMMAGE](http://scrimmagesim.org).  For issues and bugs pertaining to this docker deployment, please see the GitHub Issues page for [vSCRIMMAGE-headless](https://github.com/Multiplatform-Autonomy-Simulation-Suite/mass-vscrimmage-headless).

## Usage
### Running a Mission using vSCRIMMAGE-headless
```
docker run multiplatformautonomy/vscrimmage-headless scrimmage missions/straight_nogui.xml
```

### Running a bash prompt using vSCRIMMAGE-headless
#### Start vSCRIMMAGE-headless bash prompt instance:
```
docker run --name vscrimmage-headless -it multiplatformautonomy/vscrimmage-headless /bin/bash
```

#### Reattach to an existing vSCRIMMAGE-headless bash prompt instance
```
docker exec vscrimmage-headless /bin/bash
```

### Copy a mission file from an existing vSCRIMMAGE-headless bash prompt instance
```
docker cp vscrimmage-headless:/scrimmage/scrimmage/missions/{mission_filename}.xml ./{mission_filename}.xml
```

## MASS
This repository and the accompanying docker image was prepared as part of [GTRI](https://gtri.gatech.edu)'s Multi-platform Autonomous Simulation Suite effort, sponsored by the Air Force Research Laboratory.

*The views and conclusions contained herein are those of the authors and should not be interpreted as necessarily representing the official policies or endorsements, either expressed or implied, of the Air Force Research Laboratory or the U.S. Government.*

*This material is based on research sponsored by the Air Force Research Laboratory under Subaward number FA8650-19-2-6983. The U.S. Government is authorized to reproduce and distribute reprints for Governmental purposes notwithstanding any copyright notation thereon.*
