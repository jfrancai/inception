FROM debian:11-slim

RUN apt-get update
RUN apt-get install -y curl \
		gnupg2 \
		ca-certificates \
		lsb-release \
		debian-archive-keyring \
		nginx \
		openssl

RUN mkdir -p /etc/nginx/ssl && \
	openssl req \
		-newkey rsa:4096 \
		-x509 \
		-days 60 \
		-nodes \
		-out /etc/nginx/ssl/cert.pem \
		-keyout /etc/nginx/ssl/cert.key \
		-subj '/CN=localhost'

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"] 
