# dev-location

implements a fake /dev/location, the iOS/iSH-app character device which both
gives location information and keeps an app running in the background
indefinitely, for a Linux desktop, using CUSE. I was intending to leverage
geoclue for getting an actual location, but it's currently (2026-03) fairly
useless, due to Mozilla Location Services having been shut down as of 2024.

this fixed-location mockup only requires you to change LOCATION in the
Makefile, and `make` from an account with sudo access.

## developer's notes
* <https://libfuse.github.io/doxygen/cuse_8c.html>
* `curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py`
  it's included in this repo for convenience (and safekeeping), but *not*
  under GPL2; `pip` is MIT-licensed
