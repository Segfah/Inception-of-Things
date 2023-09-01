.PHONY: up re install clean argocd

up:
	@chmod +x scripts/setup.sh
	@sh scripts/setup.sh

re: clean up

install_docker:
	@chmod +x scripts/docker_install.sh
	@sh scripts/docker_install.sh

install:
	@chmod +x scripts/argocd_install.sh scripts/k3d_install.sh scripts/kubectl_install.sh
	@sh scripts/kubectl_install.sh
	@sh scripts/k3d_install.sh
	@sh scripts/argocd_install.sh

clean:
	@kubectl delete ns argocd
	@kubectl delete ns dev
	
argocd:
	@kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
	@echo "\n"
	@kubectl port-forward svc/argocd-server -n argocd 8080:443
