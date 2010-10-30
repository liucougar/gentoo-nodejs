# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git

DESCRIPTION="A streaming compression / gzip library for node.js"
HOMEPAGE="http://github.com/waveto/node-compress"
EGIT_REPO_URI="git://github.com/waveto/node-compress.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="
		>=sys-libs/zlib-1.2.5"
RDEPEND="${DEPEND}"

src_configure () {
	node-waf configure || die "Configure failed"
}
src_compile () {
	node-waf build || die "Compilation failed"
}

src_install() {
	insinto "/usr/$(get_libdir)/node/libraries"
	doins build/default/compress.node || die
	dodoc README LICENSE || die
}
