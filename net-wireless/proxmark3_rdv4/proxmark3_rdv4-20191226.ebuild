# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/RfidResearchGroup/proxmark3.git"
EGIT_COMMIT="657061f8d5c9c94897d417c22b50554e74897239"
inherit git-r3 udev

DESCRIPTION="Proxmark3 RDV4.0 based on iceman fork"
HOMEPAGE="https://github.com/RfidResearchGroup/proxmark3"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="firmware +qt5 wayland"

REQUIRED_USE="
	wayland? ( qt5 )
"

DEPEND="virtual/libusb:=
	sys-libs/ncurses:*[tinfo]
	sys-libs/readline:=
	sys-apps/pcsc-lite
	firmware? ( sys-devel/gcc-arm-none-eabi )
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		wayland? ( dev-qt/qtwayland:5 )
	)"
RDEPEND="${DEPEND}"

src_prepare() {
	# change paths to be compatible with net-wireless/proxmark3 package
	sed -i -e 's#FULLIMAGE="fullimage.elf"#FULLIMAGE="'${EPREFIX}'/usr/share/proxmark3_rdv4/firmware/fullimage.elf"#g' pm3 || die
	sed -i -e 's#BOOTIMAGE="bootrom.elf"#BOOTIMAGE="'${EPREFIX}'/usr/share/proxmark3_rdv4/firmware/bootrom.elf"#g' pm3 || die
	sed -i -e 's#proxmark3#proxmark3_rdv4#g' include/common.h || die

	# remove honorization of cflags for arm compilation (commit 377ead8e62a539203ec500fa13c21a05984eae31) due to incompatibility with the march=native flag
	sed -i -e 's#CFLAGS ?= -Wall -Werror -pedantic -Wunused -Os#CFLAGS = -Wall -Werror -pedantic -Wunused -Os#g' common_arm/Makefile.common || die

	mv driver/77-pm3-usb-device-blacklist.rules driver/77-pm3_rdv4-usb-device-blacklist.rules
	eapply_user
}

src_compile(){
	if use firmware; then
		emake all
	else
		emake client
		emake mfkey
	fi
}

src_install(){
	# client and tools
	dobin client/proxmark3
	insinto /usr/share/proxmark3_rdv4/tools
	doins tools/mfkey/mfkey{32,64}

	# scripts
	insinto /usr/share/proxmark3_rdv4/lualibs
	doins client/lualibs/*
	insinto /usr/share/proxmark3_rdv4/luascripts
	doins client/luascripts/*
	insinto /usr/share/proxmark3_rdv4/cmdscripts
	doins client/cmdscripts/*

	if use firmware; then
		# flasher scripts
		dobin pm3
		dobin pm3-flash{,-all,-bootrom,-fullimage}

		# firmware files
		insinto /usr/share/proxmark3_rdv4/firmware
		doins armsrc/obj/fullimage{,.stage1}.elf
		doins bootrom/obj/bootrom.elf
		doins recovery/{bootrom,fullimage}.bin
	fi
	udev_dorules driver/77-pm3_rdv4-usb-device-blacklist.rules
}

pkg_postinst() {
	if ! use qt5 ; then
		elog ""
		elog "You didn't enable qt support."
		elog "You may have to execute"
		elog "$ unset DISPLAY"
		elog "to be able to start the software on a system with Desktop Environment"
		elog ""
	fi
	if use firmware ; then
		elog ""
		elog "To install the firmware execute"
		elog "# pm3-flash-all"
		elog ""
		elog "If you are upgrading from an older firmware execute"
		elog "# pm3-flash-bootrom"
		elog "Then disconnect and reconnect your proxmark3 and execute"
		elog "# pm3-flash-fullimage"
		elog ""
	fi
}
