PROJECT="aetn.ott.speeches"
cd TEMP/$PROJECT
git fetch --all
git status

read -p "update? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
   git pull --rebase
   git reset --hard HEAD
   cp -rf haproxy ../../SOURCE/
   cp -rf html ../../SOURCE/
   cp -rf sql ../../SOURCE/
   cp -rf agent ../../SOURCE/
   cp -rf node ../../node_docker/
else
   echo "continung"
fi

cd ../..

# make custom network
docker network create --driver bridge --subnet=172.18.0.0/16 mylocalnet

# run sql and wordpress containers
docker run --net mylocalnet --ip="172.18.0.2" --name wordpressdb -v $(pwd)/SOURCE/sql:/tmp -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress -d mysql:5.7
docker run --net mylocalnet --ip="172.18.0.3" -p 8080:80 -e WORDPRESS_DB_PASSWORD=password -d --name wordpress -v $(pwd)/SOURCE/html:/var/www/html --link wordpressdb:mysql  aenetworks/wordpress:1.0

# run the haproxy server
docker run --net mylocalnet --ip="172.18.0.5" -p 8000:80 -d --name my-haproxy-container -v $(pwd)/SOURCE/haproxy:/usr/local/etc/haproxy:ro haproxy:1.7

# run the node server and make the symbolic link so everything is in /SOURCE
rm $(pwd)/SOURCE/node # This ok to fail
ln -s $(pwd)/node_docker/node $(pwd)/SOURCE
cd node_docker
docker run --net mylocalnet --ip="172.18.0.4" --name nodeJS -d -p 3000:3000 -v $(pwd)/../SOURCE/node:/usr/src/app aenetworks/node:1.0

# nuke unused default wordpress files
cd ..
sleep 30
./_deleteunused.sh

# refresh database from saved
#while true; do
#    read -p "Do you want to install the last saved database (type y if you don't know)?" yn
#    case $yn in
#        [Yy]* ) docker exec -d wordpressdb sh -c "mysql -ppassword wordpress < tmp/backup.sql"; break;;
#        [Nn]* ) break;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done
docker exec -d wordpressdb sh -c "mysql -ppassword wordpress < tmp/backup.sql"

# open safari for related pages
sleep 10
open -a safari http://127.0.0.1:8000/search?lastname=obama
open -a safari http://127.0.0.1:8000/alexa_speeches/
# open -a safari http://127.0.0.1:8000/wp/
open -a safari http://127.0.0.1:8000/docs/history_speeches_vui.pdf
open -a safari https://api.ai

# type the readme and show the nodeJS log
cat readme.txt
clear
echo "starting nodeJS log..."
docker logs -f nodeJS