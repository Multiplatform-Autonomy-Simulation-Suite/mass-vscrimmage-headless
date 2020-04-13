# mass-vscrimmage-headless

## Running a Mission using vSCRIMMAGE-headless
```
docker run multiplatformautonomy/vscrimmage_headless scrimmage missions/straight_nogui.xml
```

## Running a bash prompt using vSCRIMMAGE-headless
### Start vSCRIMMAGE-headless bash prompt instance:
```
docker run --name vscrimmage_headless -it multiplatformautonomy/vscrimmage_headless /bin/bash
```

### Reattach to an existing vSCRIMMAGE-headless bash prompt instance
```
docker exec vscrimmage_headless /bin/bash
```

### Copy a mission file from an existing vSCRIMMAGE-headless bash prompt instance
```
docker cp vscrimmage_headless:/scrimmage/scrimmage/missions/{mission_filename}.xml ./{mission_filename}.xml
```
