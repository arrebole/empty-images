## docker空镜像, 构建最小服务
> 利用go的纯静态链接的能力，构建最小的镜像。

## only 5.39MB
```bash
docker images
# REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
# smaple              latest              6c3115e6f53e        9 seconds ago        5.39MB
```

## How to Use
```bash
git clone git clone https://github.com/arrebole/empty-images.git && cd empty-images
docker build -t smaple .
docker run -p 80:80 -d smaple 
```