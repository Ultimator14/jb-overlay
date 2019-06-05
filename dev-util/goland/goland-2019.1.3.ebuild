# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_PRETTY_PN="GoLand"
JB_HOMEPAGE="go"
JB_SRC_URI="go/${P}"
JB_EXTRACTED="GoLand-${PV}"

inherit jetbrains

DESCRIPTION="A Clever IDE to Go"

LICENSE="jetbrains-business jetbrains-personal"

RDEPEND="dev-lang/go"
