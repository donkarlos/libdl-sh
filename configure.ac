dnl								-*-Autoconf-*-
dnl configure.ac		- libdl-sh Autotools configuration
dnl
dnl Copyright © 2013-2021 Das Computerlabor (DCl-M)
dnl
dnl This library is free software; you can redistribute it and/or
dnl modify it under the terms of the GNU Lesser General Public License
dnl as published by the Free Software Foundation; either
dnl version 2.1 of the License, or (at your option) any later version.
dnl
dnl This library is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
dnl Lesser General Public License for more details.
dnl
dnl You should have received a copy of the GNU Lesser General Public License
dnl along with this library; if not, write to the Free Software Founda-
dnl tion, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
dnl
dnl AUTHOR(S):	ks	Karl Schmitz <ks@computerlabor.org>
dnl
dnl WRITTEN BY:	ks	2013-02-12
dnl CHANGED BY:	ks	2018-03-11	Import prebuilt autofinish scripts.
dnl		ks	2020-05-03	Require at least GNU Automake 1.13.
dnl					Make xz(1)-compressed distributions.
dnl		ks	2020-05-12	Import changelog generator.
dnl		ks	2020-05-16	Move `conf.awk' and `args.awk' to lib-
dnl					exec/.
dnl		ks	2020-05-27	Add universal interpreter.
dnl		ks	2021-04-23	Rename `test-deb-version' to `vers-
dnl					cmp'.
dnl
dnl NOTE:   (1)	Update the build system with autoreconf(1).
dnl	    (2)	AM_INIT_AUTOMAKE() already invokes AC_ARG_PROGRAM, AC_PROG_-
dnl		MAKE_SET, AC_PROG_INSTALL and AM_MISSING_PROG(ACLOCAL/AUTO-
dnl		CONF/AUTOMAKE/AUTOHEADER/MAKEINFO, ...).
dnl
dnl Initialization:
dnl
AC_INIT([Demand-loadable libraries for POSIX shell scripts],
    [0.4~5], [ks+libdl-sh@computerlabor.org], [libdl-sh])
AC_PREREQ([2.61])
AC_CONFIG_SRCDIR([bin/libdl-sh.un])
AC_CONFIG_AUX_DIR([auto])
AC_CONFIG_MACRO_DIRS([auto])
AM_INIT_AUTOMAKE([foreign no-define dist-xz no-dist-gzip 1.13])
AF_INIT([auto/gensubst])

dnl
dnl Generate output files:
dnl
AF_FINISH_FILES([
    bin/genchangelog
    bin/libdl-sh
    bin/shebang
    bin/verscmp
    doc/libconf.3sh
    doc/libdl-sh.1
    doc/libdl-sh.conf.5
    doc/libdl.3sh
    doc/libquote.3sh
    doc/libsafe.3sh
    doc/libundo.3sh
    etc/libdl-sh.conf
    lib/libconf.sh
    lib/libdl.sh
    lib/libemit.sh
    lib/libquote.sh
    lib/libsafe.sh
    lib/libsession.sh
    lib/libundo.sh
    libexec/args.awk
    libexec/conf.awk
])
AC_CONFIG_FILES([
    Makefile
])
AC_OUTPUT
