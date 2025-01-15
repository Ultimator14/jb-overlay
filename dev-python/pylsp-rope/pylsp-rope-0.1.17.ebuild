# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1

DESCRIPTION="Extended refactoring capabilities for python-lsp-server using Rope"
HOMEPAGE="
	https://github.com/python-rope/pylsp-rope
	https://pypi.org/project/pylsp-rope/
"
SRC_URI="
	https://github.com/python-rope/${PN}/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-python/python-lsp-server[${PYTHON_USEDEP}]
	dev-python/rope[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
