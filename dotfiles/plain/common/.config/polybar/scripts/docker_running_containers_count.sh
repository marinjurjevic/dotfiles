#!/bin/bash

count=$(docker ps -q | wc -l)

echo " ($count)"
