up: docker-up

#init: docker-clear docker-up api-permissions api-env api-composer api-genrsa api-migration ui-env ui-install ui-build storage-permissions websocket-env websocket-key websocket-install websocket-start

docker-clear:
	docker-compose down --remove-orphans
	sudo rm -rf api/var/docker

docker-up:
	docker-compose up --build -d

# api-permissions:
# 	sudo chown 777 api/...

api-env:
	docker-compose exec api-php-cli rm -f .env
	docker-compose exec api-php-cli ln -sr .env.example .env

api-composer:
	docker-compose exec api-php-cli composer install

# api-genrsa:
# 	docker-compose exec api-php-cli openssl genrsa -out private.key 2048
# 	docker-compose exec api-php-cli openssl rsa -in private.key -pubout -out public.key

#api-migration:
#	docker-compose exec api-php-cli php artisan migrate

ui-env:
	docker-compose exec ui-nodejs rm -f .env.local
	docker-compose exec ui-nodejs ln -sr .env.local.example .env.local

ui-install:
	docker-compose exec ui-nodejs npm install

ui-build:
	docker-compose exec ui-nodejs npm run build

#storage-permissions:
#	sudo chown 777 storage/public/...