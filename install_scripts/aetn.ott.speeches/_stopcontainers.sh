# save database
while true; do
    read -p "Do you want to save the wordpress database? (type n if you haven't modified) > " yn
    case $yn in
        [Yy]* ) docker exec -ti wordpressdb sh -c "mysqldump -ppassword wordpress > tmp/backup.sql"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# stop and remove docker containers and custom network
docker stop $(docker ps -a -q)
docker network rm mylocalnet
docker rm $(docker ps -a -q)

