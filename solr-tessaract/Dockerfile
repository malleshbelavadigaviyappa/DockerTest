FROM centos:7
RUN echo "gpgcheck=0" >> /etc/yum.conf
RUN yum-config-manager --add-repo https://download.opensuse.org/repositories/home:/Alexander_Pozdnyakov/RHEL_7/
RUN yum update -y --nogpg
RUN yum install java-1.8.0-openjdk.x86_64 wget -y
RUN yum install tesseract tesseract-langpack-deu -y
RUN wget http://apache.org/dist/lucene/solr/8.2.0/solr-8.2.0.tgz 
RUN tar xzf solr-8.2.0.tgz
RUN export TESSDATA_PREFIX=/usr/share/tesseract/4/tessdata/
COPY topla-core /solr-8.2.0/server/solr/topla-core
COPY docker-entrypoint.sh  .
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT [ "./docker-entrypoint.sh" ]

