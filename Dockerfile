FROM resin/raspberrypi3-debian

WORKDIR /usr/src/app
ENV INITSYSTEM on

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
      build-essential autoconf automake libtool libasound2-dev libfftw3-dev wiringpi \
      git alsa-utils \
      gstreamer1.0-tools gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad

# Install pivumeter
RUN git clone https://github.com/pimoroni/pivumeter && \
    cd pivumeter && \
    aclocal && libtoolize && \
    autoconf && automake --add-missing && \
    ./configure && make && make install

# Set up ALSA config for Speaker pHAT including pivumeter
COPY conf/asound.conf /etc/asound.conf

# Start script
COPY start.sh ./

# Start stream!
CMD ["bash", "start.sh"]
