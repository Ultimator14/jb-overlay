# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_PRETTY_PN="CLion"
JB_HOMEPAGE="${PN}"
JB_SRC_URI="cpp/CLion-${PV}"
JB_EXTRACTED="${P}"

inherit jetbrains

DESCRIPTION="A cross-platform IDE for C and C++"

LICENSE="jetbrains-business jetbrains-personal"
IUSE="+bundled-clang +bundled-cmake +bundled-gdb +bundled-lldb +bundled-ninja"

RDEPEND="!bundled-clang? ( sys-devel/clang )
!bundled-cmake? ( dev-util/cmake )
!bundled-gdb? ( sys-devel/gdb )
!bundled-lldb? ( dev-util/lldb )
!bundled-ninja? ( dev-util/ninja )"

src_prepare() {
	jetbrains_src_prepare

	use_rm !bundled-clang bin/clang
	use_rm !bundled-cmake bin/cmake
	use_rm !bundled-gdb bin/gdb
	use_rm !bundled-lldb bin/lldb
	use_rm !bundled-ninja bin/ninja
}

src_install() {
	jetbrains_src_install

	use_mkexec bundled-clang bin/clang/linux/{clangd,clang-tidy,clazy-standalone,libclazyPlugin.so,libclazyPlugin.so.15git,llvm-symbolizer}
	use_mkexec bundled-cmake bin/cmake/linux/bin/{ccmake,cmake,cpack,ctest}
	use_mkexec bundled-gdb bin/gdb/linux/bin/{gcore,gdb,gdb-add-index,gdbserver}
	use_mkexec bundled-lldb bin/lldb/linux/bin/{lldb,lldb-argdumper,LLDBFrontend,lldb-server}
	use_mkexec bundled-ninja bin/ninja/linux/ninja
}
