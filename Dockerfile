FROM ubuntu

COPY devbox /usr/bin/devbox
COPY ctest /usr/bin/ctest
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get install -y build-essential git vim perl gcc nodejs nodejs-legacy docker-engine curl

RUN useradd dev
RUN mkdir /home/dev
RUN chown dev -R /home/dev
RUN curl -L https://cpanmin.us | perl - --sudo App::cpanminus
RUN cpanm Mojolicious
WORKDIR /home/dev
ENV HOME /home/dev

RUN curl -Lvk -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u73-b02/jdk-8u73-linux-x64.tar.gz > /tmp/jdk8.tgz
RUN tar zxf /tmp/jdk8.tgz -C /usr/local/
RUN rm -f /tmp/jdk8.tgz
ENV JAVA_HOME "/usr/local/jdk1.8.0_73"
ENV PATH $PATH:"/usr/local/jdk1.8.0_73/bin"
COPY jtest /usr/bin/jtest

#RUN sudo gpasswd -a dev docker

VOLUME /var/run/docker.sock

#USER dev

#RUN git clone https://github.com/tadzik/rakudobrew /home/dev/.rakudobrew
#RUN /home/dev/.rakudobrew/rakudobrew build moar
#RUN /home/dev/.rakudobrew/rakudobrew build panda
#
#RUN panda install Task::Star

CMD bash
