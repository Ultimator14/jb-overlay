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
!bundled-gdb? ( dev-debug/gdb )
!bundled-lldb? ( dev-util/lldb )
!bundled-ninja? ( dev-util/ninja )"

src_prepare() {
	jetbrains_src_prepare

	rm --interactive=never plugins/tailwindcss/server/node.napi.musl-IAP67VWK.node || die
	rm --interactive=never plugins/gateway-plugin/lib/remote-dev-workers/remote-dev-worker-linux-arm64 || die
	rm --interactive=never plugins/python-ce/helpers/pydev/pydevd_attach_to_process/attach_linux_aarch64.so || die

	use_rm !bundled-clang bin/clang
	use_rm !bundled-cmake bin/cmake
	use_rm !bundled-gdb bin/gdb
	use_rm !bundled-lldb bin/lldb
	use_rm !bundled-ninja bin/ninja

	if use bundled-clang; then
		patchelf --set-rpath '$ORIGIN' bin/clang/linux/x64/libclazyPlugin.so || die
		patchelf --set-rpath '$ORIGIN' bin/clang/linux/x64/libclazyPlugin.so.17git || die
	fi
}

src_install() {
	jetbrains_src_install

	use_mkexec bundled-clang bin/clang/linux/x64/{clang-tidy,clangd,clazy-standalone,libclazyPlugin.so,llvm-symbolizer}
	use_mkexec bundled-cmake bin/cmake/linux/x64/bin/{cmake,cpack,ctest}
	use_mkexec bundled-gdb bin/gdb/linux/x64/bin/{gcore,gdb,gdb-add-index,gdbserver}
	use_mkexec bundled-lldb bin/lldb/linux/x64/bin/{lldb,lldb-argdumper,lldb-server,LLDBFrontend}
	use_mkexec bundled-ninja bin/ninja/linux/x64/ninja
}
