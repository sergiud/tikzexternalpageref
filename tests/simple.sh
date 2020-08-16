#!/bin/sh

text=`pdftotext -f 3 -l 3 -layout pagetest.pdf - | tail -2 | head -1 | sed 's/[\r\n]$$//'`
outdated="See Fig. 1a on page 2."
correct="See Fig. 1a on the facing page."

if [ "$text" = "$outdated" ]
then
    echo warning: you use an outdated TeXLive distribution where the varioref \
      and cleveref packages do not correctly interact with each other. as a \
      result, the \\\\vref command is not able to determine relative pages, \
      but instead it always uses absolute page numbers. >&2

    echo note: the test expected \"$correct\" but got \"$outdated\"\)
elif [ "$text" != "$correct" ]
then
    echo error: failed to resolve page references >&2
    exit 1
fi
