#echo "usage ./_push.sh {commit message no spaces}"

DATE=$(date +"%m-%d-%y")
TIME=$(date +"%r")
cachebuster=$(date +"%s")

echo "backing up scripts"
cp -rf *.sh install_scripts/baseWordPress

echo "putting project in SOURCE"
cd TEMP/baseWordPress
mkdir -p haproxy
mkdir -p html
mkdir -p sql
mkdir -p node
cp -rf ../../SOURCE/haproxy/ haproxy/
cp -rf ../../SOURCE/html/ html/
cp -rf ../../SOURCE/sql/ sql/
cp -rf ../../node_docker/node/ node/

git status

if [ -z "$1" ]

then

	git add . && git commit -m "$1 : date:$DATE[$TIME] v.$cachebuster" && git push origin master

else

	git add . && git commit -m "AUTOCOMMIT : date:$DATE[$TIME] v.$cachebuster" && git push origin master

fi
