FROM alpine:3.11.6

LABEL maintainer="Ztj <ztj1993@gmail.com>"

RUN apk update \
  && apk search -qe php7-* | grep -v gmagick | xargs apk add \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /run/apache2 \
  && ln -sf /dev/stdout /var/log/apache2/access.log \
  && ln -sf /dev/stderr /var/log/apache2/error.log \
  && sed -i "s@^#ServerName.*@ServerName localhost@" /etc/apache2/httpd.conf \
  && sed -i "s@Require ip 127@Require ip 127 192 10@" /etc/apache2/conf.d/info.conf \
  && sed -i "s@AllowOverride None@AllowOverride All@" /etc/apache2/httpd.conf \
  && sed -i "s@AllowOverride none@AllowOverride all@" /etc/apache2/httpd.conf \
  && sed -i "s@^#LoadModule rewrite_module@LoadModule rewrite_module@" /etc/apache2/httpd.conf \
  && sed -i "s@^#LoadModule info_module@LoadModule info_module@" /etc/apache2/httpd.conf

WORKDIR /srv
EXPOSE 80/tcp

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
