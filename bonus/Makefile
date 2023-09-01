.PHONY: up re install clean argocd gitlab

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
	@kubectl delete ns gitlab

argocd:
	@kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
	@echo "\n"
	@kubectl port-forward svc/argocd-server -n argocd 8080:443

gitlab:
	@kubectl -n gitlab exec -it $(shell kubectl -n gitlab get pod -l app=gitlab -o jsonpath='{.items[0].metadata.name}') -- cat /etc/gitlab/initial_root_password

