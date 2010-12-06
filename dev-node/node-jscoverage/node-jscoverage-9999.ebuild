# Copyright 2010 Gergan Penkov
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit git

DESCRIPTION="JScoverage for node."
HOMEPAGE="http://github.com/visionmedia/node-jscoverage"
EGIT_REPO_URI="git://github.com/visionmedia/node-jscoverage.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die
}