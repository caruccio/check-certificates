FROM openshift/origin-ansible:v3.9

MAINTAINER Talita Bernardes Pereira <talita@getupcloud.com>

USER root

RUN yum install jq -y && \
    yum clean all

COPY check-certificates /usr/local/bin/

COPY ansible.cfg /etc/ansible/

USER 1001

CMD ["/usr/local/bin/check-certificates"]
