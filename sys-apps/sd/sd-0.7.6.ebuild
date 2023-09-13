# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.0.4
	ansi_term@0.12.1
	anstream@0.5.0
	anstyle@1.0.1
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@2.1.0
	anyhow@1.0.75
	assert_cmd@2.0.12
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.4.0
	bstr@1.6.0
	cc@1.0.82
	cfg-if@1.0.0
	clap@4.4.2
	clap_builder@4.4.2
	clap_complete@4.4.0
	clap_derive@4.4.2
	clap_lex@0.5.0
	colorchoice@1.0.0
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-utils@0.8.16
	difflib@0.4.0
	doc-comment@0.3.3
	either@1.9.0
	errno@0.3.2
	errno-dragonfly@0.1.2
	fastrand@2.0.0
	fnv@1.0.7
	globset@0.4.13
	globwalk@0.8.1
	heck@0.4.1
	hermit-abi@0.3.2
	ignore@0.4.20
	io-lifetimes@1.0.11
	is-terminal@0.4.9
	itertools@0.10.5
	lazy_static@1.4.0
	libc@0.2.147
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.5
	log@0.4.20
	man@0.3.0
	memchr@2.6.3
	memmap2@0.7.1
	memoffset@0.9.0
	num_cpus@1.16.0
	once_cell@1.18.0
	predicates@3.0.3
	predicates-core@1.0.6
	predicates-tree@1.0.9
	proc-macro2@1.0.66
	quote@1.0.33
	rayon@1.7.0
	rayon-core@1.11.0
	redox_syscall@0.3.5
	regex@1.9.5
	regex-automata@0.3.8
	regex-syntax@0.7.5
	roff@0.1.0
	rustix@0.37.23
	rustix@0.38.8
	same-file@1.0.6
	scopeguard@1.2.0
	serde@1.0.183
	strsim@0.10.0
	syn@2.0.29
	tempfile@3.8.0
	terminal_size@0.2.6
	termtree@0.4.1
	thiserror@1.0.48
	thiserror-impl@1.0.48
	thread_local@1.1.7
	unescape@0.1.0
	unicode-ident@1.0.11
	utf8parse@0.2.1
	wait-timeout@0.2.0
	walkdir@2.3.3
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.48.0
	windows-targets@0.48.1
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.48.0
"

inherit cargo

DESCRIPTION="An intuitive find & replace CLI"
HOMEPAGE="https://github.com/chmln/sd.git"
SRC_URI="

	${CARGO_CRATE_URIS}
"

LICENSE="MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_FLAGS_IGNORED="usr/bin/${PN}"
