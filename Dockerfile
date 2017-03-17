FROM resin/raspberrypi3-debian

WORKDIR /usr/src/app
ENV INITSYSTEM on

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
      build-essential autoconf automake libtool libasound2-dev libfftw3-dev wiringpi \
      git alsa-utils \
      gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad

# Install pivumeter
RUN git clone https://github.com/pimoroni/pivumeter && \
    cd pivumeter && \
    aclocal && libtoolize && \
    autoconf && automake --add-missing && \
    ./configure && make && make install

# A test sound
RUN curl https://github.com/pimoroni/speaker-phat/raw/master/test/test.wav > test.wav

COPY conf/asound.conf /etc/asound.conf

#CMD ["python", "demo.py"]
#CMD gst-launch-1.0 playbin uri=http://ice2.somafm.com/cliqhop-128-aac
CMD while : ; do speaker-test -l1 -c2 -t wav; sleep 5;
