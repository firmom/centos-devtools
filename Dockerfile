FROM consol/centos-xfce-vnc:1.1.0
MAINTAINER Sebastian Pożoga <sebastian@pozoga.eu>

# ENVS
ENV GOROOT="/usr/local/go"
ENV GOPATH="$HOME/go"
ENV PATH="${PATH}:$GOROOT/bin:$GOPATH/bin"

## switch to admin
USER 0

## add repositories
RUN \
  wget -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
  wget -q http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
  rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm && \
  wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm && \
  yum -y localinstall mysql57-community-release-el7-9.noarch.rpm && \
  yum -y update

# config pakages
RUN \
  yum -y install yum-utils && \
  yum-config-manager --enable remi-php71

# install packages
RUN \
  yum -y groupinstall "Development Tools" && \
  yum -y install libcurl && \
  yum -y install git && \
  yum -y install php php-opcache php-cli php-mysql php-dev libapache2-mod-php php-mcrypt php-curl php-sqlite3 php-pear php-imagick php-xdebug && \
  yum -y install gcc gcc-c++ g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel && \
  yum -y install ruby-rdoc ruby-devel && \
  yum -y install httpd && \
  yum -y install mysql-client mysql-server && \
  yum -y install vim iputils && \
  yum -y install vim ansible && \
  yum -y --enablerepo=epel install curlftpfs fuse-sshfs samba-client samba-common cifs-utils

# install visual studio code
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
RUN \
  yum -y install code
#  yum check-update -y && \

# install docker
RUN yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager -y --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum-config-manager -y --enable docker-ce-edge
RUN yum install -y docker-ce
RUN \
  sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose

# python & pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py && \
  rm get-pip.py
RUN pip install netaddr Jinja2

# php framworks
RUN \
  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer && \
  curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
  chmod a+x /usr/local/bin/symfony

# nodejs install
RUN \
  git clone https://github.com/nodejs/node.git && \
  cd node && \
  git checkout v8.3.0 && \
  ./configure && make && sudo make install

# nodejs packages and upgread
RUN \
  npm install -g n && \
  npm install -g gulp && \
  npm install -g jshint && \
  npm install -g bower && \
  npm install -g yarn

# sass install
RUN gem install sass

# golang
RUN \
  wget https://storage.googleapis.com/golang/go1.10.3.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz

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

# golang - popular tools
RUN \
  go get -u github.com/goatcms/goatcli && \
  go get -u github.com/golang/dep/cmd/dep

# golang- dependency manager
RUN \
  go get -u golang.org/x/vgo

# golang - atom packages
RUN \
  go get -u golang.org/x/tools/cmd/goimports && \
  go get -u golang.org/x/tools/cmd/gorename && \
  go get -u github.com/sqs/goreturns && \
  go get -u github.com/nsf/gocode && \
  go get -u github.com/alecthomas/gometalinter && \
  go get -u github.com/zmb3/gogetdoc && \
  go get -u github.com/rogpeppe/godef && \
  go get -u golang.org/x/tools/cmd/guru && \
  go get -u golang.org/x/tools/cmd/goimports && \
  go get -u golang.org/x/tools/cmd/gorename && \
  go get -u github.com/sqs/goreturns && \
  go get -u github.com/nsf/gocode && \
  go get -u github.com/zmb3/gogetdoc && \
  go get -u github.com/zmb3/goaddimport && \
  go get -u github.com/rogpeppe/godef && \
  go get -u golang.org/x/tools/cmd/guru && \
  go get -u github.com/fatih/gomodifytags && \
  go get -u github.com/tpng/gopkgs

# atom install
RUN \
  wget https://github.com/atom/atom/releases/download/v1.30.0/atom.x86_64.rpm && \
  yum -y localinstall atom.x86_64.rpm

# atom plugins
RUN \
  apm install file-icons && \
  apm install pigments && \
  apm install emmet && \
  apm install color-picker && \
  apm install atom-beautify && \
  apm install go-debug && \
  apm install go-plus && \
  apm install language-docker && \
  apm install git-plus && \
  apm install atom-autocomplete-php && \
  apm install linter && \
  apm install minimap && \
  apm install wordpress-api && \
  apm install autocomplete-php && \
  apm install aligner-php && \
  apm install git-time-machine && \
  apm install php-getters-setters

# load configs
ADD image /root/image
RUN \
  find /root/image -type f -regextype posix-extended -iregex '^.*\/((\.[A-Za-z0-9_\-\.]+)|([A-Za-z0-9_\-])|([A-Za-z0-9_\-]+[A-Za-z0-9_\-\.]\.(js|html|po|css|sh|conf|md|txt|json|py)))$' -exec sed -i -e 's/\r//' {} \; && \
  cp -r /root/image/* / && \
  rm -rf /root/image

# prepare new entrypoint
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR
