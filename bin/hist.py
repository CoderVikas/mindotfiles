#!/usr/bin/env python
# x.startswith("_")
f = open('/Users/yadvika/.bash_history')
l = f.readlines()
l.reverse()
short = []
cmdline_included = 0
for s in l:
    if s.startswith("#"):
	if cmdline_included == 1:
		short.append(s.rstrip())
	continue
    # marked not-include unless we really add it to short
    cmdline_included = 0	
    if s.rstrip() not in short:
	cmdline_included = 1
        short.append(s.rstrip())
short.reverse()
for s in short:
    print s
