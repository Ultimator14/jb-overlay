# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

MY_PV=$(ver_rs 1 '')
MY_P=${PN}${MY_PV}

DESCRIPTION="IDA is the Interactive DisAssembler"
SRC_URI="https://out7.hex-rays.com/files/${MY_P}_linux.run"
HOMEPAGE="https://www.hex-rays.com/"

LICENSE="IDA-EULA"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="bindist mirror strip"

RDEPEND="dev-qt/qtgui:5[eglfs]
		dev-qt/qtcore:5
		dev-qt/qtprintsupport:5
		dev-qt/qtwidgets:5
		sys-libs/binutils-libs"

S=${WORKDIR}

src_install() {
	cp "${DISTDIR}/${MY_P}_linux.run" ./
	chmod +x ${MY_P}_linux.run
	./${MY_P}_linux.run --installpassword "" --mode unattended --prefix "${WORKDIR}/opt/${MY_P}"

	insinto /
	doins -r opt

	exeinto /opt/${MY_P}
	doexe opt/${MY_P}/ida64
	dosym ${EPREFIX}/opt/${MY_P}/ida64 ${EPREFIX}/usr/bin/ida64

	make_desktop_entry "/opt/${MY_P}/ida64 %f" "IDA Pro Free" "/opt/${MY_P}/appico64.png"
}
