# Copyright 1999-2021 Gentoo Authors
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

	use_rm !python plugins/python-ce
	use_rm !bundled-cmake bin/cmake
	use_rm !bundled-gdb bin/gdb
	use_rm !bundled-lldb bin/lldb
}

src_install() {
	jetbrains_src_install

	fperms 755 /opt/${PN}/bin/clang/linux/clang{d,-tidy}
}
