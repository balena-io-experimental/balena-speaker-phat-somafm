FROM resin/raspberrypi3-alpine:edge

WORKDIR /usr/src/app
ENV INITSYSTEM on

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache \
   py-pip \
   py-smbus@testing \
   wiringpi \
   alsa-utils

RUN wget https://github.com/pimoroni/speaker-phat/raw/master/test/test.wav

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY conf/asound.conf /etc/asound.conf
COPY *.py ./

CMD ["python", "demo.py"]
