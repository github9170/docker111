FROM ubuntu

RUN apt-get update && apt-get install -y \
    apache2 \
    zip \
    unzip \
    apache2-utils && \
    apt-get clean

ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html/

WORKDIR /var/www/html

RUN unzip healet.zip && \
    ls && \
    cp -rvf healet-html/* /var/www/html && \
    rm -rf healet healet-html healet.zip

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
