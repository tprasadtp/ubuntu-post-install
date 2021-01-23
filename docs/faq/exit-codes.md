# Exit Codes

| Exit Codes | Reason                                                                             |
|:----------:|:---------------------------------------------------------------------------------- |
|   1- 10    | Script cannot run on the system                                                    |
|     1      | Dependencies are not met                                                           |
|     2      | Script not running as root                                                         |
|     8      | Remote get operation failed.                                                       |
|     5      | Failed to determine distribution. Is /etc/os-release file missing?                 |
|   10-19    | Not running with right configuration or internal flags                             |
|     11     | Unsupported architecture                                                           |
|     12     | End of Life release                                                                |
|     14     | No Internet connection                                                             |
|     15     | Conflicting apps are running                                                       |
|     16     | Distribution is not supported                                                      |
|     17     | Distribution is not yet supported. But will be in the future.                      |
|     19     | Internal Functions: Invalid arguments                                              |
|  20- 254   | User configuration / Run-time errors                                               |
|     20     | Purge function is  called without -d flag                                          |
|     21     | Failed to install dependencies                                                     |
|     22     | Invalid flag passed                                                                |
|     23     | Invalid argument position                                                          |
|     24     | Not Running the latest version                                                     |
|     25     | Incompatible arguments                                                             |
|     26     | Option is obsolete                                                                 |
|     28     | Getting API response failed                                                        |
|     29     | DEPRECATED_EXIT_CODE                                                               |
|     35     | Not a valid config file type                                                       |
|     36     | file defined does not exist/not accessible                                         |
|     37     | Configuration error. Expects Boolean but found something else.                     |
|     38     | Failed to delete a file                                                            |
|     39     | DEPRECATED_EXIT_CODE                                                               |
|     40     | Failed to unset an array                                                           |
|     41     | DEPRECATED_EXIT_CODE                                                               |
|     51     | GPG signature checks failed                                                        |
|     52     | SHA checksums did not match                                                        |
|     53     | List mode is no longer supported.                                                  |
|     54     | not running with autopilot when terminal is non interactive.                       |
|     61     | apt-get update failed with some warnings or errors                                 |
|     62     | DEPRECATED_EXIT_CODE                                                               |
|     63     | Undefined configuration                                                            |
|     64     | Required basefiles/directories are missing (Your installation of Ubuntu is broken) |
|     66     |                                                                                    |
|     67     | Failed to map code_name to AE_OBS_PREFIX                                           |
|    255     | Test Exit code                                                                     |
|            |                                                                                    |
