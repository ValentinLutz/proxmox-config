.DEFAULT_GOAL := help

help::
	@egrep -h '\s##\s' $(MAKEFILE_LIST) \
		| awk -F':.*?## | \\| ' '{printf "\033[36m%-38s \033[37m %-68s \033[35m%s \n", $$1, $$2, $$3}'

plan:: ## Plan terraform resources
	terraform plan -var-file="secrets.tfvars"

apply:: ## Apply terraform resources
	terraform apply -var-file="secrets.tfvars"

destroy:: ## Destroy terraform resources
	terraform destroy -var-file="secrets.tfvars"