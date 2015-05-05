FROM ipython/scipyserver

MAINTAINER Tom Rafferty <traff.td@gmail.com>

########################################
#
# Image based on ipython/scipyserver
#
#   added OpenCV 3 (built)
#   plus prerequisites...
#######################################

# Install opencv prerequisites...
RUN apt-get update -qq && apt-get install -y --force-yes \
    curl \
    git \
    g++ \
    autoconf \
    automake \
    build-essential \
    checkinstall \
    cmake \
    pkg-config \
    yasm \
    libtiff4-dev \
    libpng-dev \
    libjpeg-dev \
    libjasper-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libdc1394-22-dev \
    libxine-dev \
    libgstreamer0.10-dev \
    libgstreamer-plugins-base0.10-dev \
    libv4l-dev \
    libtbb-dev \
    libgtk2.0-dev \
    libmp3lame-dev \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libtheora-dev \
    libvorbis-dev \
    libxvidcore-dev \
    libtool \
    v4l-utils \
    default-jdk \
    wget \
    unzip; \
    apt-get clean

# Build OpenCV 3.x
# =================================
WORKDIR /usr/local/src
RUN git clone https://github.com/Itseez/opencv.git
RUN mkdir -p opencv/release
WORKDIR /usr/local/src/opencv/release
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
          -D CMAKE_INSTALL_PREFIX=/usr/local \
          -D WITH_TBB=ON \
          -D BUILD_PYTHON_SUPPORT=ON \
          -D WITH_V4L=ON \
          -D INSTALL_C_EXAMPLES=ON \
          -D INSTALL_PYTHON_EXAMPLES=ON \
          -D BUILD_EXAMPLES=ON \
          ..
RUN make -j4
RUN make install
RUN sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
RUN ldconfig
# =================================

# Remove all tmpfile
# =================================
WORKDIR /usr/local/
RUN rm -rf /usr/local/src
# =================================

WORKDIR /notebooks


