#this docker file for slave node 
FROM ubuntu
RUN apt-get update -qy && apt-get install openjdk-17-jdk -qy && apt-get install -qy maven && apt-get install -qy git && apt-get install -qy openssh-server
RUN sed -i 's|session    required     pam_loginuid.so |session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&  mkdir -p /var/run/sshd
RUN useradd -ms /bin/bash jenkins --home /home/jenkins &&  echo "jenkins:1234" | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
# this size 800 mp
#-----------------------------------------------------------------------
# FROM eclipse-temurin:17-jdk
# RUN apt-get update -qy && \
#     apt-get install -qy openssh-server git maven && \
#     rm -rf /var/lib/apt/lists/*
# RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
#     mkdir -p /var/run/sshd
# RUN useradd -ms /bin/bash jenkins && echo "jenkins:1234" | chpasswd
# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]