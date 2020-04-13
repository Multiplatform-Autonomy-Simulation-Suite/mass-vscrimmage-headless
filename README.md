# vscrim_headless

## CI/CD Guide

Using GitLab CI, this repo has the following CI Stages:

1. Syntax-Lint -
    * shellcheck - searches for any shell scripts in the repo and executes shellcheck lint/syntax checker. Confer with https://github.com/koalaman/shellcheck/wiki/Checks for Error Code Reference.
    * hadolint - performs lint, syntax and shellcheck against the Dockerfile. Confer with https://github.com/hadolint/hadolint#rules for Error Code Reference.
2. Build - run on non-master branches, performs docker build and docker push to the harbor registry for image tagged as branch name. 
3. Build-Master - run only on the master branch, performs docker build and docker push to the harbor registry for the latest tag.
~                                                                                      