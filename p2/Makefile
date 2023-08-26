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
	@vagrant ssh

reload:
	@vagrant reload 
