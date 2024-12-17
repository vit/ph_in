#!/bin/bash

#judgement
if [[ -a /etc/supervisor/conf.d/supervisord.conf ]]; then
  exit 0
fi

#supervisor
cat > /etc/supervisor/conf.d/supervisord.conf <<EOF
[supervisord]
nodaemon=true

[program:postfix]
command=/opt/postfix.sh

[program:rsyslog]
command=/usr/sbin/rsyslogd -n -c3
EOF

############
#  postfix
############


cp /run/secrets/mydestination /etc/postfix/mydestination
cp /run/secrets/virtual /etc/postfix/virtual

cat >> /opt/postfix.sh <<EOF
#!/bin/bash
service postfix start
tail -f /var/log/mail.log
EOF
chmod +x /opt/postfix.sh

postconf -e virtual_alias_maps=hash:/etc/postfix/virtual
postconf -e mydestination=/etc/postfix/mydestination
postconf -F '*/*/chroot = n'

postmap /etc/postfix/virtual


