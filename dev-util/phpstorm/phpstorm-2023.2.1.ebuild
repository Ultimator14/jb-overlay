# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_PRETTY_PN="PhpStorm"
JB_HOMEPAGE="${PN}"
JB_SRC_URI="webide/PhpStorm-${PV}"
JB_EXTRACTED="PhpStorm-232.9559.64"

inherit jetbrains

DESCRIPTION="The Lightning-Smart PHP IDE"

LICENSE="jetbrains-business jetbrains-personal"

RDEPEND=""

src_prepare() {
	jetbrains_src_prepare

	rm --interactive=never plugins/gateway-plugin/lib/remote-dev-workers/remote-dev-worker-linux-arm64 || die
	rm --interactive=never plugins/tailwindcss/server/node.napi.musl-IAP67VWK.node || die
}
