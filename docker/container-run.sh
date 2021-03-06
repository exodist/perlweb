#!/bin/sh
cd /perlweb
ls -latr
if [ -e .git ]; then
	echo Already has a git checkout
else
	git clone --recursive https://github.com/perlorg/perlweb.git .
	git checkout -b docker origin/docker
	git submodule update
fi

./combust/bin/httpd
