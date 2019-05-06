Setup:
1. download and install MinGW-w64
2. download and install Visual Studio Code (optional)

Building:
1. make changes
    (a) the GameConfig.h file has many settings that affect how the game works
    (b) you can also modify the various source code files (I recommend keeping a backup copy though)
    (c) make sure you change the ENCRYPTION_XORS to numbers you choose/generate somehow
    (d) make sure you change the numbers in the XORKEY to numbers you choose/generate somehow
    (e) make sure you change the MAIN_SERVER_IP to the url for your server
    (f) make sure you change the SERVER_PASSWORD to a password you come up with (try a GUID, people can't
        guess those easily at all)
    (g) make sure you encrypt your ad1.dat, cd1.dat, and cd2.dat files using the XORKEY with the provided 
        IT XOR v5 program
    (h) the KITO Automation tool is used to encrypt zip files using the ENCRYPTION_XORS you came up with
2. build the servers and game
    (a) For just MinGW-w64: Open a command prompt to the LoginServer folder and run "mingw32-make", then repeat for GameServer and Game.
    (b) For Visual Studio Code: Click Terminal>Run Task>Debug-Win32
6. the output files will be in "bin\Debug-Win32\client" and "bin\Debug-Win32\server" inside the main project dir

Notes:
* if you want to make changes, simply edit the source code and build again
* if you want to use different media files, replace the files in the "data" dir inside the main project folder, 
   delete the data dir inside the "bin\client" dir and build again
* you can also add more media files if you prefer

***Important Note***: Make sure you only distribute release builds of the game. Debug builds are larger due to the embedded debug info. You can run the "Release-Win32" task to create a release build of the game in "bin\Release-Win32\client" and "bin\Release-Win32\server".
