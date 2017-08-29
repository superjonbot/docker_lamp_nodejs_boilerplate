PROJECT="baseWordPress"
REPO="https://superjonbot@bitbucket.org/superjonbot/basewordpress.git"

cp -rf ./_*.sh ../../

rm -rf ../../TEMP/$PROJECT
git clone $REPO ../../TEMP/$PROJECT

cd ../../TEMP/$PROJECT

mkdir -p _require_stack2.0
git clone https://superjonbot@bitbucket.org/superjonbot/chrysalis.git html/_require_stack2.0
mkdir -p _require_stack1.0
git clone https://superjonbot@bitbucket.org/superjonbot/monarch_dev.git html/_require_stack1.0
mkdir -p _webpack_stack1.0
git clone https://superjonbot@bitbucket.org/superjonbot/webpack_stack1.0.git html/_webpack_stack1.0

cp -rf haproxy ../../SOURCE/
cp -rf html ../../SOURCE/
cp -rf sql ../../SOURCE/
cp -rf node ../../node_docker/



