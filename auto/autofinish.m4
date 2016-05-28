dnl								-*-Autoconf-*-
dnl autofinish.m4		- Build-time finishing macro
dnl
dnl Copyright (C) 2013-2016 Das Computerlabor (DCl-M)
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
dnl CHANGED BY:	ks	2013-03-09	Move script comment stripping to
dnl					`auto/gensubst.sed'.
dnl		ks	2016-05-24	Use autoconf(1)-style comments only.
dnl		ks	2016-05-25	Add cleaning rule.
dnl		ks	2016-05-27	Rename $(af__CLEAN_FILES) to $(af_fi-
dnl					nished).
dnl					Rename ${af__unfinished} to ${af_un-
dnl					finished}.
dnl					Rename ${af__gensubst} to ${af_gen-
dnl					subst}.
dnl					Use "pathname prefix='$(srcdir)/'"
dnl					substitution instead of 'CONFIG_STA-
dnl					TUS_DEPENDENCIES' substitution.
dnl
dnl AF_FINISH_FILES(FINISHED [,GENSUBST=gensubst])
dnl				Trigger build-time finishing of @VARIABLE@
dnl				placeholders in FINISHED by letting GENSUBST
dnl				generate output variables CONFIG_STATUS_DEPEN-
dnl				DENCIES and FINISH
dnl
dnl NOTE:   (1)	All pathnames passed must be relative to $(top_srcdir)!
dnl
AC_DEFUN([AF_FINISH_FILES], [
AC_SUBST([af_finished], 'm4_normalize([$1])')
m4_ifval([$2], [af_gensubst=$2], [af_gensubst=gensubst])
af_unfinished=`$srcdir/$af_gensubst pathname suffix=.un $af_finished`
AC_SUBST([af__config_status_deps], [`
    $srcdir/$af_gensubst pathname prefix='$(srcdir)/' \
	$af_gensubst $af_gensubst.sed $af_unfinished
`])
AC_SUBST([FINISH], [`
    $srcdir/$af_gensubst FINISH prefix=$srcdir/ suffix=.un		\
	$af_finished
`])
AC_CONFIG_COMMANDS([finishing], [sed '
    s/\$(EXTRA_DIST)/$(af__config_status_deps) &/g
    s/\$(CONFIG_STATUS_DEPENDENCIES)/$(af__config_status_deps) &/g
    /^clean-am:  */s/mostlyclean-am/clean-af &/
' Makefile >Makefile.new && mv Makefile.new Makefile || rm -f Makefile.new
])
])
