# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	aead@0.5.2
	aes@0.8.4
	aes-gcm@0.10.3
	anstream@0.6.15
	anstyle@1.0.8
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anyhow@1.0.90
	arc-swap@1.7.1
	autocfg@1.4.0
	backtrace@0.3.74
	base64@0.21.7
	base64@0.22.1
	bitflags@2.6.0
	block-buffer@0.10.4
	byteorder@1.5.0
	bytes@1.8.0
	cc@1.1.31
	cfg-if@1.0.0
	chacha20@0.9.1
	chacha20poly1305@0.10.1
	cipher@0.4.4
	clap@4.5.20
	clap_builder@4.5.20
	clap_lex@0.7.2
	colorchoice@1.0.2
	cpufeatures@0.2.14
	crypto-common@0.1.6
	ct-codecs@1.1.2
	ctr@0.9.2
	curve25519-dalek@4.1.3
	curve25519-dalek-derive@0.1.1
	digest@0.10.7
	dnsstamps@0.1.9
	equivalent@1.0.1
	errno@0.3.9
	fiat-crypto@0.2.9
	fnv@1.0.7
	futures@0.3.31
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	generic-array@0.14.7
	getrandom@0.2.15
	ghash@0.5.1
	gimli@0.31.1
	h2@0.3.26
	hashbrown@0.15.0
	hermit-abi@0.3.9
	hkdf@0.12.4
	hmac@0.12.1
	hpke@0.11.0
	http@0.2.12
	http-body@0.4.6
	httparse@1.9.5
	httpdate@1.0.3
	hyper@0.14.31
	indexmap@2.6.0
	inout@0.1.3
	is_terminal_polyfill@1.70.1
	itoa@1.0.11
	libc@0.2.161
	libmimalloc-sys@0.1.39
	linux-raw-sys@0.4.14
	log@0.4.22
	memchr@2.7.4
	mimalloc@0.1.43
	miniz_oxide@0.8.0
	mio@1.0.2
	object@0.36.5
	odoh-rs@1.0.3
	once_cell@1.20.2
	opaque-debug@0.3.1
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	poly1305@0.8.0
	polyval@0.6.2
	ppv-lite86@0.2.20
	proc-macro2@1.0.88
	quote@1.0.37
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	ring@0.17.8
	rustc-demangle@0.1.24
	rustc_version@0.4.1
	rustix@0.38.37
	rustls@0.21.12
	rustls-pemfile@1.0.4
	rustls-webpki@0.101.7
	sct@0.7.1
	semver@1.0.23
	sha2@0.10.8
	shlex@1.3.0
	slab@0.4.9
	socket2@0.5.7
	spin@0.9.8
	strsim@0.11.1
	subtle@2.6.1
	syn@2.0.82
	terminal_size@0.4.0
	thiserror@1.0.64
	thiserror-impl@1.0.64
	tokio@1.41.0
	tokio-rustls@0.24.1
	tokio-util@0.7.12
	tower-service@0.3.3
	tracing@0.1.40
	tracing-core@0.1.32
	try-lock@0.2.5
	typenum@1.17.0
	unicode-ident@1.0.13
	universal-hash@0.5.1
	untrusted@0.9.0
	utf8parse@0.2.2
	version_check@0.9.5
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	x25519-dalek@2.0.1
	zerocopy@0.7.35
	zerocopy-derive@0.7.35
	zeroize@1.8.1
	zeroize_derive@1.4.2
"

inherit cargo

DESCRIPTION="Fast, mature, secure DoH and ODoH server proxy written in Rust"
HOMEPAGE="https://github.com/DNSCrypt/doh-server"
SRC_URI="
	https://github.com/DNSCrypt/doh-server/archive/${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0 BSD BSD-2 ISC MIT ring Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tls"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_configure() {
	# Conditionally disable tls support via --no-default-features
	if ! use tls; then
		cargo_src_configure --no-default-features
	fi
}
