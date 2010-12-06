# Copyright 2010 Gergan Penkoc 
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib git

DESCRIPTION="less.js is the next evolution of LESS"
HOMEPAGE="https://github.com/cloudhead/less.js"
EGIT_REPO_URI="git://github.com/cloudhead/less.js.git"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
LICENSE="MIT"


DEPEND="dev-lang/nodejs"
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/lessc
	insinto /usr/$(get_libdir)/node/libraries
	doins -r lib/less
	dodoc README.md
	insinto "/usr/share/${PN}"
	doins -r dist
}
