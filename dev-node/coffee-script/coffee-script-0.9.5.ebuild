# Copyright 2010 Gergan Penkoc 
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib eutils

DESCRIPTION="Coffee Script - Unfancy JavaScript"
HOMEPAGE="http://coffeescript.org/"
SRC_URI="http://download.github.com/jashkenas-coffee-script-0.9.5-2-g9db6d6f.tar.gz -> ${PN}-${PV}.tar.gz"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="examples"
S="${WORKDIR}/jashkenas-coffee-script-9db6d6f"
LICENSE="MIT"


DEPEND="dev-lang/nodejs"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/coffee-libraries.patch
}


src_install() {
	dobin bin/cake
	dobin bin/coffee
	insinto /usr/$(get_libdir)/node/libraries/coffee-script
	doins  lib/*
	dodoc README LICENSE
	if use examples; then
		insinto "/usr/share/${PN}"
		doins -r examples 
	fi
}
