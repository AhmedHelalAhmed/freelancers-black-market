include .env

test-database:
	@cd laradock && docker-compose exec mysql mysql -u$(DB_USERNAME) -p$(DB_PASSWORD) -e \
		'CREATE DATABASE IF NOT EXISTS `test` CHARACTER SET utf8 COLLATE utf8_general_ci'

test:
	@cd laradock && docker-compose exec --user=laradock workspace php artisan test

seed:
	@cd laradock && docker-compose exec --user=laradock workspace php artisan migrate:fresh --seed

setup:
	@cd laradock && docker-compose exec --user=laradock workspace composer setup

bash:
	@cd laradock && docker-compose exec --user=laradock workspace bash

scout-import:
	@cd laradock && docker-compose exec --user=laradock workspace php artisan scout:import App\\Jobs

scout-flush:
	@cd laradock && docker-compose exec --user=laradock workspace php artisan scout:flush App\\Jobs

docker-up:
	@cd laradock && docker-compose up -d nginx mysql phpmyadmin workspace portainer redis laravel-horizon laravel-echo-server