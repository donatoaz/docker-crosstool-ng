docker-crosstool-ng
===================

crosstool-NG Docker file

How to use?
-----------

**Toolchain data volume**

run

	$ docker run -it --name toolchain --volume /opt busybox:latest

exit container

	/ # exit

**Crosstool-NG environment**

run

	$ docker run -it --name crosstool-ng --volumes-from toolchain -v $(pwd)/samples:/home/crosstool-ng/samples walkerlee/crosstool-ng

build toolchains

	crosstool-ng@e3dfcf166dcd:~$ ./samples/build.sh