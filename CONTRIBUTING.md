# Contributing to upstream / Pull requests
Thanks for your interest in contributing back to this project. Here are few
guidelines and info which might help you.

# Git submodule
To keep /data/-.lists separate from the main repository I have opted to move it
to a git submodule (referred here onwards as submodule)instead of keeping it in the main repository (referred here
onwards as main repository).

Contents of the directory `/data` is  a git
submodule, pointing to
[ubuntu-post-install-data repository](https://github.com/tprasadtp/ubuntu-post-install-data).
Since The software needs are different from  person to person, The list files
get modified, overwritten, changed etc.

The main repository requires following list files to function properly.
1. A master list of list of lists named app-list.list
2. List of PPAs named ppa.list
3. List of DEB files deb-files.list
4. List of Files to be purged purge.list (Only if you wish to use Purge function)
5. All the files mentioned in app-list.list

It can be safely assumed that end user will modify these files according to their
requirements. That creates a problem if someone wishes to push something back
upstream from their forks. Because data and code live in same repository, it
creates a problem. So to solve it I chose to turn `/data` into a git submodule,
which now becomes a dependency of main repository. This handles the problem of
separating data which is most of the times specific to a user/use case, from code,
and makes it easier to contribute to code, but it also creates following problems
when you fork & clone this repository.

1. Submodule is still pointing to upstream
2. Changes you make to `/data` are not committed to main repository or submodule
repository and you cannot get benefits of having it on github.
3. To overcome the above problem you might also have to fork submodule too.
4. You have to use --recursive to clone /data directory without which
`after-effects` wont run.

But I believe that these are minor issues and can be overcome easily.

# Forking the repository

## Fork without worrying about submodule
> If you do not wish to keep track of /data directory and if you are willing to
create your own .list files or copy paste the lists to /data directory, then
go ahead and fork the repository. Nothing needs to be changed. Just don't forget
to put required _.list_ files in /data.

**1. Fork the [Main repository](https://github.com/tprasadtp/ubuntu-post-install)**
  - Fork this repo on Github.
  - Clone the forked main repository using `--recursive` option.
  ```sh
  git clone --recursive https://github.com/<username>/ubuntu-post-install
  ```
  - You might want to update the remotes in case you wish to keep track of
  upstream repository.
  ```sh
  git remote add upstream https://github.com/tprasadtp/ubuntu-post-install.git
  ```
  - Verify the new upstream repository you've specified for your fork.
  ```sh
  git remote -v
  # --- You should see something like this. Pay attention to upstream -----
  origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
  origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
  upstream  https://github.com/tprasadtp/ubuntu-post-install.git (fetch)
  upstream  https://github.com/tprasadtp/ubuntu-post-install.git (push)
  ```
  - This clones the submodule as well. Though editing files in it wont change the
  repo or your fork.
  - **Remember!!** The clone is still tracking the upstream submodule
  `tprasadtp/ubuntu-post-install-data`.
  - To have your list files in a repository, fork the submodule as well, otherwise
  skip step 2.

**2. Fork [data submodule](https://github.com/tprasadtp/ubuntu-post-install-data)** (Optional)
  - If you do not intend to keep .list files in your own repo, this step is not
  necessary. But its a very good idea to do so.
  - Clone the forked data repository.
  - Update remotes as before. You can skip adding `upstream` if you dont wish to
  contribute back to data repository (Which is likely).
  - Update refs to submodules to point to your fork of submodule. You need to do
   it in two places.`.git/config` and `.gitmodules`
   - Update url `https://github.com/tprasadtp/ubuntu-post-install-data.git` in
   both files to your forked submodule.
   ```sh
   # In .git/config
   [submodule "data"]
   	url = https://github.com/tprasadtp/ubuntu-post-install-data.git
   	active = true
   # In .gitmodules
   [submodule "data"]
   	path = data
   	url = https://github.com/tprasadtp/ubuntu-post-install-data.git
   ```
   - Nuke everything inside `/data` (If you don’t want to rip hair from your scalp)
   - Update submodules.


  - Data repository (submodule) does not accepts pull requests or issues pertaining to
  "add this app", "add this ppa" etc. Only if there is a problem with default
  packages and ppas or deb files mentioned in the repository, create an issue or
  pull request. Since its simply list of text files, you can edit them easily via
  web UI and cloning/push pull is not necessary.
  - Reasoning is simple it is very easy to customize the list and choice of
  packages varies from person to person. It does not make sense to put the most
  used/most important collection of packages to repository.
  - If you really think its necessary please open an issue.

## Keeping Submodules updated
These commands should do the job.
```sh
git submodule init
git submodule update
```

## Note
You can also create a branch which tracks your own submodule and keep the master branch track the upstream ubuntu-post-install-data submodule. It helps you keep a clean copy of upstream in a separate branch.
