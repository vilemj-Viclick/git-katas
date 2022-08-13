# Git Kata: Interactive Rebase

## Setup:

1. Run `./setup.sh`

## The task

The purpose of this kata is to demostrate cleaning of history in a feature branch prior to creating a PR.

1. Get rid of unwanted commits (`[Temp]` prefix)
	- Notice both commits are already present in the master branch.
2. Fixup the last two commits (`[Bugfix]` prefix) into the appropriate one (`[Tabview]` prefix)
3. Reoreder the commits so that the refactoring is at the beginning (`[Refactoring]` prefix). Get rid of the unnecessary prefix.
4. Squash a commit with fixed typo (`[Squash]` prefix) into the correct commit (`[Tabview]` prefix). You can get rid of the prefix now.
5. Fix the bug (capital T and ) in the last commit (`[Quickstart]` prefix). Get rid of the prefix. Use `git commit --amend`.

## Relevant commands
- `git rebase -i master`
- `git commit --amend`
