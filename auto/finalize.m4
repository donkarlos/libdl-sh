##								-*-Autoconf-*-
##  auto/finalize.m4		- Define macro AF_FINISH_FILES()
##
##  Copyright (C) 2013, Karl Schmitz
##
##  This program is free software; you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation; either version 2 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
##  GNU General Public License (file LICENSE) for more details.
##
##  You should have received a copy of the GNU General Public License along
##  with this program; if not, write to the Free Software Foundation, Inc.,
##  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
##
##  AUTHOR(S):	ks	Karl Schmitz <carolus.faber@googlemail.com>
##
##  WRITTEN BY:	ks	2013-02-12
##  CHANGED BY:
##
##  NOTE:   (1)	Never mind these mixed-style comments; this file is processed
##		by aclocal(1) as well as m4(1).
##----------------------------------------------------------------------------
dnl
dnl AF_FINISH_FILES(FINISHED [,GENSUBST=gensubst])
dnl				Trigger build-time finishing of @VARIABLE@
dnl				placeholders in FINISHED by letting GENSUBST
dnl				generate output variables CONFIG_STATUS_DEPEN-
dnl				DENCIES and FINISH
dnl
AC_DEFUN([AF_FINISH_FILES], [
AC_SUBST([af__CLEAN_FILES], 'm4_normalize([$1])')
af__unfinished=`echo $af__CLEAN_FILES | sed 's|$| |;s| |.un |g;s| $||'`
m4_ifval([$2], [af__gensubst=$2], [af__gensubst=gensubst])
AC_SUBST([af__config_status_deps], [`
    ${srcdir}/${af__gensubst} CONFIG_STATUS_DEPENDENCIES ${af__gensubst} ${af__unfinished}
`])
AC_SUBST([FINISH], [`
    ${srcdir}/${af__gensubst} FINISH ${af__unfinished}
`])
AC_CONFIG_COMMANDS([finishing], [sed '
    s/\$(EXTRA_DIST)/$(af__config_status_deps) &/g
    s/\$(CONFIG_STATUS_DEPENDENCIES)/$(af__config_status_deps) &/g
    /^clean-am:/a\
	-rm -f $(af__CLEAN_FILES)
' Makefile >Makefile.new && mv Makefile.new Makefile || rm -f Makefile.new
])
])
