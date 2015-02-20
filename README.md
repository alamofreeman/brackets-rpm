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

Other RPM-based distributions might work if you build the package yourself.

### Building

This package is built like any other RPM: Using the spec file and `rpmbuild`. The sources have to be downloaded manually, use the `fetch_source.sh` script for that purpose.

To do a full build, including setting up the environment, run the following:
```
sudo yum install @development-tools fedora-packager gtk2-devel npm nspr gyp desktop-file-utils
# on F21: also install compat-libgcrypt (provided by the brackets copr repo)
rpmdev-setuptree
curl -L https://github.com/jgillich/brackets-rpm/archive/master.tar.gz | tar -xvz -C ~/rpmbuild --strip-components=1
cd ~/rpmbuild/
bash fetch_source.sh 1.1 release-1.1 linux-1547
rpmbuild -ba ~/rpmbuild/SPECS/brackets.spec
```
