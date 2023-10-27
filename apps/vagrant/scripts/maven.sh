export MAVEN_VER=apache-maven-3.2.5
export MAVEN_DISTR=${MAVEN_VER}-bin.tar.gz
export MAVEN_INSTALL_LOCATION=/opt
export VM_USER=vagrant

wget https://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/$MAVEN_DISTR
tar -xvf $MAVEN_DISTR
mv $MAVEN_VER /opt/

cat <<EOF >> /home/$VM_USER/.profile
M2_HOME='$MAVEN_INSTALL_LOCATION/$MAVEN_VER'
PATH="\$M2_HOME/bin:\$PATH"
export PATH
EOF