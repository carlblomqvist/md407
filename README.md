# MD407
A few scripts to get the MD407 Development Board used at CTH to work on Linux.

Download all files (or clone the repository) and run setupMD407.sh

You can either use cat to read the output from the MD407
```
cat /dev/ttyUSB0
```
or you can use [screen](https://www.gnu.org/software/screen/) and run
```
screen /dev/ttyUSB0 115200
```
115200 is the baudrate that needs to be used.

It is also possible to launch multiple picocom instances for monitoring and interaction with
```
md407 screen /dev/ttyUSB*
```
This option requires picocom to be installed and in path. The terminal emulator to use can be change with the `EMULATOR` variable in the md407 script (default alacritty).
