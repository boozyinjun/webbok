export JAVA_VER=17.0.1
export JAVA_DISTR=openjdk-${JAVA_VER}_linux-x64_bin.tar.gz
export JAVA_INSTALL_LOCATION=/opt
export VM_USER=vagrant

wget https://download.java.net/java/GA/jdk17.0.1/2a2082e5a09d4267845be086888add4f/12/GPL/$JAVA_DISTR
tar -xvf $JAVA_DISTR
mv jdk-$JAVA_VER /opt/

cat <<EOF >> /home/$VM_USER/.profile
JAVA_HOME='$JAVA_INSTALL_LOCATION/jdk-$JAVA_VER'
PATH="\$JAVA_HOME/bin:\$PATH"
export PATH
EOF