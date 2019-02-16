# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Library and tools to access FileVault Drive Encryption (FVDE) encrypted volumes"
HOMEPAGE="https://github.com/libyal/libfvde"
SRC_URI="https://github.com/libyal/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs python"

DEPEND="virtual/pkgconfig"
RDEPEND=""
BDEPEND=""

src_configure() {
	econf \
		--prefix=/usr \
		$(use_enable static-libs shared no) \
		$(use_enable python)
}
