.PHONY: up re status clean fclean ssh reload

up:
	@vagrant up

re: clean up

status:
	@vagrant global-status

clean:
	@rm -rf node-token
	@vagrant destroy -f

fclean: clean
	@vagrant global-status --prune

ssh:
	@if [ "$(VM)" = "" ]; then \
		echo "Usage: make ssh VM=<vm_name>"; \
	else \
		vagrant ssh $(VM); \
	fi

reload:
	@if [ "$(RL)" = "" ]; then \
		echo "Usage: make reload RL=<vm_name>"; \
	else \
		vagrant reload $(RL); \
	fi
