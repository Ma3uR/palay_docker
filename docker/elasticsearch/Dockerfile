# Use the official Elasticsearch base image for version 8.9.1
FROM docker.elastic.co/elasticsearch/elasticsearch:8.9.1

# Example: Add custom configuration
# COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Example: Install Elasticsearch plugins
# RUN elasticsearch-plugin install some-plugin

# Example: Set Elasticsearch JVM options (optional)
# ENV ES_JAVA_OPTS="-Xmx2g -Xms2g"

# Expose Elasticsearch ports
EXPOSE 9200 9300

# Start Elasticsearch
CMD ["elasticsearch"]
