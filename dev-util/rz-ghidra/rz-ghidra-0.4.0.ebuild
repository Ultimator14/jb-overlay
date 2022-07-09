# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

S="${WORKDIR}/${PN}"

inherit cmake

DESCRIPTION="Deep ghidra decompiler and sleigh disassembler integration for rizin"
HOMEPAGE="https://github.com/rizinorg/rz-ghidra"

SRC_URI="https://github.com/rizinorg/${PN}/releases/download/v${PV}/${PN}-src-v${PV}.tar.gz -> ${PN}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cutter"

DEPEND="
	dev-libs/pugixml
	dev-util/rizin:=
	cutter? (
		dev-qt/qtwidgets:5
		dev-util/cutter
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-fix-crc32-include-guard.patch"
)

RESTRICT="mirror"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	# Get current rizin version to install the plugin in the right dir
	readarray -d'-' -t f <<<$(best_version dev-util/rizin)
	local rizin_ver=$(tr -d '\n' <<< ${f[2]})

	local mycmakeargs=(
		-DBUILD_CUTTER_PLUGIN=$(usex cutter)
		-DUSE_SYSTEM_PUGIXML=ON
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
		-DRIZIN_INSTALL_PLUGDIR="lib64/rizin/plugins"
		-DCUTTER_INSTALL_PLUGDIR="share/rizin/cutter/plugins/native"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
