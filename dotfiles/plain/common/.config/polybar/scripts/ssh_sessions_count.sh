#!/bin/bash

count=$(~/.local/bin/ssh_sessions | wc -l)

echo " ($count)"
