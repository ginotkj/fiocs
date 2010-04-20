#!/usr/bin/env python

# -*- coding: utf-8 -*-

#

#       common.py

#

#       Copyright 2010 Facundo-std <Facundo-std@FACUNDO-XPS>

#

#       This program is free software; you can redistribute it and/or modify

#       it under the terms of the GNU General Public License as published by

#       the Free Software Foundation; either version 2 of the License, or

#       (at your option) any later version.

#

#       This program is distributed in the hope that it will be useful,

#       but WITHOUT ANY WARRANTY; without even the implied warranty of

#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the

#       GNU General Public License for more details.

#

#       You should have received a copy of the GNU General Public License

#       along with this program; if not, write to the Free Software

#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,

#       MA 02110-1301, USA.


""" Common functions used by modules """

#Python imports
import os

def _isfile(self,file,ext):
	""" Function to check if file is a CSDF file format.
	For now the function only checks the extension. """

	if os.path.isfile(file) and os.access(file,os.R_OK):
		[filename,extension] = os.path.splitext(file)
		if extension != ext:
			return False
		else:
			return True
	else:
		print "The file %s doesn't exists or you haven't read permissions" \
				% file
		return 254
	return 0

if __name__ == '__main__':

	main()

