#
# Ruby Bonial Dockerfile
#
# https://github.com/dockerfile/ruby
#

# Pull base image.
FROM prom/prometheus 
ADD prometheus.yml /etc/prometheus/

# Install Ruby.
# RUN \
#   apt-get update && \
#   apt-get install -y ruby ruby-dev ruby-bundler && \
#   rm -rf /var/lib/apt/lists/*

# Define working directory.
#WORKDIR /data


#RUN mkdir -p /usr/src/app
#WORKDIR /usr/src/app
#COPY prometheus.yaml /usr/src/app/prometheus.yaml
EXPOSE 9090
#CMD ruby main.rb
# Define default command.
#CMD ["bash"]