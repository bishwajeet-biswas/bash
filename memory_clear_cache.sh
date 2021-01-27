# !/bin/bash
# This script is used to clear cache memory 
sync; echo 3 > /proc/sys/vm/drop_caches
