# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=2

PYTHON_DEPEND="2:2.6"
inherit python

DESCRIPTION="Evented I/O framework for V8 javascript."
HOMEPAGE="http://nodejs.org/"
SRC_URI="http://nodejs.org/dist/node-v${PV}.tar.gz"

LICENSE="MIT LGPL"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="ssl"

RDEPEND="ssl? ( dev-libs/openssl )
	>=sys-devel/gcc-4
	>=dev-lang/python-2.6"
DEPEND="${RDEPEND}"

S="${WORKDIR}/node-v${PV}"

pkg_setup() {
	python_set_active_version 2
}
src_prepare() {
	python_convert_shebangs -r 2 .
}

src_configure() {
	local my_conf=""
	if ! use ssl; then
		my_conf=" --disable-ssl"
	fi
	./configure \
		--prefix=/usr \
		${my_conf} || die "Configure failed!"
	#econf ${my_conf}
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	#./tools/waf-light install --destdir="${D}" || die "install failed"
	keepdir "/usr/$(get_libdir)/node/libraries"
	insinto "/usr/$(get_libdir)/node/libraries"
	doins lib/*
	newenvd "${FILESDIR}/90nodejs-envd" "90nodejs"
}
pkg_postinst() {
	python_mod_optimize "${ROOT}"usr/$(get_libdir)/node/
}

pkg_postrm() {
	python_mod_cleanup "${ROOT}"usr/$(get_libdir)/node/
}
