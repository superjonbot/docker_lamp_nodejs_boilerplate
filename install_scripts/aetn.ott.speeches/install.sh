rm -rf ../TEMP/aetn.ott.speeches
git clone https://github.com/aenetworks/aetn.ott.speeches.git ../TEMP/aetn.ott.speeches

cd ../TEMP/aetn.ott.speeches
ls
cp -rf haproxy ../../SOURCE/
cp -rf html ../../SOURCE/
cp -rf sql ../../SOURCE/
cp -rf node ../../node_docker/

#cp -rf ./*.sh ../../

rm -rf haproxy
rm -rf html
rm -rf sql
rm -rf node

cd ..