#!/usr/bin/env bash

docker run --rm --name execucao_robot \
-v "$PWD/tests":/home/robot/tests \
-v "$PWD/keywords":/home/robot/keywords \
-v "$PWD/results":/home/robot/results \
robot_automation:latest robot -d /home/robot/results \
-N "Execuçao no Docker" /home/robot/tests