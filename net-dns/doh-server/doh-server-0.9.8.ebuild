# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Create CRATES variable with
# cargo metadata | jq -r '.packages[]|"\(.name)-\(.version)"'
CRATES="
aead-0.5.1
aes-0.8.2
aes-gcm-0.10.1
anyhow-1.0.70
arc-swap-1.6.0
autocfg-1.1.0
base64-0.21.0
bitflags-1.3.2
bitflags-2.0.2
block-buffer-0.10.4
bumpalo-3.12.0
byteorder-1.4.3
bytes-1.4.0
cc-1.0.79
cfg-if-1.0.0
chacha20-0.9.0
chacha20poly1305-0.10.1
cipher-0.4.4
clap-4.1.11
clap_lex-0.3.3
cpufeatures-0.2.5
crypto-common-0.1.6
ct-codecs-1.1.1
ctr-0.9.2
curve25519-dalek-3.2.0
digest-0.9.0
digest-0.10.6
dnsstamps-0.1.9
doh-proxy-0.9.8
errno-0.2.8
errno-dragonfly-0.1.2
fnv-1.0.7
futures-0.3.27
futures-channel-0.3.27
futures-core-0.3.27
futures-executor-0.3.27
futures-io-0.3.27
futures-macro-0.3.27
futures-sink-0.3.27
futures-task-0.3.27
futures-util-0.3.27
generic-array-0.14.6
getrandom-0.2.8
ghash-0.5.0
h2-0.3.16
hashbrown-0.12.3
hermit-abi-0.2.6
hermit-abi-0.3.1
hkdf-0.12.3
hmac-0.12.1
hpke-0.10.0
http-0.2.9
http-body-0.4.5
httparse-1.8.0
httpdate-1.0.2
hyper-0.14.25
indexmap-1.9.2
inout-0.1.3
io-lifetimes-1.0.9
is-terminal-0.4.5
itoa-1.0.6
js-sys-0.3.61
libc-0.2.140
libdoh-0.9.8
libmimalloc-sys-0.1.30
linux-raw-sys-0.1.4
log-0.4.17
memchr-2.5.0
mimalloc-0.1.34
mio-0.8.6
num_cpus-1.15.0
odoh-rs-1.0.1
once_cell-1.17.1
opaque-debug-0.3.0
os_str_bytes-6.5.0
pin-project-lite-0.2.9
pin-utils-0.1.0
poly1305-0.8.0
polyval-0.6.0
ppv-lite86-0.2.17
proc-macro2-1.0.53
quote-1.0.26
rand-0.8.5
rand_chacha-0.3.1
rand_core-0.5.1
rand_core-0.6.4
ring-0.16.20
rustix-0.36.11
rustls-0.20.8
rustls-pemfile-1.0.2
sct-0.7.0
sha2-0.10.6
slab-0.4.8
socket2-0.4.9
spin-0.5.2
strsim-0.10.0
subtle-2.4.1
syn-1.0.109
syn-2.0.8
synstructure-0.12.6
termcolor-1.2.0
terminal_size-0.2.5
thiserror-1.0.40
thiserror-impl-1.0.40
tokio-1.26.0
tokio-rustls-0.23.4
tokio-util-0.7.7
tower-service-0.3.2
tracing-0.1.37
tracing-core-0.1.30
try-lock-0.2.4
typenum-1.16.0
unicode-ident-1.0.8
unicode-xid-0.2.4
universal-hash-0.5.0
untrusted-0.7.1
version_check-0.9.4
want-0.3.0
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.84
wasm-bindgen-backend-0.2.84
wasm-bindgen-macro-0.2.84
wasm-bindgen-macro-support-0.2.84
wasm-bindgen-shared-0.2.84
web-sys-0.3.61
webpki-0.22.0
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.45.0
windows-targets-0.42.2
windows_aarch64_gnullvm-0.42.2
windows_aarch64_msvc-0.42.2
windows_i686_gnu-0.42.2
windows_i686_msvc-0.42.2
windows_x86_64_gnu-0.42.2
windows_x86_64_gnullvm-0.42.2
windows_x86_64_msvc-0.42.2
x25519-dalek-2.0.0-pre.1
zeroize-1.5.7
zeroize_derive-1.3.3
"

inherit cargo

DESCRIPTION="Fast, mature, secure DoH and ODoH server proxy written in Rust"
HOMEPAGE="https://github.com/DNSCrypt/doh-server"
SRC_URI="
	https://github.com/DNSCrypt/doh-server/archive/${PV}.tar.gz
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