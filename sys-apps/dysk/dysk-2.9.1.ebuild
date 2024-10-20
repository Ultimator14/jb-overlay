# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	anstream@0.6.15
	anstyle@1.0.8
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	autocfg@1.3.0
	bet@1.0.4
	bitflags@2.6.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	clap@4.5.17
	clap-help@1.3.0
	clap_builder@4.5.17
	clap_complete@4.5.26
	clap_derive@4.5.13
	clap_lex@0.7.2
	clap_mangen@0.2.23
	colorchoice@1.0.2
	coolor@1.0.0
	crokey@1.1.0
	crokey-proc_macros@1.1.0
	crossbeam@0.8.4
	crossbeam-channel@0.5.13
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.20
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	doc-comment@0.3.3
	equivalent@1.0.1
	errno@0.3.9
	file-size@1.0.3
	hashbrown@0.14.5
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.3.9
	indexmap@2.5.0
	is_terminal_polyfill@1.70.1
	itoa@1.0.11
	lazy-regex@3.3.0
	lazy-regex-proc_macros@3.3.0
	lfs-core@0.11.2
	libc@0.2.158
	linux-raw-sys@0.4.14
	lock_api@0.4.12
	log@0.4.22
	memchr@2.7.4
	minimad@0.13.1
	mio@1.0.2
	nix@0.29.0
	once_cell@1.19.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	proc-macro2@1.0.86
	quote@1.0.37
	redox_syscall@0.5.3
	regex@1.10.6
	regex-automata@0.4.7
	regex-syntax@0.8.4
	roff@0.2.2
	rustix@0.38.36
	ryu@1.0.18
	scopeguard@1.2.0
	serde@1.0.210
	serde_derive@1.0.210
	serde_json@1.0.128
	serde_spanned@0.6.7
	signal-hook@0.3.17
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	smallvec@1.13.2
	snafu@0.7.5
	snafu-derive@0.7.5
	strict@0.2.0
	strsim@0.11.1
	syn@1.0.109
	syn@2.0.77
	termimad@0.30.0
	terminal-light@1.5.0
	thiserror@1.0.63
	thiserror-impl@1.0.63
	toml@0.7.8
	toml_datetime@0.6.8
	toml_edit@0.19.15
	unicode-ident@1.0.12
	unicode-width@0.1.13
	utf8parse@0.2.2
	wasi@0.11.0+wasi-snapshot-preview1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.52.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	winnow@0.5.40
	xterm-query@0.4.1
"

inherit cargo

DESCRIPTION="A linux utility to get information on filesystems, like df but better"
HOMEPAGE="https://dystroy.org/dysk/"
SRC_URI="
	https://github.com/Canop/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0 MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_FLAGS_IGNORED="usr/bin/${PN}"
