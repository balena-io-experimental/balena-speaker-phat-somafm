# resin-speaker-phat-somafm

Example project using the [Pimoroni Speaker pHAT](https://shop.pimoroni.com/products/speaker-phat)
with a resin.io device, playing [SomaFM](http://somafm.com/) internet radio.

## Setup

* Set `RESIN_HOST_CONFIG_dtoverlay` to `hifiberry-dac` in the Fleet or Device Configuration
* When first flashing the SD card from resin.io, add these lines to the `resin-boot` partition's `config.txt`:
  * `dtoverlay=i2s-mmap`
  * `dtoverlay=hifiberry-dac`
* Set the channel from the playlists on the SomaFM by setting the `CHANNEL` environment variable (default is `groovesalad-128-aac`)
* Set the buffer time in seconds by setting the `BUFFER` environment variable (default is `300`)

## License

Copyright 2017 Resinio Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
