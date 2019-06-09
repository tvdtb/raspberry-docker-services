#!/usr/bin/env bash

# Bash strict mode
set -e

# Remove old pid if it exists
[ -f /var/run/minidlna/minidlna.pid ] && rm -f /var/run/minidlna/minidlna.pid

minidlnad -S -f /etc/minidlna.conf
