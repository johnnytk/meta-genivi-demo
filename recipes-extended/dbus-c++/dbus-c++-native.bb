require dbus-c++.inc
inherit native

DEPENDS = "glib-2.0-native dbus-native expat-native"
SRC_URI = "git://git.baserock.org/git/delta/dbus-c++.git;protocol=http"
