#!/bin/bash

date >> ./du_sh_hori.out
du -sh /home/hori >> ./du_sh_hori.out

du -sh ./* | sort -rh > du_sh_sorted.out
