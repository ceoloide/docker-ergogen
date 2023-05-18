#!/bin/sh
container_cmd=docker

# Ensure we switch to the /opt/ergogen working directory, pointing it
# at the repo root (when running the script from there)
container_args="-w /opt/ergogen -v $(pwd):/opt/ergogen --rm"

# The following script mounts the current folder obtained with $(pwd) into /opt/ergogen in
# the Docker image filesystem, and sets the working director to be the same. The --rm flag
# ensures the image is deleted after running to clean up. Note that outputs are persisted
# in the local filesystem since it got mounted into the Docker image, so they will remain
# available after running.
${container_cmd} run ${container_args} ceoloide/docker-ergogen npm run ergogen input/ --clear