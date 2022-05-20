# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_MAJOR_PN="pycharm"
JB_PRETTY_PN="PyCharm Professional"
JB_HOMEPAGE="${JB_MAJOR_PN}"
JB_SRC_URI="python/${P}"
JB_EXTRACTED="${JB_MAJOR_PN}-${PV}"

inherit jetbrains

DESCRIPTION="The Python IDE for Professional Developers"

LICENSE="jetbrains-business jetbrains-personal"

RDEPEND=""
