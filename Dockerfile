FROM consol/centos-xfce-vnc:1.1.0
MAINTAINER Sebastian Pożoga <sebastian@pozoga.eu>

# ENVS
ENV GOROOT="/usr/local/go"
ENV GOPATH="/root/go"
ENV PATH="${PATH}:$GOROOT/bin:$GOPATH/bin"

## switch to admin
USER 0

## install scripts
RUN \
  yum -y install epel-release && \
  wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm && \
  rpm -ivh mysql57-community-release-el7-9.noarch.rpm && \
  yum -y update && \
  yum -y groupinstall "Development Tools" && \
  yum -y install libcurl && \
  yum -y install git wget && \
  yum -y install gcc gcc-c++ g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel && \
  yum -y install nodejs npm --enablerepo=epel && \
  yum -y install ruby-rdoc ruby-devel && \
  yum -y install httpd && \
  yum -y install php php-cli php-mysql php-dev libapache2-mod-php php-mcrypt php-curl php-sqlite3 php-pear php-imagick php-xdebug && \
  yum -y install mysql-client mysql-server && \
  yum -y install vim iputils && \
  yum -y --enablerepo=epel install curlftpfs fuse-sshfs samba-client samba-common cifs-utils

# atom install
RUN \
  wget https://github.com/atom/atom/releases/download/v1.19.0/atom.x86_64.rpm && \
  yum -y localinstall atom.x86_64.rpm

# golang
RUN \
  wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go1.8.linux-amd64.tar.gz

# golang - popular packages
RUN \
  go get github.com/gorilla/mux && \
  go get github.com/jmoiron/sqlx && \
  go get github.com/goatcms/goatcore && \
  go get github.com/mattn/go-sqlite3 && \
  go install github.com/mattn/go-sqlite3 && \
  go get github.com/lib/pq && \
  go install github.com/lib/pq && \
  go get golang.org/x/crypto/bcrypt && \
  go get github.com/buger/jsonparser

# golang - atom packages
RUN \
  go get -u golang.org/x/tools/cmd/goimports && \
  go get -u golang.org/x/tools/cmd/gorename && \
  go get -u github.com/sqs/goreturns && \
  go get -u github.com/nsf/gocode && \
  go get -u github.com/alecthomas/gometalinter && \
  go get -u github.com/zmb3/gogetdoc && \
  go get -u github.com/rogpeppe/godef && \
  go get -u golang.org/x/tools/cmd/guru

# atom plugins
RUN \
  apm install file-icons && \
  apm install go-debug && \
  apm install go-plus && \
  apm install language-docker && \
  apm install atom-beautify && \
  apm install git-plus

# nodejs packages and upgread
RUN \
  npm install -g n && \
  n stable && \
  npm install -g gulp && \
  npm install -g jshint && \
  npm install -g bower && \
  npm install -g yarn

# sass install
RUN gem install sass

# php - composer
RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# load configs
ADD image /root/image
RUN \
  find /root/image -type f -regextype posix-extended -iregex '^.*\/((\.[A-Za-z0-9_\-\.]+)|([A-Za-z0-9_\-])|([A-Za-z0-9_\-]+[A-Za-z0-9_\-\.]\.(js|html|po|css|sh|conf|md|txt|json|py)))$' -exec sed -i -e 's/\r//' {} \; && \
  cp -r /root/image/* / && \
  rm -rf /root/image

## switch back to default user
USER 1984
