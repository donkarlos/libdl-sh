dnl								-*-Autoconf-*-
dnl configure.ac		- libdl-sh Autotools configuration
dnl
dnl Copyright (C) 2013 Karl Schmitz
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
dnl AUTHOR(S):	ks	Karl Schmitz <carolus.faber@googlemail.com>
dnl
dnl WRITTEN BY:	ks	2013-02-12
dnl CHANGED BY:	ks	2013-02-13	Add libquote.sh and libundo.sh.
dnl		ks	2013-02-14	Add libsafe.sh and libconf.sh.
dnl		ks	2013-03-06	Rename package to `libdl-sh'.
dnl					Add libemit.sh.
dnl
dnl NOTE:   (1)	Update the build system with autoreconf(1).
dnl	    (2)	AM_INIT_AUTOMAKE() already invokes AC_ARG_PROGRAM, AC_PROG_-
dnl		MAKE_SET, AC_PROG_INSTALL and AM_MISSING_PROG(ACLOCAL/AUTO-
dnl		CONF/AUTOMAKE/AUTOHEADER/MAKEINFO, ...).
dnl
dnl Initialization:
dnl
AC_INIT([Demand-loadable libraries for POSIX shell scripts],
    [0.3.3], [carolus.faber@googlemail.com], [libdl-sh])
AC_PREREQ([2.61])
AC_CONFIG_SRCDIR([bin/libdl-sh.un])
AC_CONFIG_AUX_DIR([auto])
AM_INIT_AUTOMAKE([foreign no-define 1.9])
AM_MAINTAINER_MODE

dnl
dnl Generate output files:
dnl
AF_FINISH_FILES([
    bin/libdl-sh
    doc/libdl-sh.1 doc/libdl-sh.conf.5
    etc/libdl-sh.conf
    lib/libdl.sh lib/libquote.sh lib/libundo.sh lib/libsafe.sh
    lib/conf.awk lib/libconf.sh lib/libemit.sh
], [auto/gensubst])
AC_CONFIG_FILES([
    Makefile
])
AC_OUTPUT
