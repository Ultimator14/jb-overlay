# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_PRETTY_PN="CLion"
JB_HOMEPAGE="${PN}"
JB_SRC_URI="cpp/CLion-${PV}"
JB_EXTRACTED="${P}"

inherit jetbrains

DESCRIPTION="A cross-platform IDE for C and C++"

LICENSE="jetbrains-business jetbrains-personal"
IUSE="system-lldb
+python
bundled-cmake
bundled-gdb
bundled-lldb"

RDEPEND="python? ( dev-lang/python )
!bundled-cmake? ( dev-util/cmake )
!bundled-gdb? ( sys-devel/gdb )
system-lldb? ( dev-util/lldb )"

src_prepare() {
	jetbrains_src_prepare

	use_rm !python plugins/python
	use_rm !bundled-cmake bin/cmake
	use_rm !bundled-gdb bin/gdb
	use_rm !bundled-lldb bin/lldb

	rm -rf plugins/tfsIntegration/lib/native/{aix,freebsd,hpux,macosx,solaris,win32}
	use_rm !arm plugins/tfsIntegration/lib/native/linux/arm
	use_rm !amd64 plugins/tfsIntegration/lib/native/linux/x86_64
	use_rm !ppc plugins/tfsIntegration/lib/native/linux/ppc
	use_rm !x86 plugins/tfsIntegration/lib/native/linux/x86
}

src_install() {
	jetbrains_src_install

	fperms 755 /opt/${PN}/bin/clang/linux/clang{d,-tidy}
}
