CC := gcc
UNAME := $(shell uname -a)
MACHINE := $(shell $(CC) -dumpmachine)
CABAL := cabal
STACK := stack

## Silent by default
V =
ifeq ($(strip $(V)),)
        E = @echo
        Q = @
else
        E = @\#
        Q =
endif
export E Q


default: all

.DEFAULT:
	$(Q)$(STACK) build

.PHONY: clean full-clean

setup:
	$(Q)$(STACK) setup

build: setup
	$(Q)$(STACK) build

cabal-build: .cabalsandbox .cabal-update .cabal-intall-deps
	$(Q)$(CABAL) build

.cabal-install-deps:
	$(Q)$(CABAL) install --only-dependencies

.cabal-update:
	$(Q)$(CABAL) update

.cabalsandbox:
ifneq ($(wildcard .cabal-sandbox/),)
	$(E) "Using Existing sandbox..."
else
	$(E) "Building in a sandbox..."
	$(Q)$(CABAL) sandbox init
endif

clean:
	$(Q)find . -name *_flymake.hs -exec rm -f {} \;

full-clean: clean
	$(Q) $(CABAL) clean
	$(Q) $(CABAL) sandbox delete -v0
	$(Q) rm -rf .cabal-sandbox/ dist/ .stack-work/

