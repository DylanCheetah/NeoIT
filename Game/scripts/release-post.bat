echo Copying libraries...
xcopy ..\deps\win32\*.dll ..\bin\Release\client\ /Y
xcopy ..\deps\win32\Ogre\bin\*.dll ..\bin\Release\client\ /Y
xcopy ..\deps\win32\Ogre\bin\*.cfg ..\bin\Release\client\ /Y
xcopy ..\deps\win32\RakNet\bin\*.dll ..\bin\Release\client\ /Y
xcopy ..\deps\win32\fmod\bin\*.dll ..\bin\Release\client\ /Y

echo Copying data files...
xcopy ..\static\client\config\*.cfg ..\bin\Release\client\ /Y
xcopy ..\static\client\text\*.txt ..\bin\Release\client\ /Y
xcopy ..\static\client\default\*.dat ..\bin\Release\client\ /Y
xcopy ..\data ..\bin\Release\client\data\ /S /E /Y
del ..\bin\Release\client\localIP.txt

echo Creating directories...

if not exist ..\bin\Release\client\screenshots (
    mkdir ..\bin\Release\client\screenshots
)

echo Done.
