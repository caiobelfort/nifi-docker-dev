FROM apache/nifi:1.11.4


RUN mkdir ${NIFI_HOME}/configuration_resources
RUN mkdir ${NIFI_HOME}/configuration_resources/custom_lib
RUN mkdir ${NIFI_HOME}/jdbc_drivers/

RUN chown -R nifi ${NIFI_HOME}/jdbc_drivers

WORKDIR ${NIFI_HOME}/jdbc_drivers

RUN cd ${NIFI_HOME}/jdbc_drivers  \ 
    && wget  -O postgresql.jar  https://jdbc.postgresql.org/download/postgresql-42.2.16.jar  \
    && wget -O sqlserver.tar.gz https://go.microsoft.com/fwlink/?linkid=2137502 \
    && tar -xf sqlserver.tar.gz \
    && mv sqljdbc_8.4/enu/mssql-jdbc-8.4.1.jre8.jar mssql.jar && rm -r sqljdbc_8.4 && rm sqlserver.tar.gz


EXPOSE 9090 8080