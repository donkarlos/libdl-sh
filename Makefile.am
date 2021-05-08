##								-*-Makefile-*-
##  Makefile.am			- libdl-sh `Makefile.in' template
##
##  Copyright © 2013-2021 Das Computerlabor (DCl-M)
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
##  CHANGED BY:	ks	2018-03-11	Import prebuilt autofinish scripts.
##		ks	2020-05-12	Import changelog generator.
##		ks	2020-05-16	Move `conf.awk' and `args.awk' to lib-
##					exec/.
##		ks	2020-05-27	Add universal interpreter.
##		ks	2021-04-23	Rename `test-deb-version' to `vers-
##					cmp'.
##		ks	2021-04-28	Import GNU Autotest-based test suite.
##		ks	2021-05-03	Move complete test suite to tests/.
##					Spin off libdl-sh(1) tests.
##					Add libdl.sh tests.
##			2021-05-08	Add libquote.sh tests.
##
##  NOTE:   (1)	Update the build system with autoreconf(1).
##----------------------------------------------------------------------------
##  Initialization:
##----------------------------------------------------------------------------
include $(top_srcdir)/auto/autofinish.am

MISSING			= $(SHELL) $(top_srcdir)/auto/missing
AUTOM4TE		= $(MISSING) autom4te
AUTOTEST		= $(AUTOM4TE) --language=autotest
AUTOTESTFLAGS		= -I $(top_srcdir)/tests

##----------------------------------------------------------------------------
##  Extra primaries:
##----------------------------------------------------------------------------
shlibdir		= @libdir@/sh

##----------------------------------------------------------------------------
##  Distribute license:
##----------------------------------------------------------------------------
dist_noinst_DATA	= LICENSE

##----------------------------------------------------------------------------
##  Finish scripts and libraries:
##----------------------------------------------------------------------------
noinst_SCRIPTS		= bin/genchangelog
noinst_DATA		= lib/libsession.sh

##----------------------------------------------------------------------------
##  Distribute and install manpages:
##----------------------------------------------------------------------------
dist_man_MANS		= doc/conf_get.3sh				\
			  doc/conf_has.3sh				\
			  doc/conf_meta.3sh				\
			  doc/conf_put.3sh				\
			  doc/dl_atexit.3sh				\
			  doc/dl_atload.3sh				\
			  doc/dl_dump.3sh				\
			  doc/dl_exit.3sh				\
			  doc/dl_load.3sh				\
			  doc/dl_meta.3sh				\
			  doc/dl_which.3sh				\
			  doc/quote.3sh					\
			  doc/quote_command.3sh				\
			  doc/quote_egrep.3sh				\
			  doc/quote_ere.3sh				\
			  doc/quote_grep.3sh				\
			  doc/quote_meta.3sh				\
			  doc/quote_re.3sh				\
			  doc/quote_rs.3sh				\
			  doc/quote_sed.3sh				\
			  doc/quote_sh.3sh				\
			  doc/undo_drop.3sh				\
			  doc/undo_mark.3sh				\
			  doc/undo_meta.3sh				\
			  doc/undo_pull.3sh				\
			  doc/undo_push.3sh				\
			  doc/safe_chdir.3sh				\
			  doc/safe_init.3sh				\
			  doc/safe_lock.3sh				\
			  doc/safe_meta.3sh				\
			  doc/safe_mkdir.3sh				\
			  doc/safe_mktmpdir.3sh				\
			  doc/safe_remove.3sh				\
			  doc/safe_rename.3sh				\
			  doc/safe_save.3sh				\
			  doc/safe_touch.3sh				\
			  doc/safe_umask.3sh				\
			  doc/safe_wait.3sh

##----------------------------------------------------------------------------
##  Finish and install scripts, libraries, manpages, and package data:
##----------------------------------------------------------------------------
bin_SCRIPTS		= bin/libdl-sh					\
			  bin/shebang					\
			  bin/verscmp
pkgdata_SCRIPTS		= libexec/args.awk				\
			  libexec/conf.awk
shlib_DATA		= lib/libconf.sh				\
			  lib/libdl.sh					\
			  lib/libemit.sh				\
			  lib/libquote.sh				\
			  lib/libundo.sh				\
			  lib/libsafe.sh
man_MANS		= doc/libconf.3sh				\
			  doc/libdl-sh.1				\
			  doc/libdl-sh.conf.5				\
			  doc/libdl.3sh					\
			  doc/libquote.3sh				\
			  doc/libundo.3sh				\
			  doc/libsafe.3sh
sysconf_DATA		= etc/libdl-sh.conf

##----------------------------------------------------------------------------
##  Build, run, and distribute test suite:
##----------------------------------------------------------------------------
TESTSUITE 		= $(srcdir)/tests/testsuite
TESTSUITE_AT		= $(TESTSUITE).at

EXTRA_DIST		= $(TESTSUITE_AT)				\
			  $(TESTSUITE)					\
			  $(srcdir)/tests/package.m4			\
			  tests/libdl-sh.at				\
			  tests/libdl.sh.at				\
			  tests/libquote.sh.at

$(srcdir)/tests/package.m4: $(top_srcdir)/configure.ac
	:;{ 								\
	echo 'm4_define([AT_PACKAGE_NAME], [$(PACKAGE_NAME)])' &&	\
	echo 'm4_define([AT_PACKAGE_TARNAME], [$(PACKAGE_TARNAME)])' &&	\
	echo 'm4_define([AT_PACKAGE_VERSION], [$(PACKAGE_VERSION)])' && \
	echo 'm4_define([AT_PACKAGE_STRING], [$(PACKAGE_STRING)])' &&	\
	echo 'm4_define([AT_PACKAGE_BUGREPORT], [$(PACKAGE_BUGREPORT)])' && \
	echo 'm4_define([AT_PACKAGE_URL] [$(PACKAGE_URL)])';		\
	} >$@

$(TESTSUITE):		$(TESTSUITE_AT)					\
			$(srcdir)/tests/package.m4			\
			tests/libdl-sh.at				\
			tests/libdl.sh.at				\
			tests/libquote.sh.at
	$(AUTOTEST) $(AUTOTESTFLAGS) -o $@.tmp $@.at && mv $@.tmp $@ || rm -f $@.tmp

check-local: 		tests/atconfig tests/atlocal $(TESTSUITE)
	$(SHELL) $(TESTSUITE) $(TESTSUITEFLAGS) -C tests

installcheck-local:	tests/atconfig tests/atlocal $(TESTSUITE)
	$(SHELL) $(TESTSUITE) AUTOTEST_PATH=$(bindir) $(TESTSUITEFLAGS) -C tests

clean-local:
	test -f $(TESTSUITE) && $(SHELL) $(TESTSUITE) -C tests --clean || :

distclean-local:
	rm -f tests/atconfig

