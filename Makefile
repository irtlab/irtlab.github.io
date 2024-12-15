MAKEFLAGS += -j4

default: deploy

# Make sure we are on the main branch and that the repository
# is clean (i.e., contains no uncommited changes) before deploying
# the website

.PHONY: deploy-check-git
.ONESHELL:
.SHELLFLAGS: -e
check-git:
	test "$$(git branch --show-current)" == "main"
	test -z "$$(git status --porcelain)"

.PHONY: deploy-github
deploy-github: check-git
	git push origin

.PHONY: deploy-gitlab
deploy-gitlab: check-git
	git push gitlab

.PHONY: deploy
deploy: deploy-github deploy-gitlab
