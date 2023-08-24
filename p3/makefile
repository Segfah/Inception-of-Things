.PHONY: up re install clean fclean

up:

re: clean up

install:
	@chmod +x scripts/docker_install.sh scripts/k3d_install.sh scripts/kubectl_install.sh
	@sh scripts/docker_install.sh
	@sh scripts/k3d_install.sh
	@sh scripts/kubectl_install.sh

clean:
	
fclean: clean

