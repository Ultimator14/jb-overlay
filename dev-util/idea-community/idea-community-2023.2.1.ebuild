# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_MAJOR_PN="idea"
JB_PRETTY_PN="Intellij IDEA Community"
JB_HOMEPAGE="${JB_MAJOR_PN}"
JB_SRC_URI="${JB_MAJOR_PN}/${JB_MAJOR_PN}IC-${PV}"
JB_EXTRACTED="${JB_MAJOR_PN}-IC-232.9559.62"

inherit jetbrains

DESCRIPTION="Capable and Ergonomic IDE for JVM"

LICENSE="Apache-2.0"

RDEPEND="virtual/jdk"
