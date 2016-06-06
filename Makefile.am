##								-*-Makefile-*-
##  Makefile.am			- libdl-sh `Makefile.in' template
##
##  Copyright (C) 2013-2016 Das Computerlabor (DCl-M)
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
##  CHANGED BY:	ks	2013-03-06	Rename package to `libdl-sh'.
##		ks	2016-05-20	Add stub.
##		ks	2016-05-24	Remove conf_init.3sh.
##		ks	2016-06-03	Use AC_CONFIG_MACRO_DIRS() to tell
##					aclocal(1) where to find stuff.
##		ks	2016-06-06	Add config.sh.in.
##
##  NOTE:   (1)	Update the build system with autoreconf(1).
##----------------------------------------------------------------------------
##  Initialization:
##----------------------------------------------------------------------------
include $(top_srcdir)/auto/autofinish.am

CONFIG_SH		= $(af_pre)config.sh
STUB			= $(SHELL) $(srcdir)/bin/stub top_srcdir=$(top_srcdir)

##----------------------------------------------------------------------------
##  Extra primaries:
##----------------------------------------------------------------------------
shlibdir		= @libdir@/sh

##----------------------------------------------------------------------------
##  Distribute license:
##----------------------------------------------------------------------------
dist_noinst_DATA	= LICENSE

##----------------------------------------------------------------------------
##  Finish scripts:
##----------------------------------------------------------------------------
noinst_SCRIPTS		= bin/stub

##----------------------------------------------------------------------------
##  Distribute and install manpages:
##----------------------------------------------------------------------------
dist_man_MANS		= doc/dl_atexit.3sh doc/dl_atload.3sh		\
			  doc/dl_exit.3sh doc/dl_load.3sh		\
			  doc/dl_meta.3sh doc/dl_which.3sh		\
			  doc/conf_get.3sh doc/conf_getenv.3sh		\
			  doc/conf_has.3sh doc/conf_meta.3sh		\
			  doc/conf_put.3sh				\
			  doc/quote_command.3sh doc/quote_egrep.3sh	\
			  doc/quote_grep.3sh doc/quote_meta.3sh		\
			  doc/quote_sed.3sh doc/quote_sh.3sh		\
			  doc/undo_drop.3sh doc/undo_init.3sh		\
			  doc/undo_keep.3sh doc/undo_mark.3sh		\
			  doc/undo_meta.3sh doc/undo_pull.3sh		\
			  doc/undo_push.3sh doc/safe_chdir.3sh		\
			  doc/safe_init.3sh doc/safe_lock.3sh		\
			  doc/safe_meta.3sh doc/safe_mkdir.3sh		\
			  doc/safe_mktmpdir.3sh doc/safe_remove.3sh	\
			  doc/safe_rename.3sh doc/safe_save.3sh		\
			  doc/safe_touch.3sh doc/safe_umask.3sh		\
			  doc/safe_wait.3sh

##----------------------------------------------------------------------------
##  Finish and install scripts, libraries, manpages, and package data:
##----------------------------------------------------------------------------
bin_SCRIPTS		= bin/libdl-sh
pkgdata_SCRIPTS		= auto/gensubst auto/gensubst.sed lib/conf.awk
shlib_DATA		= lib/libdl.sh lib/libquote.sh lib/libundo.sh	\
			  lib/libsafe.sh lib/libconf.sh lib/libemit.sh
man_MANS		= doc/libdl-sh.1 doc/libdl-sh.conf.5		\
			  doc/libdl.3sh doc/libconf.3sh			\
			  doc/libquote.3sh doc/libundo.3sh		\
			  doc/libsafe.3sh
sysconf_DATA		= etc/libdl-sh.conf
pkgdata_DATA		= auto/autofinish.am auto/autofinish.m4

