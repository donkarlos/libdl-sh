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
dnl		ks	2016-05-29	Use 'FINISH_SEDFLAGS' substitution.
dnl					Turn ${af_gensubst} into output var.
dnl					Split $(af__config_status_deps) into
dnl					$(af_makefile_deps) and $(af_unfini-
dnl					shed).
dnl					Join $(af_makefile_deps) and $(af_un-
dnl					finished) into $(af_dist_files).
dnl		ks	2016-05-30	Fix build dependencies.
dnl					Utilize temporary directory provided
dnl					by ./config.status.
dnl					Tack 'clean-af' dependency to cleaning
dnl					rules depending on 'clean-am'.
dnl					Also update $(FINISH_SEDFLAGS) in
dnl					AC_CONFIG_COMMANDS().
dnl		ks	2016-06-03	Delay ${af_unfinished} pre-/suffixing.
dnl		ks	2016-06-06	Introduce AF_INIT().
dnl					Add config.sh.in.
dnl		ks	2016-06-07	Bootstrap gensubst.
dnl					Invoke AC_PROG_SED.
dnl					Add and integrate finishing script.
dnl
dnl AF_INIT([GENSUBST=gensubst])
dnl				Initialize build-time finishing of @VARIABLE@
dnl				placeholders in unfinished files
dnl
AC_DEFUN([AF_INIT], [
m4_ifval([$1], [af_gensubst=$1], [af_gensubst=gensubst])
AC_SUBST([af_pre], [`echo "$af_gensubst" | sed 's|@<:@^/@:>@@<:@^/@:>@*$||'`])
AC_SUBST([af_distclean_files], ['$(CONFIG_SH)'])
AC_SUBST([af_makefile_deps], ['$(srcdir)/'"$af_gensubst"'.sed'])
AC_SUBST([af_dist_files], ['$(srcdir)/$(CONFIG_SH).in'])

AS_IF([test -f "$srcdir/$af_gensubst.un"], [
    af_distclean_files='$(GENSUBST) '"$af_distclean_files"
    GENSUBST=$srcdir/$af_gensubst.un
], [test -f "$srcdir/$af_gensubst"], [
    af_makefile_deps='$(GENSUBST) '"$af_makefile_deps"
    GENSUBST=$srcdir/$af_gensubst
], [
    AC_MSG_ERROR([$af_gensubst not found!])
])

AC_REQUIRE([AC_PROG_SED])
af_finish=${af_pre}finish
AS_IF([test -f "$srcdir/$af_finish.un"], [
    af_distclean_files='$(FINISH) '"$af_distclean_files"
    FINISH=$srcdir/$af_finish.un
], [test -f "$srcdir/$af_finish"], [
    af_makefile_deps='$(FINISH) '"$af_makefile_deps"
    FINISH=$srcdir/$af_finish
], [
    AC_MSG_ERROR([$af_finish not found!])
])

AC_CONFIG_FILES([${af_pre}config.sh])
])

dnl
dnl AF_FINISH_FILES(FINISHED)	Trigger build-time finishing of @VARIABLE@
dnl				placeholders in FINISHED
dnl
dnl NOTE:   (1)	All pathnames passed are relative to $(top_builddir)!
dnl
AC_DEFUN([AF_FINISH_FILES], [
AC_SUBST([af_finished], 'm4_normalize([$1])')
af_unfinished="$af_finished"
AS_CASE([$GENSUBST],
    [*.un], [af_unfinished="$af_gensubst $af_unfinished"])
AS_CASE([$FINISH],
    [*.un], [af_unfinished="$af_finish $af_unfinished"])

AC_SUBST([FINISH_SEDFLAGS], [`
    $GENSUBST FINISH_SEDFLAGS						\
	prefix="${srcdir}/" suffix=.un $af_unfinished
`])
AC_SUBST([af_unfinished], [`
    $GENSUBST pathname							\
	prefix='$(srcdir)/' suffix=.un $af_unfinished
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
af_unfinished="$af_finished"

AS_IF([test -f "$srcdir/$af_gensubst.un"], [
    af_unfinished="$af_gensubst $af_unfinished"
    GENSUBST=$srcdir/$af_gensubst.un
], [
    GENSUBST=$srcdir/$af_gensubst
])

af_finish_sedflags=`
    $GENSUBST FINISH_SEDFLAGS						\
	prefix="${srcdir}/" suffix=.un $af_unfinished
`
af_sx_finish_sedflags='/^\(FINISH_SEDFLAGS *= *\).*$/s//\1'"`
    $GENSUBST quote-rs "$af_finish_sedflags"
`"'/'

$SED '
    '"$af_sx_finish_sedflags"'
    /\$(EXTRA_DIST)/s//$(af_dist_files) &/
    /^Makefile:/s/$/ $(af_dist_files)/
    /\$(am__depfiles_maybe)/s//autofinish &/
    /^@<:@^: @:>@*clean@<:@^: @:>@*:\(  *@<:@^ @:>@@<:@^ @:>@*\)*  *clean-am/s//& clean-af/
    /\$(am__CONFIG_DISTCLEAN_FILES)/s//& $(af_distclean_files)/
' Makefile >$tmp/af_Makefile && mv $tmp/af_Makefile Makefile
], [
SED=$SED
af_finished="$af_finished"
af_gensubst=$af_gensubst
])
])
