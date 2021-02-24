FROM alpine
RUN apk add postfix sqlite postfix-sqlite bash
RUN mkdir /data
EXPOSE 25
COPY run.sh /run.sh
COPY sqlite.dmp /
COPY maps /etc/postfix/
COPY main.cf /etc/postfix/main.cf
COPY master.cf /etc/postfix/master.cf
COPY sasl_passwd /etc/postfix/
COPY rspamd/local.d/ /etc/rspamd/local.d/
COPY blacklist /etc/postfix/blacklist
COPY nginx/ /etc/nginx/conf.d
RUN postmap /etc/postfix/sasl_passwd
RUN chmod +x /run.sh
RUN cat /sqlite.dmp | sqlite3 /data/postfix.sqlite
CMD ["/run.sh"]