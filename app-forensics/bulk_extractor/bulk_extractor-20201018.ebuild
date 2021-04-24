# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/simsong/bulk_extractor.git"
EGIT_COMMIT="b287b06da0bc069681d988bf1a40e9b69437ddcf"
inherit git-r3

DESCRIPTION="Scans a disk image, directory or file and extracts useful information"
HOMEPAGE="http://www.forensicswiki.org/wiki/Bulk_extractor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="exiv2 +ewf aff sqlite"

DEPEND="aff? ( app-forensics/afflib dev-libs/openssl:* )
	ewf? ( app-forensics/libewf )
	sqlite? ( dev-db/sqlite )
	exiv2? ( media-gfx/exiv2 )
	dev-libs/expat
	sys-libs/zlib"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sh bootstrap.sh
}