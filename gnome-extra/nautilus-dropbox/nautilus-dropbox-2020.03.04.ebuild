# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_6 python3_7 )

inherit autotools python-r1

DESCRIPTION="Dropbox Integration for Nautilus "
HOMEPAGE="https://github.com/dropbox/nautilus-dropbox"
SRC_URI="https://github.com/dropbox/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	gnome-base/nautilus
	net-misc/dropbox"
DEPEND="${RDEPEND}
	dev-python/docutils[${PYTHON_USEDEP}]
	virtual/pkgconfig"

pkg_setup() {
	DOC_CONTENTS="Add any users who wish to have access to the dropbox nautilus
plugin to the group 'dropbox'. You need to setup a drobox account
before using this plugin. Visit ${HOMEPAGE} for more information."

	python_setup
}

src_prepare() {
	# use system dropbox
	sed -e "s|\"%s/\.dropbox-dist\" % PARENT_DIR|\"${EPREFIX}/opt/dropbox\"|" \
 		-i dropbox.in || die

	default

	eautoreconf
}

src_install() {
	local extensiondir="$(pkg-config --variable=extensiondir libnautilus-extension)"
	[ -z ${extensiondir} ] && die "pkg-config unable to get nautilus extensions dir"

	default
	rm -f "${D}"/"${extensiondir}"/libnautilus-dropbox.a || die
	rm -f "${D}"/"${extensiondir}"/libnautilus-dropbox.la || die

	python_replicate_script "${ED}"/usr/bin/dropbox
}
