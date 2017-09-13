default: all

.DEFAULT:
	stack build

.PHONY: clean full-clean

setup:
	stack setup

build: setup
	stack build

clean:
	find . -name *_flymake.hs -exec rm -f {} \;

full-clean: clean
	rm -rf .stack-work/
