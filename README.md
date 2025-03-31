# AGL Quiz Flutter Application

This flutter application displays my name, shows my picture when a button is clicked, and integrates the Gemini Chat API. The Flutter app is hosted on GitHub and integrated into an AGL image using Yocto recipes.

## Overview

```
# Initialize the AGL repository using the salmon branch
repo init -b salmon -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo
repo sync

# Setup the AGL environment for qemux86-64 with flutter support
source meta-agl/scripts/aglsetup.sh -f -m qemux86-64 -b qemux86-64 agl-flutter agl-devel
bitbake agl-image-flutter

# Add the custom BitBake layer for the Flutter app and build it
bitbake-layers add-layer meta-agl-quiz
source agl-init-build-env
bitbake agl-quiz
bitbake agl-image-flutter

# Run the image using QEMU (qemux86-64)
runqemu kvm serialstdio slirp publicvnc

# Install VNC viewer and connect to the image
sudo apt install tigervnc-viewer
vncviewer localhost:0
```

## Yocto bitbake recipe file

```
PN = "agl_quiz"
SUMMARY = "Flutter AGL Quiz Application"
DESCRIPTION = "A Flutter based IVI Application that displays my name and shows an image on button click"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=2e7f3427ab08fda49476f7eec09fe84c"

SRC_URI = "git://github.com/daminrido139/agl-quiz.git;branch=main;protocol=https \
           file://agl-app-flutter@agl_quiz.service \
           file://agl_quiz.toml \
           "

SRCREV = "36b40b12282f598cf54a6d69febeee8e2da2bcf0"
S = "${WORKDIR}/git"

inherit flutter-app

# flutter-app parameters
PUBSPEC_APPNAME = "agl_quiz"
PUBSPEC_IGNORE_LOCKFILE = "1"
FLUTTER_BUILD_ARGS = "bundle -v"

do_install:append() {
    install -D -m 0644 ${WORKDIR}/agl-app-flutter@agl_quiz.service ${D}${systemd_system_unitdir}/agl-app-flutter@agl_quiz.service
}

do_compile[network] = "1"
```

## Systemd Service File
```
[Unit]
Description=agl_quiz

[Service]
Type=simple
User=agl-driver
EnvironmentFile=/etc/default/flutter
Environment=XDG_RUNTIME_DIR=/run/user/1001/
ExecStart=/usr/bin/flutter-auto -b /usr/share/flutter/agl_quiz/${FLUTTER_VERSION}/${FLUTTER_RUNTIME} --xdg-shell-app-id agl_quiz
Restart=always

[Install]
WantedBy=multi-user.target
```

## Application Window Configuration
```
[view]
window_type = "BG"
width = 1080
height = 1920
fullscreen = true

[window_activation_area]
x = 0
y = 56
width = 1080
height = 1712
```

This app was created as part of AGL GSoC 2025 quiz.
# Thank You :)
