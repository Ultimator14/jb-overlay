# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Simple terminal UI for git commands"
HOMEPAGE="https://github.com/jesseduffield/lazygit"
SRC_URI="https://github.com/jesseduffield/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-vcs/git"

src_compile() {
	ego build || die
}

src_install() {
	default

	dobin lazygit
}
