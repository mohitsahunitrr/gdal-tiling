if [ $# -lt 1 ]
then
    echo "This shell script requires one argument"
    exit 1
fi

if [ $# -gt 1 ]
then
    echo "This shell script requires only one argument"
    exit 1
fi

if ! [ -f $1 ]
then
    echo "Cannot find file \"$1\""
    exit
fi

docker cp $1 gdal-tiling:/home/gdal-tiling/target.tif
docker start gdal-tiling
docker exec gdal-tiling gdal2tiles.py --srcnodata=0,0,0 --webviewer=none --zoom=16-22 ./target.tif ./tiles
docker cp gdal-tiling:/home/gdal-tiling/tiles .
docker stop gdal-tiling
