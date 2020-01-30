#!/bin/sh
find . -type f -name '*.tex' -print0 | xargs -0 sed -i -e "s/。/./"
find . -type f -name '*.tex' -print0 | xargs -0 sed -i -e "s/、/, /"
