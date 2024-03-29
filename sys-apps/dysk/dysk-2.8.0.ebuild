# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.0.4
	anstream@0.3.2
	anstyle@1.0.1
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@1.0.1
	autocfg@1.1.0
	bet@1.0.2
	bitflags@1.3.2
	bitflags@2.3.3
	cc@1.0.79
	cfg-if@1.0.0
	clap@4.3.12
	clap-help@0.7.0
	clap_builder@4.3.12
	clap_complete@4.3.2
	clap_derive@4.3.12
	clap_lex@0.5.0
	clap_mangen@0.2.12
	colorchoice@1.0.0
	coolor@0.5.0
	crossbeam@0.8.2
	crossbeam-channel@0.5.6
	crossbeam-deque@0.8.2
	crossbeam-epoch@0.9.13
	crossbeam-queue@0.3.8
	crossbeam-utils@0.8.14
	crossterm@0.23.2
	crossterm_winapi@0.9.0
	doc-comment@0.3.3
	errno@0.3.1
	errno-dragonfly@0.1.2
	file-size@1.0.3
	heck@0.4.0
	hermit-abi@0.3.2
	is-terminal@0.4.9
	itoa@1.0.4
	lazy-regex@2.3.1
	lazy-regex@3.0.1
	lazy-regex-proc_macros@2.3.1
	lazy-regex-proc_macros@3.0.1
	lfs-core@0.11.1
	libc@0.2.147
	linux-raw-sys@0.4.3
	lock_api@0.4.9
	log@0.4.17
	memchr@2.5.0
	memoffset@0.6.5
	memoffset@0.7.1
	minimad@0.13.0
	mio@0.8.5
	nix@0.22.3
	once_cell@1.18.0
	parking_lot@0.12.1
	parking_lot_core@0.9.5
	proc-macro2@1.0.65
	quote@1.0.30
	redox_syscall@0.2.16
	regex@1.9.3
	regex-automata@0.3.6
	regex-syntax@0.7.4
	roff@0.2.1
	rustix@0.38.4
	ryu@1.0.11
	scopeguard@1.1.0
	serde@1.0.150
	serde_derive@1.0.150
	serde_json@1.0.89
	signal-hook@0.3.14
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.0
	smallvec@1.10.0
	snafu@0.7.3
	snafu-derive@0.7.3
	strsim@0.10.0
	syn@1.0.105
	syn@2.0.26
	termimad@0.25.0
	terminal-light@1.1.1
	thiserror@1.0.37
	thiserror-impl@1.0.37
	unicode-ident@1.0.5
	unicode-width@0.1.10
	utf8parse@0.2.1
	wasi@0.11.0+wasi-snapshot-preview1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.42.0
	windows-sys@0.48.0
	windows-targets@0.48.1
	windows_aarch64_gnullvm@0.42.0
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.42.0
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.42.0
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.42.0
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.42.0
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.42.0
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.42.0
	windows_x86_64_msvc@0.48.0
	xterm-query@0.2.0
"

inherit cargo

DESCRIPTION="A linux utility to get information on filesystems, like df but better"
HOMEPAGE="https://dystroy.org/dysk/"
SRC_URI="
	https://github.com/Canop/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT Apache-2.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_FLAGS_IGNORED="usr/bin/${PN}"
