#!/bin/bash
# This file documents the necessary steps to make a clean build of judoshiai
# from the sources.
ninja reconfigure
ninja
DESTDIR="$PWD/install" ninja install
