# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Create CRATES variable with
# cargo metadata | jq -r '.packages[]|"\(.name)-\(.version)"'
CRATES="
adler-1.0.2
ahash-0.8.3
aho-corasick-1.0.1
android_system_properties-0.1.5
anstream-0.3.2
anstyle-1.0.0
anstyle-parse-0.2.0
anstyle-query-1.0.0
anstyle-wincon-1.0.1
arrayref-0.3.7
arrayvec-0.7.2
atty-0.2.14
autocfg-1.1.0
az-1.2.1
base64-0.21.0
biblatex-0.8.0
bincode-1.3.3
bit-set-0.5.3
bit-vec-0.6.3
bitflags-1.3.2
bitflags-2.3.1
bitvec-1.0.1
bumpalo-3.13.0
bytemuck-1.13.1
byteorder-1.4.3
cc-1.0.79
cfg-if-1.0.0
chinese-number-0.7.2
chinese-variant-1.0.9
chrono-0.4.24
clap-3.2.25
clap-4.2.7
clap_builder-4.2.7
clap_complete-4.2.3
clap_derive-4.2.0
clap_lex-0.2.4
clap_lex-0.4.1
clap_mangen-0.2.10
cobs-0.2.3
codespan-reporting-0.11.1
color_quant-1.1.0
colorchoice-1.0.0
comemo-0.3.0
comemo-macros-0.3.0
core-foundation-sys-0.8.4
crc32fast-1.3.2
crossbeam-channel-0.5.8
crossbeam-deque-0.8.3
crossbeam-epoch-0.9.14
crossbeam-utils-0.8.15
csv-1.2.1
csv-core-0.1.10
dashmap-5.4.0
data-url-0.2.0
dirs-5.0.1
dirs-sys-0.4.1
displaydoc-0.2.4
ecow-0.1.1
either-1.8.1
enum-ordinalize-3.1.13
env_logger-0.10.0
errno-0.3.1
errno-dragonfly-0.1.2
fancy-regex-0.7.1
fastrand-1.9.0
fdeflate-0.3.0
filetime-0.2.21
flate2-1.0.26
float-cmp-0.9.0
fnv-1.0.7
fontdb-0.13.1
form_urlencoded-1.1.0
fsevent-sys-4.1.0
funty-2.0.0
getopts-0.2.21
getrandom-0.2.9
gif-0.12.0
glob-0.3.1
hashbrown-0.12.3
hayagriva-0.3.0
heck-0.4.1
hermit-abi-0.1.19
hermit-abi-0.2.6
hermit-abi-0.3.1
hypher-0.1.1
iai-0.1.1
iana-time-zone-0.1.56
iana-time-zone-haiku-0.1.2
icu_collections-1.2.0
icu_locid-1.2.0
icu_properties-1.2.0
icu_provider-1.2.0
icu_provider_adapters-1.2.0
icu_provider_blob-1.2.0
icu_provider_macros-1.2.0
icu_segmenter-1.2.1
idna-0.3.0
if_chain-1.0.2
image-0.24.6
imagesize-0.11.0
include_dir-0.7.3
include_dir_macros-0.7.3
indexmap-1.9.3
inferno-0.11.15
inotify-0.9.6
inotify-sys-0.1.5
instant-0.1.12
io-lifetimes-1.0.10
is-docker-0.2.0
is-terminal-0.4.7
is-wsl-0.4.0
isolang-2.3.0
itertools-0.10.5
itoa-1.0.6
jpeg-decoder-0.3.0
js-sys-0.3.63
kqueue-1.0.7
kqueue-sys-1.0.3
kurbo-0.9.5
lazy_static-1.4.0
libc-0.2.144
libdeflate-sys-0.11.0
libdeflater-0.11.0
libm-0.2.7
linked-hash-map-0.5.6
linux-raw-sys-0.3.7
lipsum-0.9.0
litemap-0.7.0
lock_api-0.4.9
log-0.4.17
memchr-2.5.0
memmap2-0.5.10
memoffset-0.8.0
miniz_oxide-0.7.1
mio-0.8.6
notify-5.2.0
nu-ansi-term-0.46.0
num-bigint-0.4.3
num-format-0.4.4
num-integer-0.1.45
num-rational-0.4.1
num-traits-0.2.15
num_cpus-1.15.0
numerals-0.1.4
once_cell-1.17.1
open-4.1.0
option-ext-0.2.0
os_str_bytes-6.5.0
overload-0.1.1
oxipng-8.0.0
parking_lot_core-0.9.7
paste-1.0.12
pathdiff-0.2.1
pdf-writer-0.7.1
percent-encoding-2.2.0
phf-0.11.1
phf_shared-0.11.1
pico-args-0.5.0
pin-project-lite-0.2.9
pixglyph-0.1.0
png-0.17.8
postcard-1.0.4
ppv-lite86-0.2.17
proc-macro2-1.0.58
psm-0.1.21
pulldown-cmark-0.9.2
quick-xml-0.26.0
quote-1.0.27
radium-0.7.0
rand-0.8.5
rand_chacha-0.3.1
rand_core-0.6.4
rayon-1.7.0
rayon-core-1.11.0
rctree-0.5.0
redox_syscall-0.2.16
redox_syscall-0.3.5
redox_users-0.4.3
regex-1.8.1
regex-syntax-0.6.29
regex-syntax-0.7.1
resvg-0.32.0
rgb-0.8.36
ring-0.16.20
roff-0.2.1
rosvgtree-0.3.0
roxmltree-0.18.0
rustc-hash-1.1.0
rustc_version-0.4.0
rustix-0.37.19
rustls-0.21.2
rustls-webpki-0.100.1
rustversion-1.0.12
rustybuzz-0.7.0
ryu-1.0.13
same-file-1.0.6
scopeguard-1.1.0
sct-0.7.0
semver-1.0.17
serde-1.0.163
serde_derive-1.0.163
serde_json-1.0.96
serde_spanned-0.6.2
serde_yaml-0.8.26
sharded-slab-0.1.4
simd-adler32-0.3.5
simplecss-0.2.1
siphasher-0.3.10
slotmap-1.0.6
smallvec-1.10.0
spin-0.5.2
stable_deref_trait-1.2.0
stacker-0.1.15
stderrlog-0.5.4
str_stack-0.1.0
strict-num-0.1.0
strsim-0.10.0
strum-0.24.1
strum_macros-0.24.3
subsetter-0.1.1
svg2pdf-0.4.1
svgtypes-0.11.0
syn-1.0.109
syn-2.0.16
synstructure-0.12.6
syntect-5.0.0
tap-1.0.1
tar-0.4.38
tempfile-3.5.0
termcolor-1.1.3
textwrap-0.16.0
thiserror-1.0.40
thiserror-impl-1.0.40
thread_local-1.1.7
time-0.3.21
time-core-0.1.1
time-macros-0.2.9
tiny-skia-0.9.1
tiny-skia-path-0.9.0
tinystr-0.7.1
tinyvec-1.6.0
tinyvec_macros-0.1.1
toml-0.7.4
toml_datetime-0.6.2
toml_edit-0.19.9
tracing-0.1.37
tracing-attributes-0.1.24
tracing-core-0.1.31
tracing-error-0.2.0
tracing-flame-0.2.0
tracing-log-0.1.3
tracing-subscriber-0.3.17
ttf-parser-0.18.1
typed-arena-2.0.2
unic-langid-0.9.1
unic-langid-impl-0.9.1
unicase-2.6.0
unicode-bidi-0.3.13
unicode-bidi-mirroring-0.1.0
unicode-ccc-0.1.2
unicode-general-category-0.6.0
unicode-ident-1.0.8
unicode-math-class-0.1.0
unicode-normalization-0.1.22
unicode-script-0.5.5
unicode-segmentation-1.10.1
unicode-vo-0.1.0
unicode-width-0.1.10
unicode-xid-0.2.4
unicode_names2-0.6.0
unscanny-0.1.0
untrusted-0.7.1
ureq-2.7.1
url-2.3.1
usvg-0.32.0
usvg-parser-0.32.0
usvg-text-layout-0.32.0
usvg-tree-0.32.0
utf8_iter-1.0.3
utf8parse-0.2.1
valuable-0.1.0
version_check-0.9.4
walkdir-2.3.3
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.86
wasm-bindgen-backend-0.2.86
wasm-bindgen-macro-0.2.86
wasm-bindgen-macro-support-0.2.86
wasm-bindgen-shared-0.2.86
web-sys-0.3.63
webpki-roots-0.23.1
weezl-0.1.7
wild-2.1.0
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
windows-0.48.0
windows-sys-0.45.0
windows-sys-0.48.0
windows-targets-0.42.2
windows-targets-0.48.0
windows_aarch64_gnullvm-0.42.2
windows_aarch64_gnullvm-0.48.0
windows_aarch64_msvc-0.42.2
windows_aarch64_msvc-0.48.0
windows_i686_gnu-0.42.2
windows_i686_gnu-0.48.0
windows_i686_msvc-0.42.2
windows_i686_msvc-0.48.0
windows_x86_64_gnu-0.42.2
windows_x86_64_gnu-0.48.0
windows_x86_64_gnullvm-0.42.2
windows_x86_64_gnullvm-0.48.0
windows_x86_64_msvc-0.42.2
windows_x86_64_msvc-0.48.0
winnow-0.4.6
writeable-0.5.2
wyz-0.5.1
xattr-0.2.3
xmlparser-0.13.5
xmlwriter-0.1.0
xmp-writer-0.1.0
yaml-front-matter-0.1.0
yaml-rust-0.4.5
yoke-0.7.1
yoke-derive-0.7.1
zerofrom-0.1.2
zerofrom-derive-0.1.2
zerovec-0.9.4
zerovec-derive-0.9.4
zopfli-0.7.2
"

declare -A GIT_CRATES=(
	[svg2pdf]="https://github.com/typst/svg2pdf;35f4bb87fb677473661c6d12919e01a6d64a716d"
	[iai]="https://github.com/reknih/iai;3f0f92736408ebce6545808b98e0cb2aea89b7dd"
)

inherit cargo

DESCRIPTION="A new markup-based typesetting system that is powerful and easy to learn"
HOMEPAGE="https://typst.app"
SRC_URI="
	https://github.com/typst/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror"

src_compile() {
	# Enable generation of shell completions and man pages
	export GEN_ARTIFACTS=./

	cargo_src_compile
}
src_install() {
	# Typst binary
	exeinto /usr/bin
	doexe target/release/${PN}

	# Man pages
	doman cli/${PN}*.1

	# Completions
	insinto /usr/share/zsh/site-functions
	doins cli/_${PN}

	insinto /usr/share/fish/vendor_completions.d
	doins cli/${PN}.fish

	insinto /usr/share/bash-completion/completions
	doins cli/${PN}.bash
}
