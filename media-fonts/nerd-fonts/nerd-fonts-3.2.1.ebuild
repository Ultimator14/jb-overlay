# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font check-reqs

DESCRIPTION="Nerd Fonts is a project that patches developer targeted fonts with glyphs"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
COMMON_URI="https://github.com/ryanoasis/${PN}/releases/download/v${PV}"

FONTS=(
	0xProto
	3270
	Agave
	AnonymousPro
	Arimo
	AurulentSansMono
	BigBlueTerminal
	BitstreamVeraSansMono
	CascadiaCode
	CascadiaMono
	CodeNewRoman
	ComicShannsMono
	CommitMono
	Cousine
	D2Coding
	DaddyTimeMono
	DejaVuSansMono
	DroidSansMono
	EnvyCodeR
	FantasqueSansMono
	FiraCode
	FiraMono
	GeistMono
	Go-Mono
	Gohu
	Hack
	Hasklig
	HeavyData
	Hermit
	iA-Writer
	IBMPlexMono
	Inconsolata
	InconsolataGo
	InconsolataLGC
	IntelOneMono
	Iosevka
	IosevkaTerm
	IosevkaTermSlab
	JetBrainsMono
	Lekton
	LiberationMono
	Lilex
	MartianMono
	Meslo
	Monaspace
	Monofur
	Monoid
	Mononoki
	MPlus
	NerdFontsSymbolsOnly
	Noto
	OpenDyslexic
	Overpass
	ProFont
	ProggyClean
	Recursive
	RobotoMono
	ShareTechMono
	SourceCodePro
	SpaceMono
	Terminus
	Tinos
	Ubuntu
	UbuntuMono
	UbuntuSans
	VictorMono
	ZedMono
)

SRC_URI="
	0xproto?                ( "${COMMON_URI}/0xProto.zip" )
	3270?                   ( "${COMMON_URI}/3270.zip" )
	agave?                  ( "${COMMON_URI}/Agave.zip" )
	anonymouspro?           ( "${COMMON_URI}/AnonymousPro.zip" )
	arimo?                  ( "${COMMON_URI}/Arimo.zip" )
	aurulentsansmono?       ( "${COMMON_URI}/AurulentSansMono.zip" )
	bigblueterminal?        ( "${COMMON_URI}/BigBlueTerminal.zip" )
	bitstreamverasansmono?  ( "${COMMON_URI}/BitstreamVeraSansMono.zip" )
	cascadiacode?           ( "${COMMON_URI}/CascadiaCode.zip" )
	cascadiamono?           ( "${COMMON_URI}/CascadiaMono.zip" )
	codenewroman?           ( "${COMMON_URI}/CodeNewRoman.zip" )
	comicshannsmono?        ( "${COMMON_URI}/ComicShannsMono.zip" )
	commitmono?             ( "${COMMON_URI}/CommitMono.zip" )
	cousine?                ( "${COMMON_URI}/Cousine.zip" )
	d2coding?               ( "${COMMON_URI}/D2Coding.zip" )
	daddytimemono?          ( "${COMMON_URI}/DaddyTimeMono.zip" )
	dejavusansmono?         ( "${COMMON_URI}/DejaVuSansMono.zip" )
	droidsansmono?          ( "${COMMON_URI}/DroidSansMono.zip" )
	envycoder?              ( "${COMMON_URI}/EnvyCodeR.zip" )
	fantasquesansmono?      ( "${COMMON_URI}/FantasqueSansMono.zip" )
	firacode?               ( "${COMMON_URI}/FiraCode.zip" )
	firamono?               ( "${COMMON_URI}/FiraMono.zip" )
	geistmono?              ( "${COMMON_URI}/GeistMono.zip" )
	go-mono?                ( "${COMMON_URI}/Go-Mono.zip" )
	gohu?                   ( "${COMMON_URI}/Gohu.zip" )
	hack?                   ( "${COMMON_URI}/Hack.zip" )
	hasklig?                ( "${COMMON_URI}/Hasklig.zip" )
	heavydata?              ( "${COMMON_URI}/HeavyData.zip" )
	hermit?                 ( "${COMMON_URI}/Hermit.zip" )
	ia-writer?              ( "${COMMON_URI}/iA-Writer.zip" )
	ibmplexmono?            ( "${COMMON_URI}/IBMPlexMono.zip" )
	inconsolata?            ( "${COMMON_URI}/Inconsolata.zip" )
	inconsolatago?          ( "${COMMON_URI}/InconsolataGo.zip" )
	inconsolatalgc?         ( "${COMMON_URI}/InconsolataLGC.zip" )
	intelonemono?           ( "${COMMON_URI}/IntelOneMono.zip" )
	iosevka?                ( "${COMMON_URI}/Iosevka.zip" )
	iosevkaterm?            ( "${COMMON_URI}/IosevkaTerm.zip" )
	iosevkatermslab?        ( "${COMMON_URI}/IosevkaTermSlab.zip" )
	jetbrainsmono?          ( "${COMMON_URI}/JetBrainsMono.zip" )
	lekton?                 ( "${COMMON_URI}/Lekton.zip" )
	liberationmono?         ( "${COMMON_URI}/LiberationMono.zip" )
	lilex?                  ( "${COMMON_URI}/Lilex.zip" )
	martianmono?            ( "${COMMON_URI}/MartianMono.zip" )
	meslo?                  ( "${COMMON_URI}/Meslo.zip" )
	monaspace?              ( "${COMMON_URI}/Monaspace.zip" )
	monofur?                ( "${COMMON_URI}/Monofur.zip" )
	monoid?                 ( "${COMMON_URI}/Monoid.zip" )
	mononoki?               ( "${COMMON_URI}/Mononoki.zip" )
	mplus?                  ( "${COMMON_URI}/MPlus.zip" )
	nerdfontssymbolsonly?   ( "${COMMON_URI}/NerdFontsSymbolsOnly.zip" )
	noto?                   ( "${COMMON_URI}/Noto.zip" )
	opendyslexic?           ( "${COMMON_URI}/OpenDyslexic.zip" )
	overpass?               ( "${COMMON_URI}/Overpass.zip" )
	profont?                ( "${COMMON_URI}/ProFont.zip" )
	proggyclean?            ( "${COMMON_URI}/ProggyClean.zip" )
	recursive?              ( "${COMMON_URI}/Recursive.zip" )
	robotomono?             ( "${COMMON_URI}/RobotoMono.zip" )
	sharetechmono?          ( "${COMMON_URI}/ShareTechMono.zip" )
	sourcecodepro?          ( "${COMMON_URI}/SourceCodePro.zip" )
	spacemono?              ( "${COMMON_URI}/SpaceMono.zip" )
	terminus?               ( "${COMMON_URI}/Terminus.zip" )
	tinos?                  ( "${COMMON_URI}/Tinos.zip" )
	ubuntu?                 ( "${COMMON_URI}/Ubuntu.zip" )
	ubuntumono?             ( "${COMMON_URI}/UbuntuMono.zip" )
	ubuntusans?             ( "${COMMON_URI}/UbuntuSans.zip" )
	victormono?             ( "${COMMON_URI}/VictorMono.zip" )
	zedmono?                ( "${COMMON_URI}/ZedMono.zip" )
