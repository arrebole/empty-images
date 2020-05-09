## docker空镜像, 构建最小服务
> 利用go的纯静态链接的能力，构建最小的镜像。

```bash
docker build -t smaple .
docker run -p 80:80 -d smaple 
```