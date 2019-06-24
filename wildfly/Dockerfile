FROM jboss/wildfly:16.0.0.Final

EXPOSE 8080 8443 9990

USER root
RUN yum install -y less vim && yum clean all
COPY --chown=jboss:root mgmt-users.properties /opt/jboss/wildfly/standalone/configuration

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
