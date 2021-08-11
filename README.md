# docker-ztj1993-website-php7

alpine apache php7 镜像。

## 相关链接
- [GitHub](https://github.com/ztj1993/docker-website-php7)
- [DockerHub](https://hub.docker.com/r/ztj1993/website-php7)

## 使用教程
```
docker run -ti --rm ztj1993/website-php7:latest
```

## 更新日志

> 2021-08-11

- FROM alpine:3.11
- 移除 entrypoint 入口
- 年度更新

> 2020-09-10

- 将项目更新为 website-php7
- 优化项目

> 2020-08-21

- 增加了 /entrypoint.sh 入口脚本
- 增加了 /srv/start.sh 启动脚本
- 增加了 /srv/bin/start.sh 启动脚本
- 增加了 docker-compose.yml

> 2020-03-22

- 重新处理的仓库和文档
- 对镜像进行了优化

> 2020-01-21

- 动态处理了一些参数
- 暴露 443 端口

> 2019-08-22

- 初始构建
