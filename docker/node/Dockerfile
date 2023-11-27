ARG NODE_VERSION

FROM node:${NODE_VERSION}

## User configuration
ARG APPLICATION_USER_ID
ARG APPLICATION_USER_GROUP
RUN echo "node-container:x:$APPLICATION_USER_ID:$APPLICATION_USER_GROUP:container,,,:/:/bin/bash" >> /etc/passwd
RUN echo "node-container:x:$APPLICATION_USER_GROUP:" >> /etc/group

## Install gulp
RUN npm install --global gulp-cli
