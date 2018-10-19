#!/bin/bash
#port=$1
#domain_name=$2
#document_root=$3
#index_php=$4


function config_apache () {
        if [ ! -d /usr/local/apache2/conf/extra/ ];then
                mkdir -p /usr/local/apache2/conf/extra
        fi
        #git clone https://github.com/nctvd123/apache_config.git
        #mv `pwd`/apache_config/vituarlhost.conf /usr/local/apache2/conf/extra/
        #mv /usr/local/apache2/conf/extra/vituarlhost.conf /usr/local/apache2/conf/extra/$1.conf
        touch /usr/local/apache2/conf/extra/$1.conf
        echo -e "Listen $2 \n" > /usr/local/apache2/conf/extra/$1.conf
        for ((i=0;i<=22;i++))
        do
                sed -i '2s/^/\n/' /usr/local/apache2/conf/extra/$1.conf
        done
        sed -i '2s#^#<VirtualHost *:$2>#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '3s#^#  ServerName $3#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '4s#^#  DocumentRoot "$4"#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '5s#^#  DirectoryIndex $5#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '6s#^#  AccessFileName .htaccess#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '7s#^#  ServerAlias $3 www.$3#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '8s#^#  ErrorLog "logs/$3.log"#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '9s#^#  ProxyPassMatch ^/(.*\\.php(/.*)?)$ fcgi://127.0.0.1:9000$4/$1#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '10s#^#          <Directory "$4">#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '11s#^#           <LimitExcept GET POST HEAD>#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '12s#^#            Deny from all#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '13s#^#            </LimitExcept>#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '14s#^#           Options -ExecCGI -Includes -Indexes#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '15s#^#            DirectoryIndex $5#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '16s#^#             AllowOverride All#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '17s#^#              Order allow,deny#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '18s#^#              Allow from All#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '19s#^#              </Directory>#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '20s#^#</VirtualHost>#' /usr/local/apache2/conf/extra/$1.conf

        sed -i 's#$2#'$2'#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '2s#$2#'$2'#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '3s#$3#'$3'#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '4s#$4#'$4'#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '5s#$5#'$5'#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '7s#$3#'$3'#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '8s#$3#'$3'#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '9s#$4#'$4'#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '10s#$4#'$4'#' /usr/local/apache2/conf/extra/$1.conf
        sed -i '15s#$5#'$5'#' /usr/local/apache2/conf/extra/$1.conf
}

        if [ "$#" == 5 ];then
                config_apache $1 $2 $3 $4 $5
        else
                echo "Please $0 input 5 variables : "
                echo "\$1 : Domain name config "
                echo "\$2 : Port "
                echo "\$3 : Domain name "
                echo "\$4 : Document root "
                echo "\$5 : index php "
        fi

