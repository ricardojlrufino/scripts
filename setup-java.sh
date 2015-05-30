#!/bin/bash
DFILE=`find -name "*arm*.tar.gz"`
echo "Found: " $DFILE


if [ -z "$DFILE" ]; then
   echo "ERROR: Please download JRE/JDK and put in current directory"
   exit 1
fi

if grep -Fq "JAVA_HOME" ~/.profile
then
    echo "ERROR: already found another installed version on ~/.profile, remove first"
    exit 1
fi


mkdir /opt/java
tar -zxvf $DFILE -C /opt/java
JAVA_HOME=`ls -d  /opt/java/*`
echo "Installed on: " $JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME=$JAVA_HOME

# Install on Profile
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.profile
echo "export PATH=\$PATH:$JAVA_HOME/bin/" >> ~/.profile

echo "Finished ! Logout or run those commands:"
echo "=========================================="
echo "export JAVA_HOME=$JAVA_HOME"
echo "export PATH=\$PATH:$JAVA_HOME/bin/"


