#!/usr/bin/env bash

pushd $HOME
npm init -y
popd

npm_formulas=(
	hpm
	iterm2-tab-set
	tmux-mem
	'--save github-markdown-css'
	instant-markdown-d
	jsonlint
	vtop
	underscore-cli
	get-port-cli
	release-it
	nodemon
	spot
	superstatic
	tldr
	git-open
	git-recent
	diff-so-fancy
	trash-cli
	eslint
	http-server
	hpm-cli
	js-beautify
	markdown-pdf
	npm
)	
for formula in "${npm_formulas[@]}"; do
	echo "npm install -g $formula"
	npm install -g $formula
done
