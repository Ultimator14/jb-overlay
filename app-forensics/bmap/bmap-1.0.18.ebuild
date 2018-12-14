# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/CameronLonsdale/bmap.git"
EGIT_COMMIT="375d50278fc244f5b3c9e8a7a75ef81a83f2c72c"
inherit git-r3

DESCRIPTION="A filesystem-independant file blockmap utility for Linux"
HOMEPAGE="https://github.com/CameronLonsdale/bmap"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/linuxdoc-tools"
RDEPEND="${DEPEND}"

src_compile() {
	emake -j1
}

src_install() {
	exeinto /bin/

	doexe bmap
	doexe slacker

	./bmap --man > bmap.1
	./slacker --man > slacker.1
	doman bmap.1 slacker.1
}
