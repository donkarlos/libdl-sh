##								-*-Makefile-*-
##  Makefile.am			- libdl-sh `Makefile.in' template
##
##  Copyright (C) 2013-2015 Das Computerlabor (DCl-M)
##
##  This library is free software; you can redistribute it and/or
##  modify it under the terms of the GNU Lesser General Public License
##  as published by the Free Software Foundation; either
##  version 2.1 of the License, or (at your option) any later version.
##
##  This library is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
##  Lesser General Public License for more details.
##
##  You should have received a copy of the GNU Lesser General Public License
##  along with this library; if not, write to the Free Software Founda-
##  tion, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
##
##  AUTHOR(S):	ks	Karl Schmitz <ks@computerlabor.org>
##
##  WRITTEN BY:	ks	2013-02-12
##  CHANGED BY:	ks	2013-02-13	Add libquote.sh and libundo.sh.
##		ks	2013-02-14	Add libsafe.sh and libconf.sh.
##		ks	2013-03-06	Rename package to `libdl-sh'.
##					Add libemit.sh.
##
##  NOTE:   (1)	Update the build system with autoreconf(1).
##----------------------------------------------------------------------------
##  Initialization:
##----------------------------------------------------------------------------
ACLOCAL_AMFLAGS		= -I auto

include $(top_srcdir)/auto/autofinish.am

##----------------------------------------------------------------------------
##  Extra primaries:
##----------------------------------------------------------------------------
shlibdir		= @libdir@/sh

##----------------------------------------------------------------------------
##  Distribute license:
##----------------------------------------------------------------------------
dist_noinst_DATA	= LICENSE

##----------------------------------------------------------------------------
##  Distribute and install manpages:
##----------------------------------------------------------------------------
dist_man_MANS		= doc/dl_atload.3sh doc/dl_atexit.3sh		\
			  doc/dl_exit.3sh doc/dl_init.3sh		\
			  doc/dl_load.3sh doc/conf_get.3sh		\
			  doc/conf_getenv.3sh doc/conf_has.3sh		\
			  doc/conf_init.3sh doc/conf_put.3sh

##----------------------------------------------------------------------------
##  Finalize and install scripts, libraries, manpages, and package data:
##----------------------------------------------------------------------------
bin_SCRIPTS		= bin/libdl-sh
pkgdata_SCRIPTS		= auto/gensubst auto/gensubst.sed
shlib_DATA		= lib/libdl.sh lib/libquote.sh lib/libundo.sh	\
			  lib/libsafe.sh lib/libconf.sh lib/libemit.sh
man_MANS		= doc/libdl-sh.1 doc/libdl-sh.conf.5		\
			  doc/libdl.3sh doc/libconf.3sh
sysconf_DATA		= etc/libdl-sh.conf
pkgdata_DATA		= auto/autofinish.am auto/autofinish.m4		\
			  lib/conf.awk

