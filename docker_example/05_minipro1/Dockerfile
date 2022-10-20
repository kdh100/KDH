FROM centos
# yum repolist 업데이트
RUN sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/*

# FTP 설치 - yum install -y vsftpd ftp
RUN yum install -y vsftpd ftp

# 설정 파일 복사
COPY vsftpd.conf /etc/vsftpd/
RUN cp /etc/passwd /var/ftp/pub/file.txt

# 포트 설정 - data:20, manage:21
EXPOSE 21 20

# 실행
CMD /usr/sbin/vsftpd