# Master based workflow

In this kata we will practice the workflow commonly known as "master based workflow". It is sometimes called Centralized workflow or simplified workflow. Collaboration works by pushing to and pulling from the master branch. This workflow is good for simple projects, or solo projects.

We will work with a fake remote repository, that serves as a standin for one hosted by a service like GitHub or Bitbucket.

## Setup

Run `source setup.sh` (or `.\setup.ps1` in PowerShell) to setup the exercise.

## This exercise deals with two things: You'll get a better grasp of what remote, remote tracking and local branches are. And you'll try out different tactics of branch reconciliation.

## Task

1. Get a local instance of the remote by running the command `git clone fake-remote-repository local-repo`
2. Change to the local repository with the command `cd local-repo`
3. Add a line of text to `README.md`
4. Commit the change 
5. Run `tig` and notice how your local master branch relates to the remote master branch
6. Push the change to the remote using the command `git push`
7. Run `tig` to see that you are up-to-date
8. Add another line of text to `README.md`
9. Commit the change
10. Run the command `../fitzgerald-pushes-before-we-do.sh` (or `..\fitzgerald-pushes-before-we-do.ps1` in PowerShell) to simulate a collaborator delivering changes to the fake remote
    1. We will want to show here, that a change has been made to the remote, but the local repo has no idea. No remote tracking branch update. Nothing.
11. Push your change. Notice that they are rejected by the remote
12. Run the command `git fetch` to retrieve the changes from the fake remote
13. Run `git status` to see how your `master` branch and the remote `master` branch have diverged
12. Run `tig --all`. Observe the problem.
    1. Look at the difference between the remote tracking branch and the local branch.
13. What are the options now?
    1. git pull ...
    2. ...
    3. Can I just ignore Fitz's commit? How?
14. What are the different outcomes of these options?
15. Go through all of them and see the results.

## Relevant commands

- `git push`
- `git fetch`
- `git merge`
- `git log --oneline --decorate --graph --all`
- `git clone`
