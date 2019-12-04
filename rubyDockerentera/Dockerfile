#
# Ruby entera Dockerfile
#
# https://github.com/dockerfile/ruby
#

# Pull base image.
FROM ruby

# Install Ruby.
# RUN \
#   apt-get update && \
#   apt-get install -y ruby ruby-dev ruby-bundler && \
#   rm -rf /var/lib/apt/lists/*

# Define working directory.
#WORKDIR /data


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
EXPOSE 2345
RUN ruby main.rb
#CMD ruby main.rb
# Define default command.
#CMD ["bash"]