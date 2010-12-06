# Copyright 2010 Gergan Penkoc 
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib eutils git

DESCRIPTION="Connect is a middleware layer for Node.js"
HOMEPAGE="http://senchalabs.github.com/connect"
EGIT_REPO_URI="git://github.com/senchalabs/connect.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="examples"




DEPEND="
		dev-lang/nodejs
		dev-node/sass
		dev-node/less
		dev-node/coffee-script
		"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/correct_makefile.patch
}

src_compile() {
	einfo "Not running the tests, as they are broken..."
}
src_install() {
	dodir /usr/share/man/man1
	dodir /usr/$(get_libdir)/node/libraries
	make \
		PREFIX=${D}/usr \
		LIB_PREFIX=${D}/usr/$(get_libdir)/node/libraries \
		install
	dodoc README.md LICENSE History.md AUTHORS.markdown
	if use examples; then
		insinto "/usr/share/${PN}"
		doins -r examples 
	fi
}
