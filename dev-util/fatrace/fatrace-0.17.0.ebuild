# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info

DESCRIPTION="Report file access events from all running processes"
HOMEPAGE="https://launchpad.net/fatrace"
SRC_URI="https://github.com/martinpitt/${PN}/archive/${PV}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="powertop"

RDEPEND="powertop? ( sys-power/powertop )"
DEPEND=""

pkg_setup() {
	if use powertop ; then
		CONFIG_CHECK="FANOTIFY"
		check_extra_config
	fi
}

src_install() {
	dosbin fatrace

	if use powertop ; then
		dosbin power-usage-report
	fi

	doman fatrace.8
}
