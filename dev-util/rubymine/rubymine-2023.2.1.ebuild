# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JB_PRETTY_PN="RubyMine"
JB_HOMEPAGE="ruby"
JB_SRC_URI="ruby/RubyMine-${PV}"
JB_EXTRACTED="RubyMine-${PV}"

inherit jetbrains

DESCRIPTION="The Most Intelligent Ruby and Rails IDE"

LICENSE="jetbrains-business jetbrains-personal"

RDEPEND=""

src_prepare() {
	jetbrains_src_prepare

	rm --interactive=never plugins/gateway-plugin/lib/remote-dev-workers/remote-dev-worker-linux-arm64 || die
	rm --interactive=never plugins/tailwindcss/server/node.napi.musl-IAP67VWK.node || die
}
