# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_PRETTY_PN="GoLand"
JB_HOMEPAGE="go"
JB_SRC_URI="go/${P}"
JB_EXTRACTED="GoLand-${PV}"

inherit jetbrains

DESCRIPTION="A Clever IDE to Go"

LICENSE="jetbrains-business jetbrains-personal"

RDEPEND="dev-lang/go"

src_prepare() {
	jetbrains_src_prepare

	rm --interactive=never plugins/cwm-plugin/quiche-native/linux-aarch64/libquiche.so || die
	rm --interactive=never plugins/gateway-plugin/lib/remote-dev-workers/remote-dev-worker-linux-arm64 || die
	rm --interactive=never plugins/go-plugin/lib/dlv/linuxarm/dlv || die

}
