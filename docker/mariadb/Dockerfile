ARG MARIADB_VERSION

FROM mariadb:${MARIADB_VERSION}

## User configuration
ARG APPLICATION_USER_ID
ARG APPLICATION_USER_GROUP
RUN echo "mariadb-container:x:$APPLICATION_USER_ID:$APPLICATION_USER_GROUP:container,,,:/:/bin/bash" >> /etc/passwd
RUN echo "mariadb-container:x:$APPLICATION_USER_GROUP:" >> /etc/group
RUN apt-get update && apt-get install -y pv
