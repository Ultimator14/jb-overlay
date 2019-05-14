# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: jetbrains.eclass
# @MAINTAINER:
# jan.breig@freenet.de
# @BLURB: Eclass that bundles jetbrains applications

case "${EAPI:-0}" in
    5|6|7)
        ;;
    *)
        die "${ECLASS}: Unsupported eapi (EAPI=${EAPI})"
        ;;
esac

inherit desktop eutils

HOMEPAGE="http://www.jetbrains.com/${JB_HOMEPAGE}"
SRC_URI="http://download.jetbrains.com/${JB_SRC_URI}.tar.gz"

SLOT=$(ver_cut 1)
KEYWORDS="~amd64 ~x86"
IUSE="bundled-jre"
RESTRICT="mirror"

RDEPEND="!bundled-jre? ( >=virtual/jre-1.8 )"

S="${WORKDIR}/${JB_EXTRACTED}"

# Major Package Name for combined packages like idea-community and idea-ultimate
if [ -z "${JB_MAJOR_PN}" ]; then
	JB_MAJOR_PN=${PN}
fi

# Pretty Package Name for creation of desktop files
if [ -z "${JB_PRETTY_PN}" ]; then
	JB_PRETTY_PN=${PN}
fi

# Deactivate QA because most files are pre-stripped
QA_PREBUILT="opt/${PN}/*"

# @FUNCTION: use_rm
# @USAGE: use_rm(<useflag>, <path to delete>)
# @DESCRIPTION:
# Check if the given use flag is set and if so, delete the given file or directory.
use_rm() {
	[[ -z "${1}" || -z "${2}" ]] && die "use_rm: Invalid argument, usage: use_rm <userlag> <path to delete>"
	if use "${1}"; then
		rm -rf ${2} || die
	fi
}

EXPORT_FUNCTIONS src_prepare src_install

# @FUNCTION jetbrains_src_prepare
# @DESCRIPTION
# Remove bundled jre if necessary
jetbrains_src_prepare() {
	default

	use_rm !bundled-jre jre64
	use_rm !arm bin/fsnotifier-arm
}

# @FUNCTION: jetbrains_src_install
# @DESCRIPTION:
# Installs applications
jetbrains_src_install() {
	insinto "/opt/${PN}"
	doins -r .
	fperms 755 /opt/${PN}/bin/{${JB_MAJOR_PN}.sh,fsnotifier{,64}}

	if use bundled-jre; then
		fperms 755 /opt/${PN}/jre64/bin/{java,jjs,keytool,orbd,pack200,policytool,rmid,rmiregistry,servertool,tnameserv,unpack200}
	fi

	make_wrapper "${PN}" "/opt/${PN}/bin/${JB_MAJOR_PN}.sh"
	newicon "bin/${JB_MAJOR_PN}.svg" "${PN}.svg"
	make_desktop_entry "${PN} %f" "${JB_PRETTY_PN}" "${PN}" "Development;IDE;"
}
