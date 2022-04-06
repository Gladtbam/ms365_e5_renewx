# 前言
本Docker基于[SundayRX](https://blog.csdn.net/qq_33212020?type=blog) [E5 Renew X](https://blog.csdn.net/qq_33212020/article/details/119747634)

## 支持版本

| CPU架构 | 是否支持 |
| :------:  | :------: |
| Linux/amd64 v3 | 是 |
| Linux/amd64 v2 | 是 |
| Linux/amd64 | 是 |
| Linux/arm64 | 是 |
| Linux/arm v7 | 是 |

## 部署

拉取镜像  
`docker push gladtbam/ms365_e5_renewx:latest`  
或者  
`docker pull ghcr.io/gladtbam/ms365_e5_renewx:latest`

### 使用默认配置部署

```
docker run -d \
    -p 1066:1066 \
    --name RnewX \
gladtbam/ms365_e5_renewx:latest
```

### 自定义配置

1. 下载[E5 Renew X](https://sundayrx.lanzoui.com/aW09Lsss75g) 的配置文件`Config.xml`，按照Config.xml文件说明进行修改

2. 启动容器  
```
docker run -d \
    -p 1066:1066 \
    -v $PWD/Deploy:/renewx/Deploy \
    -v $PWD/appdata:/renewx/appdata \
    --name RnewX \
gladtbam/ms365_e5_renewx:latest
```

**Deploy内放置Config.xml文件**  

## 自行构建

[Github下载Dockerfile](https://github.com/Gladtbam/ms365_e5_renewx_docker)文件  

```bash
docker build -f Dockerfile -t ms365_e5_renewx . --no-cache
```

## Nginx反向代理

```
location ~ / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_pass https://127.0.0.1:1066;
}
```

## 链接

[Microsoft 365 E5 Renew X Docker 部署](https://www.gladtbam.top/posts/22256/)

[Microsoft 365 E5 Renew X 部署记录](https://www.gladtbam.top/posts/37680/)

[SundayRX博客](https://blog.csdn.net/qq_33212020/article/details/119747634)

[Docker Hub](https://hub.docker.com/repository/docker/gladtbam/ms365_e5_renewx)
