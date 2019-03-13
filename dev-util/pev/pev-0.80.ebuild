# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

S="${WORKDIR}/${PN}"

DESCRIPTION="The PE file analysis toolkit"
HOMEPAGE="http://pev.sf.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

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
	sed -i -e 's/\/usr\/local/\/usr/' src/config.c || die "Sed failed!"
}

src_install() {
	emake prefix="${D}/usr" libdir="${D}/usr/lib64" install
}
