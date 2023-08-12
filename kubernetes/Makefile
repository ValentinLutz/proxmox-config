.DEFAULT_GOAL := help

help::
	@egrep -h '\s##\s' $(MAKEFILE_LIST) \
		| awk -F':.*?## | \\| ' '{printf "\033[36m%-38s \033[37m %-68s \033[35m%s \n", $$1, $$2, $$3}'


apply.external-dns:: ## Apply external dns
	kubectl apply --kustomize external-dns --prune -l app=external-dns

delete.external-dns:: ## Delete external dns
	kubectl delete --kustomize external-dns


apply.dashboard:: ## Apply kubernetes dashboard
	kubectl apply --kustomize dashboard --prune -l app=kubernetes-dashboard

delete.dashboard:: ## Delete kubernetes dashboard
	kubectl delete --kustomize dashboard


apply.homer:: ## Apply homer dashboard
	kubectl apply --kustomize homer --prune -l app=homer

delete.homer:: ## Delete homer dashboard
	kubectl delete --kustomize homer
