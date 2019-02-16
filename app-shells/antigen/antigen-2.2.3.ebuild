# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The plugin manager for zsh."
HOMEPAGE="http://antigen.sharats.me/"
SRC_URI="https://github.com/zsh-users/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/${PN}-selfupdate.patch" )

src_configure() {
	"${S}"/configure
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${D}"/usr install
}

pkg_postinst() {
	ewarn "Add the following to your .zshrc file"
	ewarn "source /usr/share/antigen.zsh"
	ewarn "# antigen commands here"
	ewarn "antigen apply"
}
