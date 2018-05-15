FROM oapass/fcrepo:4.7.5-2.0-SNAPSHOT-5

COPY bin/* /bin/
COPY lib/* ${CATALINA_HOME}/lib

ENV ENVIRONMENT=${ENVIRONMENT:-None}

RUN apk update && \
    apk add --no-cache python py-pip  && \
    pip install awscli && \
    chmod 700 /bin/entrypoint.sh && \
    chmod 700 /bin/setup_fedora.sh

RUN rm -rf /usr/local/tomcat/fcrepo4-data
ENTRYPOINT [ "/bin/entrypoint.sh" ]
