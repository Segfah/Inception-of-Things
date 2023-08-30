.PHONY: up re install clean fclean

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
	@chmod +x scripts/cleanup.sh
	@sh scripts/cleanup.sh
	
fclean: clean

