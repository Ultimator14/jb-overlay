# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/merces/pev.git"
EGIT_COMMIT="v${PV}"
inherit git-r3

DESCRIPTION="The PE file analysis toolkit"
HOMEPAGE="http://pev.sf.net"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-dont-compress-man-pages.patch"
)

src_prepare() {
	eapply ${PATCHES}
	eapply_user
	sed -i -e 's/\/usr\/local\/lib/\/usr\/lib64/' src/pev.conf  || die "Sed failed!"
}

src_install() {
	emake prefix="${D}/usr" libdir="${D}/usr/lib64" install
}
