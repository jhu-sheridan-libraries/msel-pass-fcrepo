FROM oapass/fcrepo:4.7.5-2.0-SNAPSHOT-3

COPY bin/* /bin/
COPY lib/* ${CATALINA_HOME}/lib

RUN chmod 700 /bin/entrypoint.sh && \
    chmod 700 /bin/setup_fedora.sh

RUN rm -rf /usr/local/tomcat/fcrepo4-data
ENTRYPOINT [ "/bin/entrypoint.sh" ]
