FROM centos:8 AS downloader
RUN yum install -y unzip

ADD https://www.ubnt.com/downloads/unifi/5.11.50/UniFi.unix.zip .
RUN unzip UniFi.unix.zip

FROM centos:8
ADD mongodb.repo /etc/yum.repos.d/
RUN yum install -y java-1.8.0-openjdk-headless mongodb-org-server && yum clean -y all && rm -fr /var/cache/yum
WORKDIR /UniFi
COPY --from=downloader /UniFi/ ./

ADD entrypoint.sh /bin
ENTRYPOINT ["/bin/bash", "/bin/entrypoint.sh"]
CMD ["start"]
