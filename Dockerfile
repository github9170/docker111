FROM ubuntu

RUN apt-get update && apt-get install -y \
    apache2 \
    zip \
    unzip \
    apache2-utils \
    wget && \
    apt-get clean

WORKDIR /var/www/html

RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip && \
    unzip healet.zip && \
    cp -rvf healet-html/* /var/www/html && \
    rm -rf healet healet-html healet.zip

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
