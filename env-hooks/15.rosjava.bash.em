#!/bin/bash

@[if DEVELSPACE]@
SCRIPT=@(CMAKE_CURRENT_SOURCE_DIR)/generate_environment_variables.py
@[else]@
SCRIPT=@(CMAKE_INSTALL_PREFIX)/share/rosjava_build_tools/generate_environment_variables.py
@[end if]@

if command -v python 1>/dev/null; then PYTHON_EXECUTABLE=python
elif command -v python3 1>/dev/null; then PYTHON_EXECUTABLE=python3
elif command -v python2 1>/dev/null; then PYTHON_EXECUTABLE=python2
else PYTHON_EXECUTABLE=python
fi

export ROS_MAVEN_PATH="`${PYTHON_EXECUTABLE} ${SCRIPT} --maven-path`"
export ROS_MAVEN_DEPLOYMENT_REPOSITORY="`${PYTHON_EXECUTABLE} ${SCRIPT} --maven-deployment-repository`"
export ROS_MAVEN_REPOSITORY="`${PYTHON_EXECUTABLE} ${SCRIPT} --maven-repository`"
