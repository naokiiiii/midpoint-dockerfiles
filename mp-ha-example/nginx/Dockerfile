# Dockerイメージの指定
FROM fuww/alpine-nginx-sticky

# nginx.confの配置
COPY ./conf/nginx.conf /etc/nginx/

# sever.confの配置
ADD ./sites-enabled/* /etc/nginx/sites-enabled/

# 証明書の配置
ADD ./certs/* /etc/nginx/
