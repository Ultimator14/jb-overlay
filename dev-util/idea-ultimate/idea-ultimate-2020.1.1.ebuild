# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_MAJOR_PN="idea"
JB_PRETTY_PN="Intellij IDEA Ultimate"
JB_HOMEPAGE="${JB_MAJOR_PN}"
JB_SRC_URI="${JB_MAJOR_PN}/${JB_MAJOR_PN}IU-${PV}"
JB_EXTRACTED="${JB_MAJOR_PN}-IU-201.7223.91"

inherit jetbrains

DESCRIPTION="Capable and Ergonomic IDE for JVM"

LICENSE="jetbrains-business jetbrains-personal"

RDEPEND="virtual/jdk"

src_prepare() {
	jetbrains_src_prepare

	rm -rf plugins/tfsIntegration/lib/native/{aix,freebsd,hpux,macosx,solaris,win32}
	use_rm !arm plugins/tfsIntegration/lib/native/linux/arm
	use_rm !amd64 plugins/tfsIntegration/lib/native/linux/x86_64
	use_rm !ppc plugins/tfsIntegration/lib/native/linux/ppc
	use_rm !x86 plugins/tfsIntegration/lib/native/linux/x86
}
