# Git Kata: Merge Conflict

## Setup:

1. Run `./setup.sh`

## The task
In this kata the goal is to split a commit in a branch into two atomic commits. 

1. Run `git rebase -i master` and stop at the appropriate commit.
2. Guess the current status. Where is HEAD? Check the graph, notice uncommited changes. Use tig. After, undo the changes in HEAD. Do you remember the command?

	 `git reset (--mixed) HEAD^`
1. Create a separate commit for changes made while refactoring `Inline.tsx`
	- Can you guess the state of working directory? Check in tig
2. Create a fixup commit for changes in TabView.tsx

	`git commit -a --fixup <#hash>`
	- Check history
	- Run `git rebase -i --autosquash master`
	- Notice the order of commits in the editor

## Relevant commands
- `git rebase -i (--autosqash) master`
- `git reset HEAD^`
- `git commit -a --fixup <#hash>`
