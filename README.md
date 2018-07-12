# Docker for tiling

You can run this docker file by

``` shell
docker build . -t gdal-tiling
docker create --name gdal-tiling gdal-tiling
docker cp <tif file path> gdal-tiling:/home/gdal-tiling/target.tif
docker start -a gdal-tiling
docker cp gdal-tiling:/home/gdal-tiling/tiles .
docker stop gdal-tiling
```

However, these commands are complex enough, I also provided shellscripts for these commands.

``` shell
./build.sh
./run.sh <tif file path>
```

After you execute `./build.sh` first time, you don't need to execute it repeatedly. What you need is executing `./run.sh`.
