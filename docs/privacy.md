# Privacy Policy
Our privacy policy related to website is available [here](https://prasadt.com/privacy-policy).

## Anonymous stats collection


 !!! info
    Your passwords, usernames, environment variables or anything sensitive is not collected.

The script `after-effects` collects anonymous usage statistics. The following might be collected.

- Randomized UUID generated per run.
- Last exit code.
- System Architecture (x64/x86/ARM/ARM64).
- Amount of RAM & CPU Model
- Number of GPU & GPU Vendor
- Total execution time.
- Distribution name (Ubuntu, Linux Mint etc.)
- Distribution code name (bionic, artful etc)
- Feature/Task selected.
- Flags used.
- Timezone and system language.
- Host-name.

!!! tip
    - No personally identifiable information is collected or reported back.
    - This feature can be disabled via `--no-stats` flag.


### Additional note for sigma users
*Note This applies ONLY if you are using the script from my git server. This does NOT APPLY for any GitHub branches/tags/releases.*

- Currently Github branches do not report stats and it is just a placeholder.
- If you are using the script from my git server, stats are reported unless you disable them. UUID is **NOT** random for each run and is based on MAC address of one of your Ethernet devices.(If you have many)
- Scripts have same version number and are in sync with Github. You can identify the difference by looking at REL_NAME. It has `-sigma`
