# docker-ztj1993-alpine-php7-apache

alpine apache php7 镜像。

## 相关链接
- [GitHub](https://github.com/ztj-docker/alpine-php7-apache)
- [DockerHub](https://hub.docker.com/r/ztj1993/alpine-php7-apache)

## 使用教程
```
docker run -ti --rm ztj1993/alpine-php7-apache
```

## 更新日志

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
