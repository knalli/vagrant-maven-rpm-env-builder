#!/bin/sh

DOWNLOAD_URL="http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.rpm"
FILE="jdk-7u51-linux-x64.rpm"

# Skip if already installed
java -version && exit 0

# Download
cd /tmp
rm -rf $FILE
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "$DOWNLOAD_URL"

# Install
sudo yum install -y $FILE