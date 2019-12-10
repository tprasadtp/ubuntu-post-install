# Proposed Changes

## APT config for adding generic apt repos

Not yet in stable. There is no plan to remove

- Google Chrome
- ROS
- VSCode
- Docker
- Spotify
- Skype
- Google Cloud

from apt-repo configs. they will be supported with single entry config via `add_repo.<id>`.
However following may be removed in the future versions as they are not supported properly
by their vendors and often require some tweaks or for other reasons. You can add them via new
`apt_sources` config if you want.

- InSync
- Duo Security
- GCSFUSE(hasn't been updated since bionic)


```yaml
  apt_sources:
      # Comment, This will show in software properties
    - comment: Google Chrome
      # GPG key Can be URL or a GPG key
      # Keys will be retrieved from Ubuntu key-server.
      key_url:
      key_id:
      # URL for repo
      # Variable interpolation is possible
      # Following variables are supported
      # CODE_NAME for release codename eg. bionic
      # DISTRO_NAME for name of the distribution eg.ubuntu
      source:
      # Additional architecture support
      armhf: true
      i386: false
      arm64: true
      # Supports Debian
      # Should be a bool
      # Default is true
      debian: true
      # Supports Derivatives like mint?
      # Can be yes, base or no
      # base will use ubuntu as its base
      # default is to use fix
      derivative: base
      # Some repositories only support LTS
      # Default is false
      ltsonly: false
      # Save .list file as
      # Mandatory
      # Do not include .list it will be added automatically
      name: google-chrome
```
