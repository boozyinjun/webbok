#!/bin/bash

# Обновление списка пакетов
yum update -y

# Установка curl и wget
yum install -y curl wget

# Добавление репозитория Kubernetes и установка kubectl
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum install -y kubectl

# Установка Docker
yum install -y yum-utils device-mapper-persistent-data lvm2

# Добавление Docker репозитория
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Установка Docker
yum install -y docker-ce docker-ce-cli containerd.io

# Запуск и включение автозагрузки Docker сервиса
systemctl start docker
systemctl enable docker

# Сообщить о завершении установки
echo "Установка завершена успешно."