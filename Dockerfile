FROM ubuntu:18.04

# Install basic things
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y build-essential

# Set an user for app
RUN useradd -m gdal-tiling

WORKDIR /home/gdal-tiling

# Install language
RUN apt install -y python python-pip python-gdal gdal-bin

ENTRYPOINT ["/bin/bash"]
