### ELK 日志简要部署 版本 8.16.1

1. 启动/停止
```
docker compose -f ./docker-compose.yaml -p elk up -d
docker compose -f ./docker-compose.yaml -p elk down
```

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

4. kibana添加运行时字段
```
eg: 某个字段duration 一个位置存储的是 "100" / "100ms" 需要格式化成 100
不需要改动logstash的pipeline
在Stack Management => 数据视图 => ask-bi => 添加字段 设置值
if (doc.containsKey('duration.keyword') && doc['duration.keyword'].size() > 0) {
    String durationStr = doc['duration.keyword'].value;
    if (durationStr.endsWith('ms')) {
        emit(Integer.parseInt(durationStr.substring(0, durationStr.length() - 2))); // 去掉 'ms'
    } else {
        emit(Integer.parseInt(durationStr)); // 直接转换
    }
} else {
    emit(0); // 默认值
}

```
