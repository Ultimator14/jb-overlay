# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_MAJOR_PN="idea"
JB_PRETTY_PN="Intellij IDEA Ultimate"
JB_HOMEPAGE="${JB_MAJOR_PN}"
JB_SRC_URI="${JB_MAJOR_PN}/${JB_MAJOR_PN}IU-${PV}"
JB_EXTRACTED="${JB_MAJOR_PN}-IU-232.9559.62"

inherit jetbrains

DESCRIPTION="Capable and Ergonomic IDE for JVM"

LICENSE="jetbrains-business jetbrains-personal"

RDEPEND="virtual/jdk"

src_prepare() {
	jetbrains_src_prepare

	rm --interactive=never plugins/cwm-plugin/quiche-native/linux-aarch64/libquiche.so || die
	rm --interactive=never plugins/gateway-plugin/lib/remote-dev-workers/remote-dev-worker-linux-arm64 || die
	rm --interactive=never plugins/tailwindcss/server/node.napi.musl-IAP67VWK.node || die

}

