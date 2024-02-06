# MS365 E5 RenewX Docker

<!--toc:start-->
- [MS365 E5 RenewX Docker](#ms365-e5-renewx-docker)
  - [前言](#前言)
  - [链接](#链接)
  - [支持版本](#支持版本)
  - [部署](#部署)
    - [使用默认配置部署](#使用默认配置部署)
    - [自定义配置](#自定义配置)
    - [DockerCompose **推荐**](#dockercompose-推荐)
  - [自行构建](#自行构建)
  - [Nginx反向代理](#nginx反向代理)
<!--toc:end-->

## 前言

本Docker基于[SundayRX](https://blog.csdn.net/qq_33212020?type=blog) [E5 Renew X](https://blog.csdn.net/qq_33212020/article/details/119747634)

详细使用文档，请查看[WiKi](https://github.com/Gladtbam/ms365_e5_renewx/wiki)

## 链接

[Microsoft 365 E5 Renew X Docker 部署](https://www.gladtbam.top/posts/22256/)

[Microsoft 365 E5 Renew X 部署记录](https://www.gladtbam.top/posts/37680/)

[SundayRX博客](https://blog.csdn.net/qq_33212020/article/details/119747634)

[Docker Hub](https://hub.docker.com/r/gladtbam/ms365_e5_renewx)

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
`docker pull zilanlann/ms365_e5_renewx:latest`  

### 使用默认配置部署

```sh
docker run -d \
    -p 1066:1066 \
    --name RenewX \
    -e LoginPassword=<your password> \
gladtbam/ms365_e5_renewx:latest
```

> `<your password>` 替换成你自己想要的密码

### 自定义配置

1. 下载本仓库中 renewx/Deploy 这个文件夹中的 Config.xml

2. 启动容器  

```sh
docker run -d \
    -p 1066:1066 \
    -v $PWD/Deploy:/renewx/Deploy \
    -v $PWD/appdata:/renewx/appdata \
    --name RenewX \
gladtbam/ms365_e5_renewx:latest
```

> 注：Deploy内放置Config.xml文件

### DockerCompose **推荐**

1. 下载 docker-compose.yaml

    ```sh
    wget https://raw.githubusercontent.com/zilanlann/ms365_e5_renewx/main/docker-compose.yaml
    ```

2. 修改 docker-compose.yaml，自行决定采用命名卷还是路径绑定方式挂载数据

    > 建议采用命名卷方式，假如采用此方式，不需要修改docker-compose.yaml，直接up即可

3. 启动

    ```sh
    docker-compose up -d
    ```

## 自行构建

`clone` 本仓库，并 `cd` 到仓库目录

```sh
git clone https://github.com/Zilanlann/ms365_e5_renewx.git ~/ms365_e5 && cd ~/ms365_e5
```

```bash
docker build -t ms365_e5_renewx . --no-cache
```

## Nginx反向代理

```conf
location ~ / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_pass https://127.0.0.1:1066;
}
```
