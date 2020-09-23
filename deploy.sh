#!/bin/bash

set -e

BBB_PLAYBACK_HOMEPAGE=playback
BBB_PLAYBACK=/var/www/$BBB_PLAYBACK_HOMEPAGE

if ! [ -f ${BBB_PLAYBACK} ]; then
    sudo mkdir -p ${BBB_PLAYBACK}
fi

export REACT_APP_BBB_PLAYBACK_BUILD=$(git rev-parse --short HEAD)

npm run-script build
sudo rm -rf $BBB_PLAYBACK
sudo cp -r ./build $BBB_PLAYBACK
sudo cp -r ./playback.ngninx $BBB_PLAYBACK
sudo chown --recursive www-data:www-data $BBB_PLAYBACK
