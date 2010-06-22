#!/bin/sh
# Copyright (C) 2007-2010 Jari Aalto; Licenced under GPL v2 or later
#
# install-after.sh -- Custom installation
#
# The script will receive one argument: relative path to
# installation root directory. Script is called like:
#
#    $ install-after.sh .inst
#
# This script is run after [install] command.

Cmd()
{
    echo "$@"
    [ "$test" ] && return
    "$@"
}

Main()
{
    root=${1:-".inst"}

    if [ "$root"  ] && [ -d $root ]; then

        root=$(echo $root | sed 's,/$,,')  # Delete trailing slash
	bin=$root/usr/bin

        if [ -d $bin ]; then
            echo ">> Remove empty dir"
            Cmd rmdir $bin
        fi
    fi
}

Main "$@"

# End of file
