# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_PRETTY_PN="WebStorm"
JB_HOMEPAGE="${PN}"
JB_SRC_URI="${PN}/WebStorm-${PV}"
JB_EXTRACTED="WebStorm-191.6183.63"

inherit jetbrains

DESCRIPTION="The smartest JavaScript IDE"

LICENSE="jetbrains-business jetbrains-personal"

RDEPEND=""
