# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Library and tools to access FileVault Drive Encryption (FVDE) encrypted volumes"
HOMEPAGE="https://github.com/libyal/libfvde"
SRC_URI="https://github.com/libyal/${PN}/releases/download/${PV}/${PN}-experimental-${PV}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
IUSE="+compression +openssl python static-libs"

DEPEND="dev-util/byacc
sys-devel/flex
virtual/pkgconfig
compression? ( sys-libs/zlib )
openssl? ( dev-libs/openssl )"
RDEPEND="sys-fs/fuse"
BDEPEND=""

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	econf \
		--prefix=/usr \
		$(use_with !compression zlib no) \
		$(use_with !openssl openssl no) \
		$(use_enable static-libs shared no) \
		$(use_enable python)
}
