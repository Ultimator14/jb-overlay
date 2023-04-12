# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Ruff plugin for the Python LSP Server"
HOMEPAGE="
	https://github.com/python-lsp/python-lsp-ruff/
	https://pypi.org/project/python-lsp-ruff/
"
SRC_URI="
	https://github.com/python-lsp/${PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-python/python-lsp-server[${PYTHON_USEDEP}]
	>=dev-util/ruff-0.0.260[${PYTHON_USEDEP}]
	>=dev-python/lsprotocol-2022.0.0_alpha1[${PYTHON_USEDEP}]
	>=dev-python/tomli-1.1.0[${PYTHON_USEDEP}]
	dev-python/cattrs[${PYTHON_USEDEP}]
"
