cp -rf ./*.sh ../../

rm -rf ../../TEMP/baseWordPress
git clone https://superjonbot@bitbucket.org/superjonbot/basewordpress.git ../../TEMP/baseWordPress

cd ../../TEMP/baseWordPress
ls
cp -rf haproxy ../../SOURCE/
cp -rf html ../../SOURCE/
cp -rf sql ../../SOURCE/
cp -rf node ../../node_docker/

# 

# rm -rf haproxy
# rm -rf html
# rm -rf sql
# rm -rf node

# rm -rf ./*.sh

# cd .. 