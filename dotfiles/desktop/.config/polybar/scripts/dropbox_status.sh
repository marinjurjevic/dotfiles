 
#!/bin/sh

if [ "$(pgrep dropbox)" ]; then
    echo "%{F#007ee5}"
else
    echo "%{F#444444}"
fi