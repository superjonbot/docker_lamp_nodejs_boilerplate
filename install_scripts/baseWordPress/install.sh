PROJECT="baseWordPress"

cp -rf ./_*.sh ../../

rm -rf ../../TEMP/$PROJECT
git clone https://superjonbot@bitbucket.org/superjonbot/basewordpress.git ../../TEMP/$PROJECT

cd ../../TEMP/$PROJECT
ls
cp -rf haproxy ../../SOURCE/
cp -rf html ../../SOURCE/
cp -rf sql ../../SOURCE/
cp -rf node ../../node_docker/
