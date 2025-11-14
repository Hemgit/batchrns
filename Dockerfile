FROM centos:7

# Point all repos to the vault and disable mirrorlists
RUN sed -i \
  -e 's|^mirrorlist=|#mirrorlist=|g' \
  -e 's|^#baseurl=http://mirror.centos.org/centos/\$releasever|baseurl=http://vault.centos.org/7.9.2009|g' \
  /etc/yum.repos.d/CentOS-Base.repo || true

# (Optional) explicitly set baseurl per repo to be precise:
# RUN cat >/etc/yum.repos.d/CentOS-Base.repo <<'EOF'
# [base]
# name=CentOS-7 - Base
# baseurl=http://vault.centos.org/7.9.2009/os/$basearch/
# gpgcheck=1
# enabled=1
# gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
#
# [updates]
# name=CentOS-7 - Updates
# baseurl=http://vault.centos.org/7.9.2009/updates/$basearch/
# gpgcheck=1
# enabled=1
#
# [extras]
# name=CentOS-7 - Extras
# baseurl=http://vault.centos.org/7.9.2009/extras/$basearch/
# gpgcheck=1
# enabled=1
# EOF
workdir /opt
RUN yum clean all && yum makecache && yum -y update && yum clean all
RUN yum install wget -y
cmd echo "hell this is cmd statement"
copy README.md .
env test="tesing the test variable"
#entrypoint echo " Hello tis is entrypoint cmd"
