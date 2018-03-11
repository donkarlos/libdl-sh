dnl								-*-Autoconf-*-
dnl autofinish.m4		- Build-time finishing macro
dnl
dnl Copyright (C) 2013-2018 Das Computerlabor (DCl-M)
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
dnl CHANGED BY:	ks	2018-02-26	Reimport from package `libdl-sh'.
dnl		ks	2018-03-08	Distinguish between bootstrapped and
dnl					non-bootstrapped build.
dnl
dnl AF_INIT([GENSUBST=gensubst])
dnl				Initialize build-time finishing of @VARIABLE@
dnl				placeholders in unfinished files
dnl
dnl NOTE:   (1)	All pathnames passed are relative to $(top_builddir)!
dnl
AC_DEFUN([AF_INIT], [
AC_REQUIRE([AC_PROG_SED])
m4_ifval([$1], [af_gensubst=$1], [af_gensubst=gensubst])
af_finish=`sed 's|@<:@^/@:>@@<:@^/@:>@*$|finish|' <<_AFEOF
$af_gensubst
_AFEOF`
AC_SUBST([af_distclean_files], [])
AC_SUBST([af_makefile_deps], ['$(srcdir)/'"$af_gensubst"'.sed'])
AC_SUBST([af_dist_files], [])

AS_IF([test -f "$srcdir/$af_gensubst.un"], [
    af_distclean_files='$(GENSUBST) '"$af_distclean_files"
    GENSUBST=$srcdir/$af_gensubst.un
], [test -f "$srcdir/$af_gensubst"], [
    af_makefile_deps='$(GENSUBST) '"$af_makefile_deps"
    GENSUBST=$srcdir/$af_gensubst
], [
    AC_MSG_ERROR([$af_gensubst not found!])
])

AS_IF([test -f "$srcdir/$af_finish.un"], [
    af_distclean_files='$(FINISH) '"$af_distclean_files"
    FINISH=$srcdir/$af_finish.un
], [test -f "$srcdir/$af_finish"], [
    af_makefile_deps='$(FINISH) '"$af_makefile_deps"
    FINISH=$srcdir/$af_finish
], [
    AC_MSG_ERROR([$af_finish not found!])
])
])

dnl
dnl AF_FINISH_FILES(FINISHED)	Trigger build-time finishing of @VARIABLE@
dnl				placeholders in FINISHED
dnl
dnl NOTE:   (1)	All pathnames passed are relative to $(top_builddir)!
dnl
AC_DEFUN([AF_FINISH_FILES], [
AC_SUBST([af_finished], 'm4_normalize([$1])')
af_bootstrap=n
af_unfinished="$af_finished"
AS_CASE([$GENSUBST],
    [*.un], [af_bootstrap=y af_unfinished="$af_gensubst $af_unfinished"])
AS_CASE([$FINISH],
    [*.un], [af_bootstrap=y af_unfinished="$af_finish $af_unfinished"])

AC_SUBST([FINISH_SEDFLAGS], [`
    $GENSUBST FINISH_SEDFLAGS SED="$SED" srcdir="$srcdir"		\
	prefix="${srcdir}/" suffix=.un -- $af_unfinished
`])
AC_SUBST([af_unfinished], [`
    $GENSUBST pathname SED="$SED"					\
	prefix='$(srcdir)/' suffix=.un -- $af_unfinished
`])
af_dist_files="$af_dist_files"' $(af_makefile_deps) $(af_unfinished)'

AS_CASE([$GENSUBST],
    [*.un], [GENSUBST=$af_gensubst],
	    [GENSUBST='$(srcdir)/'"$af_gensubst"])
AC_SUBST([GENSUBST])

AS_CASE([$FINISH],
    [*.un], [FINISH=$af_finish],
	    [FINISH='$(srcdir)/'"$af_finish"])
AC_SUBST([FINISH])

AC_CONFIG_COMMANDS([autofinish], [
AS_IF([test -f "$srcdir/$af_gensubst.un"], [
    af_finished="$af_gensubst $af_finished"
    GENSUBST=$srcdir/$af_gensubst.un
], [
    GENSUBST=$srcdir/$af_gensubst
])

AS_IF([test -f "$srcdir/$af_finish.un"], [
    af_finished="$af_finish $af_finished"
])

$GENSUBST Makefile SED="$SED" bootstrap="$af_bootstrap"			\
    prefix="${srcdir}/" suffix=.un --					\
    $af_finished >$tmp/af_Makefile && mv $tmp/af_Makefile Makefile
], [
SED=$SED
af_bootstrap=$af_bootstrap
af_finished="$af_finished"
af_gensubst=$af_gensubst
af_finish=$af_finish
])
])
