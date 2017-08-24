#GET NPM dependencies
cd node_docker/node/
npm install
cd ../..

# build node
cd node_docker
docker build -t aenetworks/node:1.0 .

# build lamp
cd ../html_docker/php7.1/apache
docker build -t aenetworks/wordpress:1.0 .