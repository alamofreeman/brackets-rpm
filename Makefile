VERSION=$(shell rpmspec -q --qf "%{RPMTAG_VERSION}" SPECS/brackets.spec)
BRANCH=release-$(VERSION)

all: pull build

pull:
	rm -rf brackets
	rm -rf brackets-shell

	git clone https://github.com/adobe/brackets.git
	git clone https://github.com/adobe/brackets-shell.git

	cd brackets && git checkout $(BRANCH) && git submodule update --init && rm -rf .git && cd ..
	cd brackets-shell && git checkout linux-1547 && git submodule update --init && rm -rf .git && cd ..

	tar -cvzf SOURCES/brackets-$(VERSION).tar.gz brackets
	tar -cvzf SOURCES/brackets-shell-$(VERSION).tar.gz brackets-shell

	rm -rf brackets
	rm -rf brackets-shell

build:
	rpmbuild --define "_topdir $(shell pwd)" -ba SPECS/brackets.spec
