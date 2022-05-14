#!/usr/bin/env bash
#
# restart Bluetooth and Pipewire Media services on bootbox
#
# Copyright (C) 2022 William J Smyth <
#
# used to correct issues with my Bose NC700 headphones not
# having all audio profiles available once connected via Bluetooth
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

systemctl --user restart pipewire-media-session.service
systemctl restart bluetooth.service

# that's the gist of it but here are some TODOs that
# I've not yet implemented
#TODO: find specific verification checks to be run before and after
#TODO: can you restart pipewire-media-session.service since it's a user service?
#TODO: can you restart Bluetooth.service since it's a system service?
#TODO: should this be two different scripts that may depend on callings of each other?
#TODO: should this be a systemd service or a logon script?
