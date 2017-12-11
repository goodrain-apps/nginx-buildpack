# Buildpack for nginx based on debian:stretch-slim

## 说明

这个buildpack基于debian:stretch-slim镜像构建。采用软件与系统分离的形式进行编译，并最终将按照的软件打包保存。


## 制作程序包

- 先构建buildpack镜像

```bash
docker build -t nginx-buildpack:1.12.2 .
```

- 运行容器，编译并压缩nginx包

```bash
docker run -it -v $PWD/package:/opt/package nginx-buildpack:1.12.2
```

如果编译没有报错，会在当前package目录下生成 `nginx-1.12.2.tar.gz` 的压缩包。

## 程序包的使用

使用基础镜像，直接下载解压到根目录即可

```bash
curl -sk https://pkg.goodrain.com/nginx/nginx-1.12.2-debian-stretch.tar.gz | tar xz -C /
```
