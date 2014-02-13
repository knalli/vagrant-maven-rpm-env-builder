#!/bin/sh

if [ "$1" = "-f" ]; then
  vagrant destroy -f
fi

vagrant up && vagrant package

echo "Finished!"
