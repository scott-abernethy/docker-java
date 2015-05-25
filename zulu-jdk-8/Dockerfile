# Dockerfile for scottabernethy/java:z8
FROM scottabernethy/busybox

ENV ZULU_BUILD zulu1.8.0_45-8.7.0.5-x86lx64
ENV ZULU_BUILD_DATE 2015-04-8.7
ENV JAVA_HOME /opt/${ZULU_BUILD}

RUN \
	curl -e http://www.azulsystems.com/products/zulu/downloads\#Linux \
		-o /tmp/jdk.zip \
		http://cdn.azulsystems.com/zulu/${ZULU_BUILD_DATE}-bin/${ZULU_BUILD}.zip && \
	# echo "e860784aacc77b2b865dd1e6a5d9392c  /tmp/jdk.zip" | md5sum -c && \
	unzip -q /tmp/jdk.zip -d /opt && \
	rm /tmp/jdk.zip && \
	rm ${JAVA_HOME}/src.zip && \
	rm -rf ${JAVA_HOME}/demo && \
	rm -rf ${JAVA_HOME}/man && \
	rm -rf ${JAVA_HOME}/sample

RUN ln -s ${JAVA_HOME}/bin/java /usr/bin/java
RUN ln -s ${JAVA_HOME}/bin/javac /usr/bin/javac
