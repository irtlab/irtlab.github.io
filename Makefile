default: deploy

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
