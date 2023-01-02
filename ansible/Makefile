.DEFAULT_GOAL := help

help::
	@egrep -h '\s##\s' $(MAKEFILE_LIST) \
		| awk -F':.*?## | \\| ' '{printf "\033[36m%-38s \033[37m %-68s \033[35m%s \n", $$1, $$2, $$3}'

apply-wireguard:: ## Install and configure wireguard
	ansible-playbook playbooks/wireguard.yaml

apply-rke2:: ## Install and configure rke2 single node cluster
	ansible-playbook playbooks/rke2.yaml