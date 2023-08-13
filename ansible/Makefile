.DEFAULT_GOAL := help

help::
	@egrep -h '\s##\s' $(MAKEFILE_LIST) \
		| awk -F':.*?## | \\| ' '{printf "\033[36m%-38s \033[37m %-68s \033[35m%s \n", $$1, $$2, $$3}'

apply.nginx:: ## Install and configure nginx
	ansible-playbook playbooks/nginx.yaml -v

apply.wireguard:: ## Install and configure wireguard
	ansible-playbook playbooks/wireguard.yaml -v

apply.pihole:: ## Install and configure pihole
	ansible-playbook playbooks/pihole.yaml -v

apply.grafana:: ## Install and configure grafana
	ansible-playbook playbooks/grafana.yaml -v
