FROM ztj1993/alpine-php7:latest

LABEL maintainer="Ztj <ztj1993@gmail.com>"

# PHP
RUN apk update
RUN apk search -qe php7-* | grep -v gmagick | xargs apk add
RUN rm -rf /var/cache/apk/*

# Apache
RUN apk add --no-cache apache2
RUN mkdir -p /run/apache2
RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log
RUN sed -i 's@^#ServerName.*@ServerName localhost@' /etc/apache2/httpd.conf
RUN sed -i "s@Require ip 127@Require ip 127 192 10@" /etc/apache2/conf.d/info.conf
RUN sed -i "s@AllowOverride None@AllowOverride All@" /etc/apache2/httpd.conf
RUN sed -i "s@AllowOverride none@AllowOverride all@" /etc/apache2/httpd.conf
RUN sed -i "s@^#LoadModule rewrite_module@LoadModule rewrite_module@" /etc/apache2/httpd.conf
RUN sed -i "s@^#LoadModule info_module@LoadModule info_module@" /etc/apache2/httpd.conf

EXPOSE 80/tcp
EXPOSE 443/tcp

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
