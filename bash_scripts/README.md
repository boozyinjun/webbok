# Описание скриптов для настройки среды
Устанавливает Kind Kubernetes делает конфигурирование.

```sh
./ create_kind.sh
```
Установка необходимых пакетов
```sh
./ install-tools.sh
```
- curl 
- wget
- kubectl
- Docker

Файлы clusterrolebinding.yaml и cluster-role.yaml используются в Kubernetes для определения политики доступа и назначения ролей (roles) и связывания ролей с пользовательскими или сервисными аккаунтами внутри кластера.
```sh
kubectl apply -f clusterrolebinding.yaml
kubectl apply -f cluster-role.yaml
```
