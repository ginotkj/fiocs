# setup.py
from distutils.core import setup
import os
import py2exe
import sys

mfcdir = ''
base_dir = 'D:\\Documents/TESIS/fiocs/Resources/Tools/Simulation_analyzer/'
dist_dir = 'D:\\Documents/TESIS/fiocs/Resources/Tools/Simulation_analyzer/dist'
icons_dir = 'D:\\Documents/TESIS/fiocs/Resources/Tools/Simulation_analyzer/icons/'

sys.path.append(base_dir)

#mfcfiles = [os.path.join(mfcdir, i) for i in ["mfc90.dll"  "mfc90u.dll"  "mfcm90.dll"  "mfcm90u.dll"  "Microsoft.VC90.MFC.manifest"]]
#
#my_data_files = [("Microsoft.VC90.MFC", mfcfiles),
#              ]


my_data_files = []

for files in os.listdir(icons_dir):
	f1 = icons_dir + files
	if os.path.isfile(f1): # skip directories
		f2 = 'icons', [f1]
		my_data_files.append(f2)

# for files in os.listdir(dist_dir):
	# f1 = dist_dir + files
	# if os.path.isfile(f1): # skip directories
		# f2 = '', [f1]
		# my_data_files.append(f2)

extraArguments = {
	'long_description': """
		  Fail Injector 0.4 BETA

	This program is intend to allow users to automate the 
	process of inserting specific fails into a lot of points.""",
	'license':"""

	Copyright (C) 2010 Facundo J Ferrer
	
	This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/
	""",
	'platforms': ['Win32'],
}
		
setup(
	name = 'Fail-Injector',
	version = '0.4',
	description = 'Fail Injection for CMOS/SPICE',
	author = """
	- Facundo J Ferrer
	- Fabricio N Altamiranda""",
	author_email = """
	- facundo.j.ferrer@gmail.com
	- fabricio.n.altamiranda@gmail.com""",
	#zipfile = 'Fail-Injector' + '-' + '1.0' + '_pkg.zip',
	windows = [
		{
		"script": 'simanaly.py'
		}
	],
    data_files = my_data_files,
	options = {
				"py2exe": {
						"includes": ["sip"],
						"unbuffered": True,
						"optimize": 2,
						"excludes": ["email"]
				}
			},
	**extraArguments
  )