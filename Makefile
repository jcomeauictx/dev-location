# https://libfuse.github.io/doxygen/cuse_8c.html
# (obviously, use your own LOCATION)
LOCATION ?= 24.163419,-110.311692
default: umount seedlocation
/dev/cusedebug: cusexmp | .installed/libfuse3-dev
	sudo ./$< -d --name=$(@F)
/dev/location: cusexmp | .installed/libfuse3-dev
	sudo ./$< --name=$(@F)
seedlocation: /dev/location
	# seed a location to be spit out endlessly
	echo $(LOCATION) | sudo tee -a $<
	sudo chmod 644 $<
umount:
	sudo kill $$(pidof cusexmp)
%: %.c
	gcc -Wall $< $$(pkg-config fuse3 --cflags --libs) -o $@
.installed/%-dev: .installed
	sudo apt install $(@F)
	touch $@
.installed:
	mkdir -p $@
install: /etc/init.d/location
/etc/init.d/location: location | /etc/init.d
	sudo cp $< $@
	-sudo rc-update del $< default
	-sudo rc-update add $< default
	sudo rc-service $< restart
/etc/init.d:
	@echo this is intended for Alpine/iSH installations >&2
	false
.PRECIOUS: /etc/init.d/location
