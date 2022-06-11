@echo off

:: Move the old wallpaper into the "Wallpapers" directory
move "<SKETCH DIRECTORY>\wallpaper.bmp" "<SKETCH DIRECTORY>\Wallpapers"

:: Get the current date and time
set yy=%date:~6,4%
set mm=%date:~3,2%
set dd=%date:~0,2%

set hh=%time:~0,2%
set min=%time:~3,2%
set ss=%time:~6,2%

set fullDate=%yy%-%mm%-%dd%
set fullTime=%hh%-%min%-%ss%

:: Rename the old wallpaper to the current date and time
rename "<SKETCH DIRECTORY>\Wallpapers\wallpaper.bmp" "%fullDate% %fullTime%.bmp"

:: Run the sketch to get the new wallpaper
"<LOCATION OF 'processing-java.exe'>" --sketch="<SKETCH DIRECTORY" --run

:: Remove the old wallpaper
del "C:\Users\<USER>\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper"
del "C:\Users\<USER>\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\CachedImage_<HORIZONTAL PIXELS>_<VERTICAL PIXELS>_POS2.jpg"

:: Move the new wallpaper into the required directories, and rename
copy "<SKETCH DIRECTORY>\wallpaper.bmp" "C:\Users\<USER>\AppData\Roaming\Microsoft\Windows\Themes"
cd "C:\Users\<USER>\AppData\Roaming\Microsoft\Windows\Themes"
rename ".\wallpaper.bmp" "TranscodedWallpaper"

copy "<SKETCH DIRECTORY>\wallpaper.bmp" "C:\Users\<USER>\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles"
cd "C:\Users\<USER>\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles"
rename ".\wallpaper.bmp" "CachedImage_<HORIZONTAL PIXELS>_<VERTICAL PIXELS>_POS2.jpg"

:: Update the wallpaper
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True

exit