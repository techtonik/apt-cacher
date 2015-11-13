#apt-cacher v0.3

FROM ubuntu:latest
MAINTAINER Bradley Cicenas <bradley.cicenas@gmail.com>

RUN apt-get -yqq update && \
    apt-get install -yq nginx wget

ADD . /app 

RUN /bin/bash /app/mkdirs.sh && \
    ln -nsf /app/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD /bin/bash /app/run.sh
