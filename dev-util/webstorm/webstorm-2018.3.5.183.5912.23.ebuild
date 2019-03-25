# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils

DESCRIPTION="JavaScript IDE for client- and server-side development with Node.js"
HOMEPAGE="http://www.jetbrains.com/webstorm"
SRC_URI="http://download.jetbrains.com/${PN}/WebStorm-$(ver_cut 1-3).tar.gz"

LICENSE="WebStorm WebStorm_Academic WebStorm_Classroom WebStorm_OpenSource WebStorm_personal"
# This package cannot be slotted for now, bug #592636
#SLOT="$(get_major_version)"
SLOT="2018"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="splitdebug" #656858

RDEPEND=">=virtual/jdk-1.7"

S="${WORKDIR}/WebStorm-$(ver_cut 4-6)"

src_install() {
	insinto "/opt/${PN}"
	doins -r .
	fperms 755 /opt/${PN}/bin/{${PN}.sh,fsnotifier{,64}}

	make_wrapper "${PN}" "/opt/${PN}/bin/${PN}.sh"
	newicon "bin/${PN}.svg" "${PN}.svg"
	make_desktop_entry "${PN}" "${PN}" "${PN}" "Development;IDE;"
}
