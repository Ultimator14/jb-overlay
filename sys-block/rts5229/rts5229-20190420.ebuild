# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/Zibri/Realtek-rts5229-linux-driver.git"
EGIT_COMMIT="55302058606438eadc7db8decb17f9e97738a7ca"
inherit git-r3 linux-mod

DESCRIPTION="Realtek card reader driver for kernel >4.4.x"
HOMEPAGE="https://github.com/Zibri/Realtek-rts5229-linux-driver"

LICENSE="none"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

MODULE_NAMES="rts5229(misc/drivers/scsi)"
BUILD_TARGETS="default"

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KERNELDIR=${KERNEL_DIR}"
}
