#!/usr/bin/env bash
DEFAULT_VH_ROOT='/var/www/vhosts'
DOMAIN=$URL

echo "listener HTTP {
  address                 *:80
  secure                  0
}

listener HTTPS {
  address                 *:443
  secure                  1
  keyFile                 /usr/local/lsws/admin/conf/webadmin.key
  certFile                /usr/local/lsws/admin/conf/webadmin.crt
}

vhTemplate docker {
  templateFile            conf/templates/docker.conf
  listeners               HTTP, HTTPS
  note                    docker

  member $DOMAIN {
    vhDomain              $DOMAIN, *
  }
}

" >> /usr/local/lsws/conf/httpd_config.conf

mkdir -p $DEFAULT_VH_ROOT/$DOMAIN/{html,logs,certs}
chown 1000:1000 $DEFAULT_VH_ROOT/$DOMAIN/ -R
