; bugsBasic.nsi
; modified from example1.nsi from nullsoft
;--------------------------------
; The name of the installer
Name “bugs Installer Basic”
; The file to write
OutFile “bugInstallBasic.exe”
; The default installation directory
InstallDir $PROGRAMFILES\Bugs
;--------------------------------
; Pages
Page directory
Page instfiles
;--------------------------------
; The stuff to install
Section “” ;No components page, name is not important
;create desktop shortcut
CreateShortCut “$DESKTOP\Bugs.lnk” “$INSTDIR\bugs.exe”
; Set output path to the installation directory.
SetOutPath $INSTDIR
; Put files there
File “bugs.exe”
File “base.pyd”
File “bug.gif”
File “bz2.pyd”
File “cdrom.pyd”
File “constants.pyd”
File “display.pyd”
File “draw.pyd”
File “event.pyd”
Making an Installation Program C-17
File “fastevent.pyd”
File “font.pyd”
File “freesansbold.ttf”
File “image.pyd”
File “imageext.pyd”
File “joystick.pyd”
File “key.pyd”
File “library.zip”
File “mixer.pyd”
File “mixer_music.pyd”
File “mouse.pyd”
File “movie.pyd”
File “msvcr71.dll”
File “multiarray.pyd”
File “overlay.pyd”
File “python24.dll”
File “rect.pyd”
File “rwobject.pyd”
File “SDL.dll”
File “SDL_image.dll”
File “SDL_mixer.dll”
File “SDL_ttf.dll”
File “smpeg.dll”
File “sndarray.pyd”
File “surface.pyd”
File “surfarray.pyd”
File “surflock.pyd”
File “time.pyd”
File “transform.pyd”
File “umath.pyd”
File “unicodedata.pyd”
File “w9xpopen.exe”
File “zlib.pyd”
File “_dotblas.pyd”
File “_GLU__init__.pyd”
File “_GL__init__.pyd”
File “_numpy.pyd”
SectionEnd ; end the section