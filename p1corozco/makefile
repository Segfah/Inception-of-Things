.PHONY: up status clean fclean ssh

up:
	@vagrant up

status:
	@vagrant global-status

clean:
	@vagrant destroy -f

fclean: clean
	@vagrant global-status --prune

ssh:
	@if [ "$(VM)" = "" ]; then \
		echo "Usage: make ssh VM=<vm_name>"; \
	else \
		vagrant ssh $(VM); \
	fi
