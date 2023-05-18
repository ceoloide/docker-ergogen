#!/bin/sh
container_cmd=docker

# Ensure we switch to the /opt/ergogen working directory, pointing it
# at the repo root (when running the script from there)
container_args="-w /opt/ergogen -v $(pwd):/opt/ergogen --rm"

${container_cmd} run ${container_args} ceoloide/docker-ergogen npm run ergogen input/ --clear