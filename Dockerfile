FROM centos:centos6

MAINTAINER sdsdev7@gmail.com

# Enable EPEL for Node.js
RUN rpm -UvH https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
#RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node...
RUN yum install -y npm

#workaround for issue 20191
#https://github.com/npm/npm/issues/20191
RUN npm config set strict-ssl false

#Ensure npm is updated
#RUN npm install npm -g

# Copy app to /src
COPY . /src

# Install app and dependencies into /src
RUN cd /src; npm install

EXPOSE 8080

CMD cd /src && node ./app.js
