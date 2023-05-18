# docker-ergogen
A minimal docker image to run Ergogen

## How to build
To build the image you can run the following command:

```shell
docker build . -t docker-ergogen
```

## How to use
You can use this image to run ergogen CLI, for example:

```shell
docker run -w /tmp/ergogen -v $(pwd):/tmp/ergogen --rm ceoloide/docker-ergogen npm run ergogen input/ --clear
```

You can also run one of the bundled scripts, `build` and `debug` which will assume an `input/` folder containing a `config.yaml` file, and will clear previous output and generate new ones.

```shell
docker run -w /tmp/ergogen -v $(pwd):/tmp/ergogen --rm ceoloide/docker-ergogen npm run build
docker run -w /tmp/ergogen -v $(pwd):/tmp/ergogen --rm ceoloide/docker-ergogen npm run debug
```
