# Copyright 2010 Gergan Penkov
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils
DESCRIPTION="Sass JavaScript Implementation"
HOMEPAGE="https://github.com/visionmedia/sass.js"
SRC_URI="http://download.github.com/visionmedia-sass.js-0.5.0-0-g4dfd4c6.tar.gz -> ${PN}-${PV}.tar.gz"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
S="${WORKDIR}/visionmedia-sass.js-4dfd4c6"
LICENSE="MIT"


DEPEND="dev-lang/nodejs"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/$(get_libdir)/node/libraries
	doins -r lib/sass.js
	dodoc Readme.md History.md
}
