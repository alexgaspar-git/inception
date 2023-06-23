up:
	mkdir -p /home/algaspar/data/wordpress
	mkdir -p /home/algaspar/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up --detach

down:
	docker compose -f ./srcs/docker-compose.yml down

stop:
	docker compose -f ./srcs/docker-compose.yml stop

nuke:
	docker compose -f ./srcs/docker-compose.yml down
	docker rmi srcs-mariadb
	docker rmi srcs-nginx
	docker rmi srcs-wordpress
	docker volume rm srcs_mariadb_data
	docker volume rm srcs_wordpress_data
	sudo rm -rf /home/algaspar/data/mariadb/*
	sudo rm -rf /home/algaspar/data/wordpress/*
