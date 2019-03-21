#!/bin/sh
case $1/$2 in
	pre/*)
	;;
	post/*)
	 modprobe -r r8169
         modprobe r8169
	;;
esac
