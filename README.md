 # Описание Веб-приложения WebBooks 📚
 ## Устройство репозитория!!!!!!!!
 
  - [apps] - Исходный код приложения.
  - [bash_scripts] - Необходимы используемые скрипты
  - [cicd] - Описанный процесс CI/CD конвейера
  - [monitoring_logging] - Средства Мониторинга/Логирования
  - [webbok-chart] - Написан Helm чарт для публикации приложения
  - [IaC] - Конфигурация всех необходимых ресурсов согласно IaC

 ## Развёртывание инфраструктуры
  Были подняты две VM в Yandex Cloud на базе Centos7
 - Centos7 (2 vm)
 - VM1 - Jenkins
 - VM2 - Kind Kubernetes 

 ## Развёртывание приложения
 Организован CI/CD конвейер:
 Используемые технологии:
 - GitHub
 - Jenkins - multibranch pipeline (plugin: Docker Hub, Docker Pipeline, GitHub Integration Plugin, Kubernetes CLI Plugin, Maven Integration plugin, Oracle Java SE, Blue Ocean)
 - Docker Hub - хранение артефактов сборки
 - Kind Kubernetes 
 - Telegram - Alerting
 
 
 ## О релизном цикле приложения и правилах версионирования

 - Используется версионирование, артефакты хранятся в DockerHub
  
 

