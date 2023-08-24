.PHONY: up re status clean fclean ssh reload

up:
	@vagrant up

re: clean up

install:
	@chmod +x scripts/docker_install.sh scripts/k3d_install.sh scripts/kubectl_install.sh
	@sh scripts/docker_install.sh
	@sh scripts/k3d_install.sh
	@sh scripts/kubectl_install.sh

status:
	@vagrant global-status

clean:
	@rm -rf node-token
	@vagrant destroy -f

fclean: clean
	@vagrant global-status --prune

ssh:
	@vagrant ssh

reload:
	@vagrant reload 
