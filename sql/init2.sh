#!/bin/bash
set -xu -o pipefail

sudo rm -r /var/log/journal/*
sudo systemctl restart systemd-journald