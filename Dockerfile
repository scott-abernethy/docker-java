# Dockerfile for scottabernethy/java
FROM scottabernethy/debian

# Grab Oracle java 7 (auto accept licence)

RUN \
	echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
	echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
	echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
	apt-get update && \
	apt-get install -y oracle-java7-installer && \
	rm -r /var/cache/oracle-jdk7-installer && \
	rm -r /usr/lib/jvm/java-7-oracle/lib/missioncontrol && \
	rm -r /usr/lib/jvm/java-7-oracle/lib/visualvm && \
	rm /usr/lib/jvm/java-7-oracle/src.zip && \
	rm /usr/lib/jvm/java-7-oracle/javafx-src.zip

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
