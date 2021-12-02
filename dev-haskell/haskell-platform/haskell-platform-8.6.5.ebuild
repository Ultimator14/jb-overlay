# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The Haskell Platform"
HOMEPAGE="http://haskell.org/platform"
SRC_URI=""

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+doc profile +X"

RDEPEND="
	>=dev-lang/ghc-8.6.5:=[profile?]

	>=dev-haskell/cabal-2.4.0.1:=[profile?]
	>=dev-haskell/mtl-2.2.2:=[profile?]
	>=dev-haskell/parsec-3.1.13.0:=[profile?]
	>=dev-haskell/stm-2.4.5.0:=[profile?]
	>=dev-haskell/text-1.2.3.1:=[profile?]
	>=dev-haskell/transformers-0.5.6.2:=[profile?]
	>=dev-haskell/xhtml-3000.2.2.1:=[profile?]


	>=dev-haskell/alex-3.2.4
	>=dev-haskell/happy-1.19.9

	>=dev-haskell/hscolour-1.24.4:=[profile?]
	doc? ( >=dev-haskell/haddock-2.21.0 )
	>=dev-haskell/cabal-install-2.4.1.0
	>=dev-haskell/stack-1.9.3:=[profile?]

	>=dev-haskell/async-2.2.1:=[profile?]
	>=dev-haskell/attoparsec-0.13.2.2:=[profile?]
	>=dev-haskell/case-insensitive-1.2.0.11:=[profile?]
	>=dev-haskell/fgl-5.7.0.1:=[profile?]
	X? (
		>=dev-haskell/glut-2.7.0.14:=[profile?]
		>=dev-haskell/gluraw-2.0.0.4:=[profile?]
	)
	>=dev-haskell/haskell-src-1.0.3.0:=[profile?]
	>=dev-haskell/hashable-1.2.7.0:=[profile?]
	>=dev-haskell/html-1.0.1.2:=[profile?]
	>=dev-haskell/http-4000.3.12:=[profile?]
	>=dev-haskell/hunit-1.6.0.0:=[profile?]
	>=dev-haskell/network-2.8.0.0:=[profile?]
	X? (
		>=dev-haskell/opengl-3.0.2.2:=[profile?]
		>=dev-haskell/openglraw-3.3.1.1:=[profile?]
	)
	>=dev-haskell/parallel-3.2.2.0:=[profile?]
	>=dev-haskell/regex-base-0.93.2:=[profile?]
	>=dev-haskell/regex-compat-0.95.1:=[profile?]
	>=dev-haskell/regex-posix-0.95.2:=[profile?]
	>=dev-haskell/split-0.2.3.3:=[profile?]
	>=dev-haskell/syb-0.7:=[profile?]
	>=dev-haskell/unordered-containers-0.2.9.0:=[profile?]
	>=dev-haskell/vector-0.12.0.1:=[profile?]
	>=dev-haskell/zlib-0.6.2:=[profile?]

	>=dev-haskell/primitive-0.6.4.0:=[profile?]
	>=dev-haskell/random-1.1:=[profile?]
	>=dev-haskell/quickcheck-2.12.6.1:=[profile?]

	>=dev-haskell/tf-random-0.5:=[profile?]

	>=dev-haskell/network-uri-2.6.1.0:=[profile?]

	>=dev-haskell/scientific-0.3.6.2:=[profile?]
	>=dev-haskell/integer-logarithms-1.0.2.2:=[profile?]

	>=dev-haskell/objectname-1.1.0.1:=[profile?]
	>=dev-haskell/statevar-1.1.1.1:=[profile?]
	>=dev-haskell/half-0.3:=[profile?]
	>=dev-haskell/fixed-0.2.1.1:=[profile?]

	>=dev-haskell/call-stack-0.1.0:=[profile?]
"
DEPEND="${RDEPEND}"

pkg_postinst() {
	if ! use X; then
		elog "The haskell platform includes the 3D graphics libraries opengl and glut."
		elog "To install opengl and glut requires the X use flag."
	fi
}
