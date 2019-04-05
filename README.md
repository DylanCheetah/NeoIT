Setup:
1. download and install CodeBlocks 17.12 or newer
2. download and install MinGW-w64
3. start CodeBlocks
4. click Settings>Compiler...
5. click the Toolchain executables tab
6. click the Auto-detect button
7. if CodeBlocks can't find the build tools, click the ... button and choose the MinGW-w64 install dir
 (usually "C:\MinGW-w64\mingw32")

Building:
1. double-click the IT workspace file
2. make changes
    a. the GameConfig.h file has many settings that affect how the game works
    b. you can also modify the various source code files (I recommend keeping a backup copy though)
    c. make sure you change the ENCRYPTION_XORS to numbers you choose/generate somehow
    d. make sure you change the numbers in the XORKEY to numbers you choose/generate somehow
    e. make sure you change the MAIN_SERVER_IP to the url for your server
    f. make sure you change the SERVER_PASSWORD to a password you come up with (try a GUID, people can't
        guess those easily at all)
    g. make sure you encrypt your ad1.dat, cd1.dat, and cd2.dat files using the XORKEY with the provided 
        IT XOR v5 program
    h. the KITO Automation tool is used to encrypt zip files using the ENCRYPTION_XORS you came up with
3. in the left pane, right-click LoginServer and choose Activate
4. click the build button
5. repeat for GameServer and Game
6. the output files will be in "bin\client" and "bin\server" inside the main project dir

Notes:
* if you want to make changes, simply edit the source code and build again
* if you want to use different media files, replace the files in the "data" dir inside the main project folder, 
   delete the data dir inside the "bin\client" dir and build again
* you can also add more media files if you prefer
