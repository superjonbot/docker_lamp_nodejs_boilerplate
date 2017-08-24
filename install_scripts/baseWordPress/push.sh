if [ -z "$1" ]

then

echo "usage ./baseWordPress_push.sh {commit message no spaces}"

else

DATE=$(date +"%m-%d-%y")
TIME=$(date +"%r")
cachebuster=$(date +"%s")

cd ../TEMP/baseWordPress
ls
mkdir -p haproxy
mkdir -p html
mkdir -p sql
mkdir -p node
cp -rf ../../SOURCE/haproxy/ haproxy/
cp -rf ../../SOURCE/html/ html/
cp -rf ../../SOURCE/sql/ sql/
cp -rf ../../node_docker/node/ node/

cp -rf ../../*.sh .

git status

echo " "

git add . && git commit -m "$1 : date:$DATE[$TIME] v.$cachebuster" && git push origin master

rm -rf haproxy
rm -rf html
rm -rf sql
rm -rf node

rm -rf ./*.sh

fi
