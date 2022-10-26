# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A pretty simple icon theme, derived from Ultra-Flat-Icons, Paper and Flattr"
HOMEPAGE="https://drasite.com/flat-remix"

if [[ ${PV} == 99999999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/daniruiz/Flat-Remix.git"
else
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
	SRC_URI="https://github.com/daniruiz/Flat-Remix/archive/${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${P//-icon-theme}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="+dark light light-darkpanel"
REQUIRED_USE="|| ( dark light light-darkpanel )"
RESTRICT="strip"

src_install() {
	COLORS="{Black,Blue,Brown,Cyan,Green,Grey,Magenta,Orange,Red,Teal,Violet,Yellow}"

	THEMES=""
	use dark && THEMES+=" $(echo Flat-Remix-${COLORS}-Dark)"
	use light && THEMES+=" $(echo Flat-Remix-${COLORS}-Light)"
	use light-darkpanel && THEMES+=" $(echo Flat-Remix-${COLORS}-Light-darkPanel)"

	THEMES="$(eval echo ${THEMES})" default
}
