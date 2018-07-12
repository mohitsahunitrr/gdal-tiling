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
docker start -a gdal-tiling
docker cp gdal-tiling:/home/gdal-tiling/tiles .
docker stop gdal-tiling
