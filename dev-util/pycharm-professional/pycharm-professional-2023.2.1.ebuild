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

src_prepare() {
	jetbrains_src_prepare

	rm --interactive=never plugins/cwm-plugin/quiche-native/linux-aarch64/libquiche.so || die
	rm --interactive=never plugins/gateway-plugin/lib/remote-dev-workers/remote-dev-worker-linux-arm64 || die
	rm --interactive=never plugins/python/helpers/pydev/pydevd_attach_to_process/attach_linux_aarch64.so || die
	rm --interactive=never plugins/tailwindcss/server/node.napi.musl-IAP67VWK.node || die
}
