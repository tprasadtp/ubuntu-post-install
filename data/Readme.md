# Data files for Ubuntu Post Installation Script

Package lists

| File           | Contents                                                                                                         | Present in app-list |
| :------------- | :--------------------------------------------------------------------------------------------------------------- | :------------------ |
| administration | Administration Tools like Synaptic                                                                               | Yes                 |
| development    | Used for development tasks eg: rake                                                                              | Yes                 |
| external       | Packages from PPAs or External repositories. eg : Google Chrome, Spotify, Visual Studio Code, Google Cloud SDKs  | Yes                 |
| multimedia     | Tools to edit photos and videos, video players and editors and downloaders. Tools like mpv, darktable, kdenlive. | Yes                 |
| productivity   | Email, Chat, Office tools, Document converters etc.                                                              | Yes                 |
| security       | Security related tools                                                                                           | Yes                 |
| utilities      | Utilities and Tools                                                                                              | Yes                 |

---
Non package related lists (settings, deb files, delete packages list). The use and format is explained in individual sections.

| File          | Contents                                                     | Used by function     |
| :------------ | :----------------------------------------------------------- | :------------------- |
| purge         | List of packages to be purged                                | `purge_not_required` |
| ppa           | List of ppas to be added                                     | `add_ppas`           |
| deb-files     | List of DEB files to be installed                            | `install_debs`       |
| get.mlist     | Used by get-after-effects.sh to download required list files | get-after-effects.sh |
| pip(2/3).list | pip system wide packages                                     | install_pip_packages |
