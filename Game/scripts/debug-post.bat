echo Copying libraries...
xcopy ..\deps\win32\*.dll ..\bin\Debug\client\ /Y
xcopy ..\deps\win32\Ogre\bin\*.dll ..\bin\Debug\client\ /Y
xcopy ..\deps\win32\Ogre\bin\*.cfg ..\bin\Debug\client\ /Y
xcopy ..\deps\win32\RakNet\bin\*.dll ..\bin\Debug\client\ /Y
xcopy ..\deps\win32\fmod\bin\*.dll ..\bin\Debug\client\ /Y

echo Copying data files...
xcopy ..\static\client\config\*.cfg ..\bin\Debug\client\ /Y
xcopy ..\static\client\text\*.txt ..\bin\Debug\client\ /Y
xcopy ..\static\client\default\*.dat ..\bin\Debug\client\ /Y
xcopy ..\data ..\bin\Debug\client\data\ /S /E /Y

echo Creating directories...

if not exist ..\bin\Debug\client\screenshots (
    mkdir ..\bin\Debug\client\screenshots
)

echo Done.
