all:
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up --detach

clean:
	docker compose -f ./srcs/docker-compose.yml down
	docker rmi srcs-mariadb
	docker rmi srcs-nginx
	docker rmi srcs-wordpress
	docker volume rm srcs_mariadb_data
	docker volume rm srcs_wordpress_data
	sudo rm -rf ../data/mariadb/*
	sudo rm -rf ../data/wordpress/*
