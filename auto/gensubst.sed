#-----------------------------------------------------------------------------
#   gensubst.sed		- Strip tagged script comments
#
#   Copyright (C) 2013-2015 Das Computerlabor (DCl-M)
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU Lesser General Public License
#   as published by the Free Software Foundation; either
#   version 2.1 of the License, or (at your option) any later version.
#
#   This library is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public License
#   along with this library; if not, write to the Free Software Founda-
#   tion, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
#
#   AUTHOR(S):	ks	Karl Schmitz <ks@computerlabor.org>
#
#   WRITTEN BY:	ks	2013-03-09
#   CHANGED BY:	ks	2013-08-17	Strip comments in finalized manpages.
#-----------------------------------------------------------------------------
/^#.*{%%}$/d
/^#.*{%-}$/,/^#.*{%+}$/d
1{;/^#![^#]*##/d;}
/^##/d
/[ 	][ 	]*##$/{;s///;/^$/d;}
/[ 	][ 	]*## .*$/{;s///;/^$/d;}
/^\.\\#/d
