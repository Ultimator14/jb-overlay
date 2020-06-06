# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/merces/pev.git"
EGIT_COMMIT="beec2b4f09585fea919ed41ce466dee06be0b6bf"
inherit git-r3

MY_PV=$(ver_cut 1-2)
S="${WORKDIR}/${PN}-${MY_PV}"

DESCRIPTION="The PE file analysis toolkit"
HOMEPAGE="http://pev.sf.net"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libpcre
dev-libs/openssl:0="
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare(){
	eapply_user
	sed -i -e 's/\/usr\/local/\/usr/' src/pev.conf || die "Sed failed!"
	sed -i -e 's/\/usr\/local/\/usr/' src/Makefile || die "Sed failed!"
	sed -i -e 's/\/usr\/local/\/usr/' lib/libpe/Makefile || die "Sed failed!"
}

src_install() {
	emake prefix="${D}/usr" libdir="${D}/usr/lib64" install
}
