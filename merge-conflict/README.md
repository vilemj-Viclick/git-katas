# Git Kata: Merge Conflict

## Setup:

1. Run `source setup.sh` (or `.\setup.ps1` in PowerShell)

## The task

In this kata git cannot figure out how to merge the content added on `merge-conflict-branch1` with the content on `master`.

Both changes need to be in master when you're done.

1. Which branches exist?
    1. `tig --all` Remember?
    2. Does it remind you of something?
1. Use `git merge` to bring the changes from `merge-conflict-branch1` on to `master`.
2. What does `git status` now report.
3. Fix the conflict with your favorite editor.
4. Follow the instructions in `git status` to complete the merge.
5. What does `tig --all` show?
   1. Look at the merge commit.
   2. Who's the author of the merge commit?
   3. Did you really make all the changes in that commit?

      (Imagine someone else did the changes in master.)
6. Let's get back to the start:
   1. `pushd .. && yes | rm -r exercise && ./setup.sh && popd`
2. Let's try to put our changes (`merge-conflict-branch1`) to master a different (better) way.
   1. Let's make it linear like we did with `pull --rebase`
   2. Instead of merging _that branch_ into master with a merge commit, we'll need to merge it using a fast-forward strategy. And in order to do taht we first need to redo all our changes on top of the latest commit in master.
3. What do I need to do before I use `git rebase`?

## Relevant commands
- `git merge`
- `git status`
- `git add`
- `git commit`
- `git log --oneline --graph`
