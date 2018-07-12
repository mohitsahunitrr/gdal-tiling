FROM ubuntu:18.04

# Install basic things
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y build-essential

# Set an user for app
RUN useradd -m gdal-tiling

WORKDIR /home/gdal-tiling

# # Install library
# RUN apt install -y libgdal-dev

# Install language
RUN apt install -y python python-pip python-gdal

CMD ["gdal2tiles.py", "--srcnodata=0,0,0", "--webviewer=none", "--zoom=16-22", "./target.tif", "./tiles"]
