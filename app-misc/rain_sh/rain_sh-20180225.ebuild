# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/lbgists/rain.sh.git"
EGIT_COMMIT="eb3becff704b838ff3b23dc1d3301c23004c73d4"
inherit git-r3

DESCRIPTION="Let It Rain!"
HOMEPAGE="https://github.com/lbgists/rain.sh"

LICENSE="none"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	true;
}

src_install() {
	exeinto /bin/
	doexe rain.sh
}
