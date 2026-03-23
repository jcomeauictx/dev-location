# https://libfuse.github.io/doxygen/cuse_8c.html
default: seedlocation
/dev/cusedebug: cusexmp | .installed/libfuse3-dev
	sudo ./$< -d --name=$(@F)
/dev/location: cusexmp | .installed/libfuse3-dev
	sudo ./$< --name=$(@F)
seedlocation: /dev/location
	# seed a location to be spit out endlessly
	echo 24.163419,-110.311692 | sudo tee -a $<
umount:
	sudo kill $$(pidof cusexmp)
%: %.c
	gcc -Wall $< $$(pkg-config fuse3 --cflags --libs) -o $@
.installed/%-dev: .installed
	sudo apt install $(@F)
	touch $@
.installed:
	mkdir -p $@
