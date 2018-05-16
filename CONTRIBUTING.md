# Contributing to upstream / Pull requests

Thanks for your interest in contributing back to this project. Here are few
guidelines and info which might help you.

## Branches

Please create a separate branch which does not have your edits in data directory.
Please do not submit/add lists unless the default lists are causing errors. the script. Apps and ppas are user preference and should be left to end user.

## `data` directory

Due to entry in .gitignore, all changes in **.list** files are ignored and the files in data directory are un-tracked. If you wish to keep track of them via git please remove the entry `*.list` from `.gitignore` or add via `git add -f  [file]` . If you are planning to contribute code/script changes upstream, please consider creating a branch which keeps data files same as upstream.
