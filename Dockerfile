# Based on https://github.com/nginxinc/docker-nginx/
FROM nginx

# Install the packages we need for getting things done
RUN apt-get update && \
    apt-get install -y \
      build-essential \
      dos2unix \
      git \
    && \
    apt-get clean

# Volume for config
VOLUME ["/config"]

# Volume for secrets
VOLUME ["/secrets"]

# Our wrapper script
COPY run.sh /tmp/run.sh
RUN dos2unix /tmp/run.sh
RUN chmod a+x /tmp/run.sh

# Run the wrapper script
CMD ["/tmp/run.sh"]
