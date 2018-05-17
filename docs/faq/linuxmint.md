# Linux Mint 17.X and PPA priorities

!!! note
    This applies only for Linux Mint **17, 17.1** and **17.2**

- For some reason, The Mint team decided to make their repository packages set with a priority of 700 in order to overwrite Ubuntu’s priorities. PPAs typically issue a priority of 500, so due to the priority that Mint set, packages provided by the PPA which are already in the official mint repository (upstream Ubuntu as well) are completely ignored. Workaround is to set the priorities to lower for default repositories say 500 in /etc/apt/preferences.d/ or to increase priorities of PPAs to higher (more than 700).
- This was changed in Linux Mint 17.3 and no need to change the priorities unless it provides upstream Linux Mint packages. The release notes for mint 17.3 says

!!! quote
    The "upstream" component of the Linux Mint repositories was kept at priority 700. All other components ("main", "import", "backport", "romeo") as well as the "extra" repository, had their priority lowered to 500.
