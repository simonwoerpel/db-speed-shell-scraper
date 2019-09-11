# db-speed-shell-scraper

simple bash script to scrape the speed (and some meta data) about your ride in
a german ICE train from the API from the internal wifi portal, just using
`curl` to get the data and `sed` to parse the result via regex into a csv
format.

It is inspired by a [talk at #SciCAR19 - conference](https://scicar2019.sched.com/event/SiYe/modellrechnungen-im-datenjournalismus-eine-unterschatzte-methode)
and [this discussion](https://twitter.com/HalukaMB/status/1171819128526659584)

the API: https://portal.imice.de/api1/rs/status (only works from inside the DB train wifi)

## usage

    ./scrape.sh <output-file> <interval-in-seconds>

example to scrape every 10 seconds:

    ./scrape.sh ~/speed.csv 10

It will run forever. Just end it with `Ctrl-C` or however you kill processes on
your system.

## requirements

*these should come with all UNIX-based distros by default*:

curl, sed, date



