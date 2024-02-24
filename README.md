#### Playbook site-monitoring
Устанавливает на ОС CentOS8 сервисы Prometheus и Grafana, добавляет источник данных Prometheus (расположенный на этом же сервере) в Grafana и добавляет дашбоард 1860.  
Адрес сервера указывается в файле inventory/hosts в группе [monitoring].  
Запуск:
```
ansible-playbook --private-key PRIVATE_KEY_PATH -i inventory site-monitoring.yml
```

#### Playbook site-node-exporter
Устанавливает сервис node_exporter на хосты указанные в файле inventory/hosts в группе [target].  
Запуск:
```
ansible-playbook --private-key PRIVATE_KEY_PATH -i inventory site-node_exporter.yml
```
Конфигурационный файл prometheus.yml динамически изменяется от хостов прописанных в файле inventory/hosts в группе [target],  
для применения добавить хост в группу [target] и запустить playbook site-monitoring.

#### Скрипт add_annotation
Добавляет аннотацию на дашборд Grafana с текущим временем.  

Необходимо создать сервисную учётную запись Administration -> Users and access -> Service accounts -> Add service account , указать имя учётной записи и выбрать роль Editor .  
После чего сгенерировать и сохранить токен Add service account token.  
Также необходимо получить DASHBOARD_ID и PANEL_ID, для этого открыть дашбоард и раскрыть панель (нажать значок троеточее на панели и выбрать пункт view), в адресной строке браузера 
orgId будет означать DASHBOARD_ID, а viewPanel будет означать PANEL_ID.

Полученные данные, а также адрес сервера Grafana необходимо указать в скрипте add_annotation.sh , параметры TAG и TEXT указать по своему усмотрению.