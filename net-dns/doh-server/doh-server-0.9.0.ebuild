# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Create CRATES variable with
# cargo metadata | jq -r '.packages[]|"\(.name)-\(.version)"'
CRATES="
aead-0.3.2
aes-0.6.0
aes-gcm-0.8.0
aes-soft-0.6.4
aesni-0.10.0
ansi_term-0.12.1
anyhow-1.0.53
arc-swap-1.5.0
atty-0.2.14
autocfg-1.0.1
base64-0.13.0
bitflags-1.3.2
bitvec-0.18.5
block-buffer-0.9.0
bumpalo-3.9.1
byteorder-1.4.3
bytes-1.1.0
cc-1.0.72
cfg-if-1.0.0
chacha20-0.6.0
chacha20poly1305-0.7.1
cipher-0.2.5
clap-2.34.0
cpufeatures-0.2.1
cpuid-bool-0.2.0
crypto-mac-0.10.1
ct-codecs-1.1.1
ctr-0.6.0
curve25519-dalek-3.2.0
digest-0.9.0
dnsstamps-0.1.9
doh-proxy-0.9.0
elliptic-curve-0.8.5
ff-0.8.0
fnv-1.0.7
fs_extra-1.2.0
funty-1.1.0
futures-0.3.19
futures-channel-0.3.19
futures-core-0.3.19
futures-executor-0.3.19
futures-io-0.3.19
futures-macro-0.3.19
futures-sink-0.3.19
futures-task-0.3.19
futures-util-0.3.19
generic-array-0.14.5
getrandom-0.2.4
ghash-0.3.1
group-0.8.0
h2-0.3.10
hashbrown-0.11.2
hermit-abi-0.1.19
hkdf-0.10.0
hmac-0.10.1
hpke-0.5.1
http-0.2.6
http-body-0.4.4
httparse-1.5.1
httpdate-1.0.2
hyper-0.14.16
indexmap-1.8.0
instant-0.1.12
itoa-0.4.8
itoa-1.0.1
jemalloc-sys-0.3.2
jemallocator-0.3.2
js-sys-0.3.56
lazy_static-1.4.0
libc-0.2.113
libdoh-0.9.0
lock_api-0.4.5
log-0.4.14
memchr-2.4.1
mio-0.7.14
miow-0.3.7
ntapi-0.3.6
num_cpus-1.13.1
odoh-rs-1.0.0-alpha.1
once_cell-1.9.0
opaque-debug-0.3.0
p256-0.7.3
parking_lot-0.11.2
parking_lot_core-0.8.5
pin-project-lite-0.2.8
pin-utils-0.1.0
poly1305-0.6.2
polyval-0.4.5
ppv-lite86-0.2.16
proc-macro2-1.0.36
quote-1.0.15
radium-0.3.0
rand-0.8.4
rand_chacha-0.3.1
rand_core-0.5.1
rand_core-0.6.3
rand_hc-0.3.1
redox_syscall-0.2.10
ring-0.16.20
rustls-0.19.1
scopeguard-1.1.0
sct-0.6.1
sha2-0.9.9
slab-0.4.5
smallvec-1.8.0
spin-0.5.2
strsim-0.8.0
subtle-2.4.1
syn-1.0.86
synstructure-0.12.6
textwrap-0.11.0
thiserror-1.0.30
thiserror-impl-1.0.30
tokio-1.15.0
tokio-rustls-0.22.0
tokio-util-0.6.9
tower-service-0.3.1
tracing-0.1.29
tracing-core-0.1.21
try-lock-0.2.3
typenum-1.15.0
unicode-width-0.1.9
unicode-xid-0.2.2
universal-hash-0.4.1
untrusted-0.7.1
vec_map-0.8.2
version_check-0.9.4
want-0.3.0
wasi-0.10.2+wasi-snapshot-preview1
wasm-bindgen-0.2.79
wasm-bindgen-backend-0.2.79
wasm-bindgen-macro-0.2.79
wasm-bindgen-macro-support-0.2.79
wasm-bindgen-shared-0.2.79
web-sys-0.3.56
webpki-0.21.4
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wyz-0.2.0
x25519-dalek-1.2.0
zeroize-1.3.0
zeroize_derive-1.3.1
"

inherit cargo

DESCRIPTION="Fast, mature, secure DoH and ODoH server proxy written in Rust"
HOMEPAGE="https://github.com/DNSCrypt/doh-server"
SRC_URI="
	https://github.com/DNSCrypt/doh-server/archive/refs/tags/${PV}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="tls"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	# Conditionally disable tls support via --no-default-features
	if ! use tls; then
		cargo_src_configure --no-default-features
	fi
}
