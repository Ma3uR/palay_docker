# dev-tools
Useful tools for local development

## Requirements
* Install `mkcert`, for macOS for example `brew install mkcert`
* You will need **mysql** dump file of database
* **ONLY FOR `SK` application** - Your `APPLICATION_DOMAIN` has to be added in `member_domain` table(sk admin panel - `Project Commander->Site Manager->Domains`)
* You may need to run `./scripts/generate-nginx-certificates.sh {applicationName}` to generate certificates that will be used in nginx **{applicationName}.conf**, better to run it before **docker** init and when you set all data in `.env` config

## Deployment
* Copy `.env.dist` to `.env`
* Set your environment with `.env`

* Put your ssl certificates to `docker/nginx/{env}/certs` directory, naming - `{applicationName}-cert.pem` and `{applicationName}-key.pem` (e.g. to `docker/nginx/dev/certs/{applicationName}-cert.pem` and `docker/nginx/dev/certs/{applicationName}-key.pem`)
* Run `docker-compose up -d` in docker folder

## Database recreation - if you need to reset you database and have dump
* Put db dump to `docker/mariadb/dumps/{applicationName}`, change name to `dump.sql`
    * Note: make dump with `--databases` parameter or add `CREATE DATABASE` and `USE` statements in the beginning of dump file
* run script `./scripts/recreate-database.sh {applicationName}` after **deployment** was finished and your docker container with `mariadb` is running
* make coffee and wait!

## Configuration
##### PHP
* Create custom config file in `docker/php/{env}/config` (e.g `75-custom-config.php`) to add own configuration to container
##### Nginx
* You can create custom configuration files in `docker/nginx/{env}/config`. All `*.conf` files from this directory will be imported.
##### MySQL
* You can create custom configuration files in `docker/mariadb/config`. All `*.cnf` files from this directory will be imported.
* You can connect to local database from database tools(TablePlus, MysqlWorkbench, Navicat) with credentials you set in **.env** `MARIADB.*`

## Hints
##### How to use Node container
* Use following syntax: `docker-compose run node <command>`

##### Generating trusted ssl certificate for local environment
* `mkcert` tool allow generating trusted localhost ssl certificates
* Install `mkcert`:
`````
wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
mv mkcert-v1.1.2-linux-amd64 mkcert
chmod +x mkcert
cp mkcert /usr/local/bin/
mkcert -install
`````
* Generate certificates:
`````
mkcert "your.domain.local" localhost 127.0.0.1 ::1
`````
