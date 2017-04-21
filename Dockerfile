FROM python

MAINTAINER Allen Vailliencourt <allen.vailliencourt@forty8fiftylabs.com>

RUN apt-get update && apt-get upgrade -y && \
    git clone https://github.com/Alfresco/aws-cis-security-benchmark && \
    pip install awscli ansi2html
    
WORKDIR /reports

COPY prowler-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]