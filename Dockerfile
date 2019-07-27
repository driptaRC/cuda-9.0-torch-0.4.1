
FROM ucrdocker/cuda-9.0-base
FROM ucrdocker/cuda-9.0-base

RUN # Update list of available packages, then upgrade them
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

RUN # Pytorch
RUN apt-get install -y python 3.6.1
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN # pip install --no-cache-dir https://download.pytorch.org/whl/cu100/torch-1.1.0-cp27-cp27mu-linux_x86_64.whl
RUN # pip install --no-cache-dir torchvision
RUN pip3 install --no-cache-dir torch==0.4.1 -f https://download.pytorch.org/whl/cu90/stable
RUN pip3 install --no-cache-dir torchvision==0.2.1
RUN pip3 install --no-cache-dir matplotlib
RUN pip3 install --no-cache-dir tensorboard_logger==0.0.4
RUN pip3 install --no-cache-dir tqdm


RUN # OpenCV dependencies
RUN # ===================
RUN # Developer tools
RUN apt-get install -y build-essential cmake unzip pkg-config
RUN # Image files
RUN apt-get install -y libjpeg-dev libpng-dev libtiff-dev
RUN # Video
RUN apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
RUN apt-get install -y libxvidcore-dev libx264-dev
RUN # GTK for GUI
RUN apt-get install -y libgtk-3-dev
RUN # Optimization
RUN apt-get install -y libatlas-base-dev gfortran
RUN # Python dev tools
RUN apt-get install -y python3-dev
RUN pip3 install opencv-python

RUN # Clean up
RUN apt-get -y autoremove
RUN rm -rvf /var/lib/apt/lists/*
CMD exec /bin/bash "$@"