"

LICENSE="MIT
	OFL-1.1
	Apache-2.0
	CC-BY-NC-ND-3.0
	CC-BY-SA-4.0
	bitstreamverasansmono? ( BitstreamVera )
	dejavusansmono? ( BitstreamVera )
	go-mono? ( GO )
	gohu? ( WTFPL-2 )
	heavydata? ( Vic-Fieger-License )
	monofur? ( monofur )
	ubuntu? ( UbuntuFontLicense-1.0 )
	ubuntumono? ( UbuntuFontLicense-1.0 )
	ubuntusans? ( UbuntuFontLicense-1.0 )
"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="media-libs/fontconfig"

CHECKREQS_DISK_BUILD="3G"
CHECKREQS_DISK_USR="4G"

IUSE_FLAGS=(${FONTS[*],,})
IUSE="${IUSE_FLAGS[*]}"
REQUIRED_USE="X || ( ${IUSE_FLAGS[*]} )"

S="${WORKDIR}"
FONT_CONF=(
	"${FILESDIR}"/10-nerd-font-symbols.conf
)
FONT_S=${S}

pkg_pretend() {
	check-reqs_pkg_setup
}

src_install() {
	declare -A font_filetypes
	local otf_file_number ttf_file_number

	otf_file_number=$(ls ${S} | grep -i otf | wc -l)
	ttf_file_number=$(ls ${S} | grep -i ttf | wc -l)

	if [[ ${otf_file_number} != 0 ]]; then
		font_filetypes[otf]=
	fi

	if [[ ${ttf_file_number} != 0 ]]; then
		font_filetypes[ttf]=
	fi

	FONT_SUFFIX="${!font_filetypes[@]}"

	font_src_install
}

pkg_postinst() {
	font_pkg_postinst

	einfo "Installing font-patcher via an ebuild is hard, because paths are hardcoded differently"
	einfo "in .sh files. You can still get it and use it by git cloning the nerd-font project and"
	einfo "running it from the cloned directory."
	einfo "https://github.com/ryanoasis/nerd-fonts"

	elog "You might have to enable 50-user.conf and 10-nerd-font-symbols.conf by using"
	elog "eselect fontconfig"
}
