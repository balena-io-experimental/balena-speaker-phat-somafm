FROM resin/raspberrypi3-alpine:edge

WORKDIR /usr/src/app
ENV INITSYSTEM on

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache \
   build-base \
   autoconf \
   automake \
   libtool \
   wiringpi \
   git \
   alsa-utils \
   curl \
   gstreamer1-tools \
   gst-plugins-base1 \
   gst-plugins-good1 \
   gst-plugins-bad1

RUN git clone https://github.com/pimoroni/pivumeter && \
    cd pivumeter && \
    aclocal && libtoolize && \
    autoconf && automake --add-missing && \
    ./configure && make && make install

RUN curl https://github.com/pimoroni/speaker-phat/raw/master/test/test.wav > test.wav

#COPY requirements.txt ./
#RUN pip install -r requirements.txt

COPY conf/asound.conf /etc/asound.conf
#COPY *.py ./

#CMD ["python", "demo.py"]
CMD gst-launch-1.0 playbin uri=http://ice2.somafm.com/cliqhop-128-aac
