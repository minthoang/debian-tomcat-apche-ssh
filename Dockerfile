FROM tomcat:latest

RUN apt-get update && \
    apt-get install vim -y && \
    apt-get install apache2 -y && \
	apt-get install libapache2-mod-jk -y && \
    apt-get install openssh-server -y && \
	mkdir /run/sshd && \
	chmod 0755 -R /run/sshd && \
	echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

RUN apt-get install supervisor -y && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d

EXPOSE 8080 80 22
COPY supervisor.conf /etc/supervisor.conf
CMD ["supervisord", "-c", "/etc/supervisor.conf"]


	
	

