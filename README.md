RPM package for the [Brackets](http://brackets.io/) code editor.

### Installation

First, you'll need the copr plugin:

    dnf install dnf-plugins-core -y

Then, enable the repository and install the package:

    dnf copr enable jgillich/brackets
    dnf install brackets -y

Using this repository, the following distributions are supported:

* Fedora 20, 21
* RHEL 7 (and rebuilds like CentOS)

### Building

Set the version you want in the spec file and run `make`. Note that
this requires a `release-$(VERSION)` branch or tag, which only
exists for released versions. Modify the Makefile to change this.
