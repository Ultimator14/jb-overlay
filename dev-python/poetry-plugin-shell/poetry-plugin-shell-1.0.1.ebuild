# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_1{0,1,2} )

inherit distutils-r1

MY_PN="poetry_plugin_shell"
S="${WORKDIR}/${MY_PN}-${PV}"

DESCRIPTION="Poetry plugin to run subshell with virtual environment activated"
HOMEPAGE="https://github.com/python-poetry/poetry-plugin-shell"

SRC_URI="
	https://github.com/python-poetry/${PN}/releases/download/${PV}/${MY_PN}-${PV}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/poetry-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pexpect-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.5.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
