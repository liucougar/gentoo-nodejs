# Copyright 2010 Gergan Penkov
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils
DESCRIPTION="TDD framework for node -- high speed parallel testing!"
HOMEPAGE="http://visionmedia.github.com/expresso/"
SRC_URI="http://download.github.com/visionmedia-expresso-0.7.0-0-gda39f13.tar.gz -> ${PN}-${PV}.tar.gz"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
S="${WORKDIR}/visionmedia-expresso-da39f13"
LICENSE="MIT"


DEPEND="dev-lang/nodejs
		dev-node/node-jscoverage"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/jscoverage-name.patch
}

src_install() {
	dobin bin/expresso
}
