#!/bin/bash
# Copyright (C) 2020 Jef Oliver.
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
# SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
# Authors:
# Jef Oliver <jef@eljef.me>

. ../common

check_root

pacman -Syu bash-completion \
            bash-language-server \
            bitwarden-bin \
            cronie \
            diff-so-fancy \
            fira-code-git \
            firefox \
            flake8 \
            gnu-free-fonts \
            google-chrome-dev \
            gstreamer-vaapi \
            gst-editing-services \
            gst-plugins-ugly \
            git \
            joplin \
            kde-applications-meta \
            make \
            nodejs \
            nodejs-markdownlint-cli \
            npm \
            nvim \
            nvm \
            openssh \
            phonon-qt5-gstreamer \
            plasma-meta \
            python-black \
            python-colorama \
            python-pylint \
            sddm-theme-archpaint2-breeze \
            shellcheck \
            sudo \
            tmux \
            ttf-dejavu \
            ttf-droid \
            ttf-google-fonts \
            ttf-liberation \
            vim \
            write-good \
            xcursor-gt3 \
            xorg-bdftopcf \
            xorg-font-util \
            xorg-fonts-100dpi \
            xorg-fonts-75dpi \
            xorg-fonts-encodings \
            xorg-iceauth \
            xorg-mkfontscale \
            xorg-server \
            xorg-server-common \
            xorg-sessreg \
            xorg-setxkbmap \
            xorg-smproxy \
            xorg-x11perf \
            xorg-xauth \
            xorg-xbacklight \
            xorg-xcmsdb \
            xorg-xcursorgen \
            xorg-xdpyinfo \
            xorg-xdriinfo \
            xorg-xev \
            xorg-xgamma \
            xorg-xhost \
            xorg-xinit \
            xorg-xinput \
            xorg-xkbcomp \
            xorg-xkbevd \
            xorg-xkbutils \
            xorg-xrandr \
            xorg-xrdb \
            xorg-xrefresh \
            xorg-xset \
            xorg-xsetroot \
            xorg-xvinfo \
            xorg-xwd \
            xorg-xwininfo \
            xorg-xwud \
            yakuake

