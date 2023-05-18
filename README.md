# docker-ergogen
A minimal docker image to run [Ergogen](https://github.com/mrzealot/ergogen)

Prebuilt docker images are available on [Docker Hub under ceoloide/docker-ergogen](https://hub.docker.com/repository/docker/ceoloide/docker-ergogen/general).

The `:latest` tag is kept up to date with the latest stable Ergogen release, currently `4.0.2`. You can also refer to specific versions by referencing it in the tag, e.g. `:4.0.2`.

## How to use the prebuilt Docker image

If you don't want to build your own local image, you can use the [one hosted on Docker Hub](https://hub.docker.com/layers/ceoloide/docker-ergogen/latest/images/sha256-6de875089c9797ad88c619dcddb984d1d5f6a567d6e685cde66562ae696cd3d5?context=repo).

The image is based on Node v18 (bullseye-slim), and the Ergogen CLI is located here:

```
/usr/local/lib/node_modules/ergogen/src/cli.js
```

So if you want to run Ergogen's CLI based on your current folder, you can use a command like follows:

```shell
docker run -w /tmp/ergogen -v $(pwd):/tmp/ergogen --rm ceoloide/docker-ergogen:latest /usr/local/lib/node_modules/ergogen/src/cli.js
```

The current working directory (`$(pwd)`) is mounted into the Docker image filesystem at `/tmp/ergogen` with this part of the command:

```
-v $(pwd):/tmp/ergogen
```

The same directory is selected as the working directory inside the Docker image with this part of the command:

```
-w /tmp/ergogen
```

While the `-rm` flag cleans up the image after running. Note that the output is created in your local directory and will remain available after Docker completes the run.

### Using npm scripts

If you want to avoid having to refer to the full path of the `cli.js` file, you can have a local `package.json` file with a `script` section that runs an npm command. You can then use it as follows, assuming the script is named `build`:

```shell
docker run -w /tmp/ergogen -v $(pwd):/tmp/ergogen --rm ceoloide/docker-ergogen npm run build
```

## How to build
To build the image locally you can run the following command:

```shell
docker build . -t docker-ergogen
```

