dnl								-*-Autoconf-*-
dnl configure.ac		- libsh Autotools configuration
dnl
dnl Copyright (C) 2013, Karl Schmitz
dnl
dnl This program is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation; either version 2 of the License, or
dnl (at your option) any later version.
dnl
dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
dnl GNU General Public License (file LICENSE) for more details.
dnl
dnl You should have received a copy of the GNU General Public License along
dnl with this program; if not, write to the Free Software Foundation, Inc.,
dnl 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
dnl
dnl AUTHOR(S):	ks	Karl Schmitz <carolus.faber@googlemail.com>
dnl
dnl WRITTEN BY:	ks	2013-02-12
dnl CHANGED BY:	ks	2013-02-13	Add libquote.sh.
dnl
dnl NOTE:   (1)	Update the build system with autoreconf(1).
dnl	    (2)	AM_INIT_AUTOMAKE() already invokes AC_ARG_PROGRAM, AC_PROG_-
dnl		MAKE_SET, AC_PROG_INSTALL and AM_MISSING_PROG(ACLOCAL/AUTO-
dnl		CONF/AUTOMAKE/AUTOHEADER/MAKEINFO, ...).
dnl
dnl Initialization:
dnl
AC_INIT([Demand-loadable libraries for POSIX shell scripts],
    [0.1], [carolus.faber@googlemail.com], [libsh])
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
    etc/libdl.sh.conf
    lib/libdl.sh lib/libquote.sh
], [auto/gensubst])
AC_CONFIG_FILES([
    Makefile
])
AC_OUTPUT
