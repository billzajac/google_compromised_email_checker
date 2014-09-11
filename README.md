Super simple google compromized email checker
==============================================

This is a lua script with minimal validation and a form served directly from nginx to grep the google file for your email

Get the data
--------------------

    wget http://rghost.net/download/57937836/35f838fa3fb1639873e65fbe6b7487164772e031/google_5000000.txt.zip
    unzip google_5000000.txt.zip
    mv google_5000000.txt conf

Install openresty
--------------------

* http://openresty.org/

<!-- required for code block after a list in markdown -->

    sudo apt-get install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make

    curl -o ngx_openresty.tgz http://openresty.org/download/ngx_openresty-1.7.2.1.tar.gz
    tar zxf ngx_openresty.tgz
    cd ngx_openresty*
    ./configure
    make
    sudo make install


