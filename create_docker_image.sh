ERGOGEN_VERSION=4.0.2
rm -f package.json.bak
sed -i .bak -E "s/version\"\: \"[^\"]+/version\": \"${ERGOGEN_VERSION}/g" package.json
sed -i .bak -E "s/github\:ergogen\/ergogen\#v[^\"]+/github:ergogen\/ergogen#v${ERGOGEN_VERSION}/g" package.json
rm -rf node_modules
rm -f package-lock.json
npm install
if [ -d node_modules ]; then
  docker build . -t ceoloide/docker-ergogen:${ERGOGEN_VERSION}
  docker push ceoloide/docker-ergogen:${ERGOGEN_VERSION}
  docker tag ceoloide/docker-ergogen:${ERGOGEN_VERSION} ceoloide/docker-ergogen:latest
  docker push ceoloide/docker-ergogen:latest
fi