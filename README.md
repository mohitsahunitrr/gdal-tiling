# Docker for tiling

You can run this docker file by

``` shell
docker build . -t gdal-tiling
docker create --name gdal-tiling gdal-tiling
docker cp <tif file path> gdal-tiling:/home/gdal-tiling/target.tif
docker start gdal-tiling
docker exec gdal-tiling gdal2tiles.py --srcnodata=0,0,0 --webviewer=none --zoom=16-22 ./target.tif ./tiles
docker cp gdal-tiling:/home/gdal-tiling/tiles .
docker stop gdal-tiling
```

However, these commands are complex enough, I also provided shellscripts for these commands.

``` shell
./build.sh
./run.sh <tif file path>
```

After you execute `./build.sh` first time, you don't need to execute it repeatedly. What you need is executing `./run.sh`. You can also delete container with `./remove.sh`, and run interactive shell by `./interactive.sh`
