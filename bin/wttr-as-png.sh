#!/usr/bin/env bash

wttrin=Parkersburg.png?u

clean() {
  rm ~/.cache/${wttrin}
  # in case u||i press the button to many times
  rm ~/.cache/${wttrin}.*
}

clean
wget -P ~/.cache wttr.in/${wttrin} && \
  qimgv ~/.cache/${wttrin} || \
  notify-send "wttr-as-png.sh failed \_||_/" && \
  echo "you suck :|"
clean

exit
