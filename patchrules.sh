#!/bin/sh

cat <<EOF >>debian/rules
override_dh_install:
override_dh_installdocs:
override_dh_installman:
	dh_install -O--parallel
EOF