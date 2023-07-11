# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit udev

PNAME="sniffer-${PV}-linux-64.run"

DESCRIPTION="Bugblat USB Protocol Analyzers - Hardware Sniffing on a Budget"
HOMEPAGE="https://www.bugblat.com/products/minisniff2/"
SRC_URI="https://bugblatcdn.com/${PNAME}"

LICENSE="Bugblat-Software-License"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="strip"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_install() {
	cp "${DISTDIR}/${PNAME}" ./
	chmod +x ${PNAME}
	./${PNAME}

	exeinto /usr/bin
	doexe tmp/sniffer

	mv tmp/sniffer.rules tmp/99-sniffer.rules
	udev_dorules tmp/99-sniffer.rules
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
