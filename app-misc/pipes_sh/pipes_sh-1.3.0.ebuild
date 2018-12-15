# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="pipes.sh"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Animated pipes terminal screensaver"
HOMEPAGE="https://pipeseroni.github.io/"
SRC_URI="https://github.com/pipeseroni/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	true;
}

src_install() {
	exeinto /bin/

	doexe pipes.sh
	doman -i18n= pipes.sh.6
}
