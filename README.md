# dev-location

implements /dev/location, the iOS/iSH-app character device which both
gives location information and keeps an app running in the background
indefinitely, for a Linux desktop, using geoclue and CUSE.

## developer's notes
* <https://libfuse.github.io/doxygen/cuse_8c.html>
* `curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py`
  it's included in this repo for convenience (and safekeeping), but *not*
  under GPL2; `pip` is MIT-licensed
