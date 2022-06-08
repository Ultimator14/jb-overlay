# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop

MY_PN="write"
MY_PV=$(ver_rs 1-2 '')
MY_P="${MY_PN}${MY_PV}"
S="${WORKDIR}/Write"

DESCRIPTION="Write is a word processor for handwriting"
HOMEPAGE="http://www.styluslabs.com/"
SRC_URI="http://www.styluslabs.com/${MY_PN}/${MY_P}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="Styluslabs_Write-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-qt/qtwidgets-5.7
>=dev-qt/qtnetwork-5.7
>=dev-qt/qtsvg-5.7"
RDEPEND="${DEPEND}"

src_compile() {
	true;
}

src_install() {
	exeinto /opt/${PN}
	doexe Write

	insinto /opt/${PN}
	doins DroidSansFallback.ttf Roboto-Regular.ttf Intro.svg Write144x144.png

	make_desktop_entry "/opt/${PN}/Write %U" Write Write144x144 Office
}
