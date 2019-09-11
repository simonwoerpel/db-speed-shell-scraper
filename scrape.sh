#!/bin/sh

# simple bash script to scrape the speed (and some meta information)
# of german ICE trains using the API from the internal wifi portal
#
# requirements (should come with all UNIX-based distros by default):
#   curl, sed, date
# usage:
#   ./scrape.sh <output-file> <interval-in-seconds>
# example to scrape every 10 seconds:
#   ./scrape.sh ~/speed.csv 10

URL=https://portal.imice.de/api1/rs/status

echo "Scraping ICE speed every $2 seconds, writing to $1 ...\n\n"

# get headers
echo "date,`curl $URL | sed -e 's/[{}"]//g ; s/:[\.a-zA-Z0-9_-]*//g ; s/$/\n/'`" > $1

# get data based on interval
while [ 1 ]
do
        echo "`date '+%Y-%m-%dT%H:%M:%SZ'`,`curl $URL | sed -e 's/[{}"]//g ; s/[a-zA-Z]*://g ; s/$/\n/'`" >> $1
        sleep $2s
done
