# Установка Kubernetes Dashboard
Устанавливайте Kubernetes Dashboard в вашем KIND кластере, выполнив следующую команду:

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
```
Затем выполните команду:
```sh
kubectl apply -f dashboard-admin.yaml
```

Получение токена доступа

```sh
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
```
Запуск Kubernetes Dashboard
Делаем проброс портов
```sh
sudo iptables -t nat -A PREROUTING -p tcp --dport 31111 -j DNAT --to-destination 172.18.0.3:31111
```

