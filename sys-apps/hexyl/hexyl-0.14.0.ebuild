# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.0.4
	anstream@0.3.2
	anstyle@1.0.1
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@1.0.2
	anyhow@1.0.75
	assert_cmd@2.0.12
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.4.0
	bstr@1.6.0
	cc@1.0.83
	clap@4.3.23
	clap_builder@4.3.23
	clap_lex@0.5.0
	colorchoice@1.0.0
	const_format@0.2.31
	const_format_proc_macros@0.2.31
	diff@0.1.13
	difflib@0.4.0
	doc-comment@0.3.3
	either@1.9.0
	errno@0.3.2
	errno-dragonfly@0.1.2
	float-cmp@0.9.0
	hermit-abi@0.3.2
	io-lifetimes@1.0.11
	is-terminal@0.4.9
	is_ci@1.1.1
	itertools@0.10.5
	libc@0.2.147
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.5
	memchr@2.5.0
	normalize-line-endings@0.3.0
	num-traits@0.2.16
	once_cell@1.18.0
	owo-colors@3.5.0
	predicates@3.0.3
	predicates-core@1.0.6
	predicates-tree@1.0.9
	pretty_assertions@1.4.0
	proc-macro2@1.0.66
	quote@1.0.33
	regex@1.9.3
	regex-automata@0.3.6
	regex-syntax@0.7.4
	rustix@0.37.23
	rustix@0.38.8
	serde@1.0.185
	strsim@0.10.0
	supports-color@2.0.0
	syn@2.0.29
	terminal_size@0.2.6
	termtree@0.4.1
	thiserror@1.0.47
	thiserror-impl@1.0.47
	unicode-ident@1.0.11
	unicode-xid@0.2.4
	utf8parse@0.2.1
	wait-timeout@0.2.0
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
	yansi@0.5.1
"

inherit cargo

DESCRIPTION="A command-line hex viewer"
HOMEPAGE="https://github.com/sharkdp/hexyl"
SRC_URI="
	https://github.com/sharkdp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0 ISC MIT Unicode-DFS-2016 ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_FLAGS_IGNORED="usr/bin/${PN}"
