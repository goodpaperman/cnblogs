#! /bin/sh
awk -F'[ -]+' -f find_slowest_month.awk ./score.txt
