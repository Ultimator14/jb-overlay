# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/RfidResearchGroup/proxmark3.git"
EGIT_COMMIT="9f33e52ae0ccc4e7a77e9d7efbcdfbdac2aedf7b"
inherit git-r3 udev

DESCRIPTION="Proxmark3 RDV4.0 based on iceman fork"
HOMEPAGE="https://github.com/RfidResearchGroup/proxmark3"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
STANDALONE_LF="standalone-lf-em4100emul standalone-lf-em4100rswb standalone-lf-em4100rwc standalone-lf-hidbrute standalone-lf-icehid standalone-lf-proxbrute standalone-lf-samyrun standalone-lf-skeleton"
STANDALONE_HF="standalone-hf-14asniff standalone-hf-aveful standalone-hf-bog standalone-hf-colin standalone-hf-iceclass standalone-hf-legic standalone-hf-mattyrun +standalone-hf-msdsal standalone-hf-young"
IUSE="bluez firmware +qt5 wayland ${STANDALONE_LF} ${STANDALONE_HF}"

REQUIRED_USE="
	wayland? ( qt5 )
	?? ( ${STANDALONE_LF} ${STANDALONE_HF/+/} )
"

DEPEND="virtual/libusb:=
	sys-libs/ncurses:*[tinfo]
	sys-libs/readline:=
	bluez? ( net-wireless/bluez )
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		wayland? ( dev-qt/qtwayland:5 )
	)"
RDEPEND="${DEPEND}
firmware? ( sys-devel/gcc-arm-none-eabi )"

SKIP_OPTS=""

src_prepare() {
	# Set platform specific options
	echo 'PLATFORM=PM3RDV4' > Makefile.platform

	if use bluez; then
		echo 'PLATFORM_EXTRAS=BTADDON' >> Makefile.platform
	else
		echo 'PLATFORM_EXTRAS=' >> Makefile.platform
	fi

	# Set standalone mode
	if use standalone-lf-em4100emul; then
		echo 'STANDALONE=LF_EM4100EMUL' >> Makefile.platform
	elif use standalone-lf-em4100rswb; then
		echo 'STANDALONE=LF_EM4100RSWB' >> Makefile.platform
	elif use standalone-lf-em4100rwc; then
		echo 'STANDALONE=LF_EM4100RWC' >> Makefile.platform
	elif use standalone-lf-hidbrute; then
		echo 'STANDALONE=LF_HIDBRUTE' >> Makefile.platform
	elif use standalone-lf-icehid; then
		echo 'STANDALONE=LF_ICEHID' >> Makefile.platform
	elif use standalone-lf-proxbrute; then
		echo 'STANDALONE=LF_PROXBRUTE' >> Makefile.platform
	elif use standalone-lf-samyrun; then
		echo 'STANDALONE=LF_SAMYRUN' >> Makefile.platform
	elif use standalone-lf-skeleton; then
		echo 'STANDALONE=LF_SKELETON' >> Makefile.platform
	elif use standalone-hf-14asniff; then
		echo 'STANDALONE=HF_14ASNIFF' >> Makefile.platform
	elif use standalone-hf-aveful; then
		echo 'STANDALONE=HF_AVEFUL' >> Makefile.platform
	elif use standalone-hf-bog; then
		echo 'STANDALONE=HF_BOG' >> Makefile.platform
	elif use standalone-hf-colin; then
		echo 'STANDALONE=HF_COLIN' >> Makefile.platform
	elif use standalone-hf-iceclass; then
		echo 'STANDALONE=HF_ICECLASS' >> Makefile.platform
	elif use standalone-hf-legic; then
		echo 'STANDALONE=HF_LEGIC' >> Makefile.platform
	elif use standalone-hf-mattyrun; then
		echo 'STANDALONE=HF_MATTYRUN' >> Makefile.platform
	elif use standalone-hf-msdsal; then
		echo 'STANDALONE=HF_MSDSAL' >> Makefile.platform
	elif use standalone-hf-young; then
		echo 'STANDALONE=HF_YOUNG' >> Makefile.platform
	else
		echo 'STANDALONE=' >> Makefile.platform
	fi

	eapply_user

	if ! use qt5; then
		SKIP_OPTS+=" SKIPQT=1"
	fi

	if ! use bluez; then
		SKIP_OPTS+=" SKIPBT=1"
	fi
}

src_compile(){
	if use firmware; then
		emake ${SKIP_OPTS} all
	else
		emake ${SKIP_OPTS} client
		emake mfkey
		emake nonce2key
		emake mf_nonce_brute
		emake hitag2crack
		emake fpga_compress
	fi
}

src_install() {
	export PREFIX="/usr"
	export DESTDIR="${ED}"
	export MYDESTDIR="${ED}"  # required for hitag2crack tool
	export UDEV_PREFIX="$(get_udevdir)/rules.d"
	export INSTALLDOCSRELPATH="/share/doc/${PF}"

	if use firmware; then
		emake ${SKIP_OPTS} install
	else
		emake ${SKIP_OPTS} client/install mfkey/install nonce2key/install mf_nonce_brute/install hitag2crack/install fpga_compress/install
	fi
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
