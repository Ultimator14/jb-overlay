# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/RfidResearchGroup/proxmark3.git"
EGIT_COMMIT="45dc0fbc4274c3f681796873e8619f407e7bc414"
inherit git-r3 udev

DESCRIPTION="Proxmark3 RDV4.0 based on iceman fork"
HOMEPAGE="https://github.com/RfidResearchGroup/proxmark3"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="firmware"

DEPEND="virtual/libusb:=
	sys-libs/ncurses:*[tinfo]
	sys-libs/readline:=
	sys-apps/pcsc-lite
	firmware? ( sys-devel/gcc-arm-none-eabi )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's/-ltermcap/-ltinfo/g' client/Makefile || die
	sed -i -e 's/-ltermcap/-ltinfo/g' liblua/Makefile || die
	sed -i -e 's#lualibs/#../../usr/share/proxmark3_rdv4/lualibs/#' client/scripting.h || die
	sed -i -e 's#scripts/#../../usr/share/proxmark3_rdv4/scripts/#' client/scripting.h || die
	mv driver/77-pm3-usb-device-blacklist.rules driver/77-pm3_rdv4-usb-device-blacklist.rules
	eapply_user
}

src_compile(){
	if use firmware; then
		emake -j1 all
	else
		emake -j1 client
	fi
}

src_install(){
	dobin client/{flasher,proxmark3}
	#install scripts too
	insinto /usr/share/proxmark3_rdv4/lualibs
	doins client/lualibs/*
	insinto /usr/share/proxmark3_rdv4/scripts
	doins client/scripts/*
	if use firmware; then
		insinto /usr/share/proxmark3_rdv4
		doins armsrc/obj/*.elf
		doins bootrom/obj/bootrom.elf
		doins recovery/*.bin
		doins tools/mfkey/mfkey{32,64}
	fi
	udev_dorules driver/77-pm3_rdv4-usb-device-blacklist.rules
}
