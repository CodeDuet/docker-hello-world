############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################


# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Kevin Sapp

# Install Nginx

# Update the repository
RUN apt-get update

# Install necessary web and network tools
RUN apt-get install -y vim wget dialog net-tools

#Install nginx web server
RUN apt-get install -y nginx

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

#Create logs folder
RUN mkdir /etc/nginx/logs

# Add the sample hello world index html file
ADD index.html /www/data/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD ["nginx"]
