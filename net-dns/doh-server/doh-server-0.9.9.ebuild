# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aead@0.5.2
	aes@0.8.3
	aes-gcm@0.10.2
	anstream@0.5.0
	anstyle@1.0.2
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@2.1.0
	anyhow@1.0.75
	arc-swap@1.6.0
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.21.3
	bitflags@1.3.2
	block-buffer@0.10.4
	bumpalo@3.13.0
	byteorder@1.4.3
	bytes@1.4.0
	cc@1.0.83
	cfg-if@1.0.0
	chacha20@0.9.1
	chacha20poly1305@0.10.1
	cipher@0.4.4
	clap@4.4.2
	clap_builder@4.4.2
	clap_lex@0.5.1
	colorchoice@1.0.0
	cpufeatures@0.2.9
	crypto-common@0.1.6
	ct-codecs@1.1.1
	ctr@0.9.2
	curve25519-dalek@3.2.0
	digest@0.9.0
	digest@0.10.7
	dnsstamps@0.1.9
	errno@0.3.3
	errno-dragonfly@0.1.2
	fnv@1.0.7
	futures@0.3.28
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	generic-array@0.14.7
	getrandom@0.2.10
	ghash@0.5.0
	gimli@0.28.0
	h2@0.3.21
	hashbrown@0.12.3
	hermit-abi@0.3.2
	hkdf@0.12.3
	hmac@0.12.1
	hpke@0.10.0
	http@0.2.9
	http-body@0.4.5
	httparse@1.8.0
	httpdate@1.0.3
	hyper@0.14.27
	indexmap@1.9.3
	inout@0.1.3
	io-lifetimes@1.0.11
	itoa@1.0.9
	js-sys@0.3.64
	libc@0.2.147
	libmimalloc-sys@0.1.34
	linux-raw-sys@0.3.8
	log@0.4.20
	memchr@2.6.3
	mimalloc@0.1.38
	miniz_oxide@0.7.1
	mio@0.8.8
	num_cpus@1.16.0
	object@0.32.1
	odoh-rs@1.0.2
	once_cell@1.18.0
	opaque-debug@0.3.0
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	poly1305@0.8.0
	polyval@0.6.1
	ppv-lite86@0.2.17
	proc-macro2@1.0.66
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.5.1
	rand_core@0.6.4
	ring@0.16.20
	rustc-demangle@0.1.23
	rustix@0.37.23
	rustls@0.20.9
	rustls-pemfile@1.0.3
	sct@0.7.0
	sha2@0.10.7
	slab@0.4.9
	socket2@0.5.3
	spin@0.5.2
	strsim@0.10.0
	subtle@2.5.0
	syn@2.0.31
	terminal_size@0.2.6
	thiserror@1.0.48
	thiserror-impl@1.0.48
	tokio@1.32.0
	tokio-rustls@0.23.4
	tokio-util@0.7.8
	tower-service@0.3.2
	tracing@0.1.37
	tracing-core@0.1.31
	try-lock@0.2.4
	typenum@1.16.0
	unicode-ident@1.0.11
	universal-hash@0.5.1
	untrusted@0.7.1
	utf8parse@0.2.1
	version_check@0.9.4
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	web-sys@0.3.64
	webpki@0.22.1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
	x25519-dalek@2.0.0-pre.1
	zeroize@1.6.0
	zeroize_derive@1.4.2
"

inherit cargo

DESCRIPTION="Fast, mature, secure DoH and ODoH server proxy written in Rust"
HOMEPAGE="https://github.com/DNSCrypt/doh-server"
SRC_URI="
	https://github.com/DNSCrypt/doh-server/archive/${PV}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 ISC MIT Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="tls"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	# Conditionally disable tls support via --no-default-features
	if ! use tls; then
		cargo_src_configure --no-default-features
	fi
}
