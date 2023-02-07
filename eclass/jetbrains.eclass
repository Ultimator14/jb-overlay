# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: jetbrains.eclass
# @MAINTAINER:
# jan.breig@freenet.de
# @BLURB: Eclass that bundles jetbrains applications

case "${EAPI:-0}" in
    6|7)
        ;;
    *)
        die "${ECLASS}: Unsupported eapi (EAPI=${EAPI})"
        ;;
esac

inherit desktop eutils

HOMEPAGE="https://www.jetbrains.com/${JB_HOMEPAGE}"
SRC_URI="https://download.jetbrains.com/${JB_SRC_URI}.tar.gz"

SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="+bundled-jre"
RESTRICT="mirror"

RDEPEND="!bundled-jre? ( >=virtual/jre-1.8 )
dev-libs/libdbusmenu"

BDEPEND="dev-util/patchelf"

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
	[[ -z "${1}" || -z "${2}" ]] && die "use_rm: Invalid argument, usage: use_rm <useflag> <path to delete>"
	if use "${1}"; then
		# suppress prompt with --interactive=never flag rather than with -f
		# because -f does not throw error if file doesn't exist
		rm -r --interactive=never ${2} || die
	fi
}

# @FUNCTION: use_mkexec
# @USAGE: use_mkexec(<useflag>, <path to make executable>)
# @DESCRIPTION:
# Check if the given use flag is set and if so, make the given files or directories executable
use_mkexec() {
	[[ -z "${1}" || -z "${2}" ]] && die "use_mkexec: Invalid argument, usage: use_mkexec <useflag> <path to make executable>"
	if use "${1}"; then
		for p in ${@:2}
		do
			fperms 755 /opt/${PN}/${p} || die
		done
	fi
}

EXPORT_FUNCTIONS src_prepare src_install

# @FUNCTION jetbrains_src_prepare
# @DESCRIPTION
# Remove bundled jre if necessary
jetbrains_src_prepare() {
	default

	use_rm !bundled-jre jbr

	# patch java files
	if use bundled-jre; then
		patchelf --set-rpath '$ORIGIN' jbr/lib/jcef_helper || die
		patchelf --set-rpath '$ORIGIN' jbr/lib/libjcef.so || die
	fi
}

# @FUNCTION: jetbrains_src_install
# @DESCRIPTION:
# Installs applications
jetbrains_src_install() {
	insinto "/opt/${PN}"
	doins -r .
	fperms 755 /opt/${PN}/bin/{${JB_MAJOR_PN}.sh,format.sh,fsnotifier,inspect.sh,ltedit.sh,restart.py,repair,restart.py} || die

	use_mkexec bundled-jre jbr/bin/{java,javac,javadoc,jcmd,jdb,jfr,jhsdb,jinfo,jmap,jps,jrunscript,jstack,jstat,keytool,rmiregistry,serialver}
	use_mkexec bundled-jre jbr/lib/{chrome-sandbox,jcef_helper,jexec,jspawnhelper}

	make_wrapper "${PN}" "/opt/${PN}/bin/${JB_MAJOR_PN}.sh"
	newicon "bin/${JB_MAJOR_PN}.svg" "${PN}.svg"
	make_desktop_entry "${PN} %f" "${JB_PRETTY_PN}" "${PN}" "Development;IDE;"
}
