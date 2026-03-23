# https://libfuse.github.io/doxygen/cuse_8c.html
/dev/location: cuse .installed/libfuse3-dev
	sudo ./cuse -f --name=$(@F)
umount:
	kill $(pidof cuse)
cuse: cuse.c
	gcc -Wall $< $$(pkg-config fuse3 --cflags --libs) -o cuse
.installed/%-dev: .installed
	sudo apt install $(@F)
.installed:
	mkdir -p $@
