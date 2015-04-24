# Dockerfile for scottabernethy/java
FROM scottabernethy/debian

ENV JAVA_VERSION 7
ENV JAVA_UPDATE 80
ENV JAVA_BUILD 15

ENV JAVA_HOME /usr/lib/jvm/java-${JAVA_VERSION}-oracle

RUN \
	curl --silent --location --retry 3 --cacert /etc/ssl/certs/GeoTrust_Global_CA.pem \
	--header "Cookie: oraclelicense=accept-securebackup-cookie;" \
	http://download.oracle.com/otn-pub/java/jdk/"${JAVA_VERSION}"u"${JAVA_UPDATE}"-b"${JAVA_BUILD}"/jdk-"${JAVA_VERSION}"u"${JAVA_UPDATE}"-linux-x64.tar.gz \
	| tar xz -C /tmp && \
	mkdir -p /usr/lib/jvm && mv /tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE} "${JAVA_HOME}" && \
	rm -r /usr/lib/jvm/java-7-oracle/lib/missioncontrol && \
	rm -r /usr/lib/jvm/java-7-oracle/lib/visualvm && \
	rm /usr/lib/jvm/java-7-oracle/src.zip

RUN \
	update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
	update-alternatives --install "/usr/bin/javaws" "javaws" "${JAVA_HOME}/bin/javaws" 1 && \
	update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 1 && \
	update-alternatives --set java "${JAVA_HOME}/bin/java" && \
	update-alternatives --set javaws "${JAVA_HOME}/bin/javaws" && \
	update-alternatives --set javac "${JAVA_HOME}/bin/javac"
