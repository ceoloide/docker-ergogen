# Best practices documented at https://snyk.io/blog/10-best-practices-to-containerize-nodejs-web-applications-with-docker/
ARG node_ver=17.1.0
FROM node:${node_ver}-bullseye-slim
LABEL Description="Minimal Ergogen Docker image" \
      Author="Marco Massarelli <marco.massarelli@gmail.com>"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends dumb-init

# Optimize Node.js apps for production
ENV NODE_ENV production

# Set the working directory
WORKDIR /tmp/ergogen

# Install Ergogen and other dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm i -g --only=production

# By default the base Node Docker image runs as root
USER node

CMD ["dumb-init", "node", "server.js"]