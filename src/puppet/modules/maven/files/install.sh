#!/bin/sh

DOWNLOAD_URL="http://ftp.fau.de/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz"
FILE="apache-maven-3.0.5-bin.tar.gz"
EXTRACTED_DIR="/tmp/apache-maven-3.0.5"
INSTALL_DIR="/usr/local/share/applications/apache-maven"

# Skip if already installed
mvn -version && exit 0

# download
cd /tmp
rm -rf ${FILE}
wget ${DOWNLOAD_URL}

# extract
tar xvf ${FILE}

# install
mv ${EXTRACTED_DIR} ${INSTALL_DIR}

# bashrc
echo "# Maven" >> /home/vagrant/.bashrc
echo "export M2_HOME=${INSTALL_DIR}" >> /home/vagrant/.bashrc
echo "export M2=\$M2_HOME/bin" >> /home/vagrant/.bashrc
echo "export PATH=\$M2:\$PATH" >> /home/vagrant/.bashrc