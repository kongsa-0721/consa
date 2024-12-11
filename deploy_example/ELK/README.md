### ELK 日志简要部署 版本 8.16.1

1. docker-compose up -d
2. 检测 elastic 有没有通过 logstash 拿到日志

```
curl -X GET 'http://elastic:R3!ff4pp!@localhost:9200/_cat/indices?v'
```

3. 创建用户分配给 kibana kibana 不能使用 elastic 默认用户

```
curl -u 'elastic:R3!ff4pp!' -X POST "http://localhost:9200/_security/user/kibana_admin" -H 'Content-Type: application/json' -d'
{
  "password" : "R3!ff4pp!",
  "roles" : [ "superuser", "kibana_system" ],
  "full_name" : "kibana_admin_full_name",
  "email" : "kibana_admin_full_name@example.com"
}
'

curl -u 'elastic:R3!ff4pp!' -X GET "http://localhost:9200/_security/user/kibana_admin"
```
