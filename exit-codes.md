# Exit Codes

| Exit Codes | Reason |
|:----------:|:-------|
| 1- 10 | Script cannot run on the system |
|  1 | Dependencies are not met |
|  2 | Script not running as root |
| 10-19 | Not Running with right configuration or flags |
| 11 | Unsupported Architecture |
| 12 | End of Life release |
| 14 | No Internet connection |
| 15 | Conflicting apps are running |
| 16 | Distribution is  Not supported |
| 17 | Distribution is not yet supported. But will be in the future. |
| 18 | Internal Functions are not running with right arguments |
| 19 | Internal Functions: Invalid arguments |
| 20- 254 | User configuration / Run-time errors |
| 20 | Purge function is  called without -d flag |
| 21 | Failed to install dependencies |
| 22 | Invalid flag passed |
| 23 | Installing dependencies failed |
| 24 | Not Running the latest version |
| 25 | Release  has some issues and is blacklisted |
| 26 | API Node is offline or not available or invalid |
| 27 | `after-effects` is not in your current directory & hooks will be disabled |
| 28 | Getting API response failed |
| 29 | Stat reporting failed |
| 30 | Similar to 24. But the latest available release is blacklisted. Use script from commit mentioned |
| 32 | Custom data directory mentioned in cfg file is invalid or doesnot exist, in current directory. |
| 34 | Failed to get all the list files mentioned in remote config. |
| 35 | Not a valid config file type |
| 36 | Custom config file defined does not exist |
| 255 | Test Exit code |
