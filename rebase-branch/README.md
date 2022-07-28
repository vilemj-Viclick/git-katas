# Git Kata: rebase branch

## Setup

1. Run `source setup.sh` (or `.\setup.ps1` in PowerShell)

## The task

You again live in your own branch, this time we will be doing a bit of juggling with branches, to show how lightweight branches are in git.

1. Which branches exist?
   1. `tig --all` Remember?
   2. Does it remind you of something?
2. Checkout the `uppercase` branch.
5. Rebase your uppercase branch with the master (`git rebase master`)
   1. Could you rebase onto `origin/master` directly if there was a remote repo to this local one?
   2. What needs to be done to really rebase onto the latest available version of `master`.
6. What did just happen?
7. How do you now include your changes in the master branch?
8. Do it!


## Useful commands

- `git checkout <branch-name>`
- `git rebase <branch-name>`
- `git log --oneline --graph --all`
- `git merge <branch-name>`
