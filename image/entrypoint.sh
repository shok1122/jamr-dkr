#!/bin/bash

# 環境変数の読み込み
. scripts/config_Semeval-2016_LDC2015E86.sh

function help()
{
	cat <<- _EOT_ >&2
		$(basename $0) [parse]
		parse <input1> <input2> ...
	_EOT_
}

case $1 in
	parse)
		shift
		for input in $(ls data/*.txt); do
			echo 1>&2 "parse $input"
			scripts/PARSE.sh < $input > data/$input.amr
		done
		;;
	*)
		help
		;;
esac

