# Copyright 2010 Gergan Penkoc 
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib

DESCRIPTION="node.js code syntax highlighting library"
HOMEPAGE="https://github.com/visionmedia/koala.js"
SRC_URI="http://download.github.com/visionmedia-koala.js-0.1.2-0-g29c5609.tar.gz -> ${PN}-${PV}.tar.gz"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="examples"
S="${WORKDIR}/visionmedia-koala.js-29c5609"
LICENSE="MIT"


DEPEND="dev-lang/nodejs"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/$(get_libdir)/node/libraries
	doins -r lib/{koala.js,koala}
	dodoc Readme.md History.md
	if use examples; then
		insinto "/usr/share/${PN}"
		doins -r examples 
	fi
}
