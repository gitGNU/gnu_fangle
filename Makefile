# fangle - fully featured notangle replacement in awk
#
#  Copyright (C) 2009-2010 Sam Liddicott <sam@liddicott.com>
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

SHELL:=bash -c 'exec bash "$${@//\\$$'\''\012'\''/$$'\''\012'\''}"' --

LITERATE_SOURCE=fangle.tm

all: fangle_sources
include Makefile.inc

fangle: test

.PHONEY: test
test: fangle.txt
	$(RUN_FANGLE) -R"test:*" fangle.txt > test.sh
	bash test.sh ; echo pass $$?
