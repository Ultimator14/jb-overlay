# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils

DESCRIPTION="The intuitive, fast, and beautiful cross-platform Git client"
HOMEPAGE="https://www.gitkraken.com/"
SRC_URI="https://release.gitkraken.com/linux/GitKraken-v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="gitkraken-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# use ~/.local/tmp as TMPDIR, this programm needs exec permission on it's TMPDIR and this option allows it to keep /tmp noexec
IUSE="+localtmp"

DEPEND="net-misc/curl
net-libs/gnutls
gnome-base/libgnome-keyring
dev-libs/openssl:0"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/gitkraken"

src_install() {
	insinto "/opt/${PN}"
	doins -r .
	fperms 755 /opt/${PN}/{${PN},libffmpeg.so,libnode.so}

	dosym libcurl.so.4 "/usr/$(get_libdir)/libcurl-gnutls.so.4"

	if use localtmp ; then
		# use local tmpdir
		make_wrapper "${PN}" "env TMPDIR=\"~/.local/tmp\" /opt/${PN}/${PN}"
	else
		# don't change tmpdir
		make_wrapper "${PN}" "/opt/${PN}/${PN}"
	fi

	make_desktop_entry gitkraken GitKraken gitkraken Development
}
