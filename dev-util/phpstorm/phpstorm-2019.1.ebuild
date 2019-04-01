# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_PRETTY_PN="PhpStorm"
JB_HOMEPAGE="${PN}"
JB_SRC_URI="webide/PhpStorm-${PV}"
JB_EXTRACTED="PhpStorm-191.6183.95"

inherit jetbrains

DESCRIPTION="The Lightning-Smart PHP IDE"

LICENSE="jetbrains-business jetbrains-personal"

RDEPEND=""
