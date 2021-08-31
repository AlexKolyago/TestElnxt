#!/bin/bash

find $1/ -depth -type f -printf "%f\n" -print -exec du -h --time {} + > result.txt
