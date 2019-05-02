#Makefile for App Project
#============================
#Platform and mode Selection
PLATFORM = Win32
MODE = Debug
export PLATFORM
export MODE


#Global Variables
#================
#Tools
CC = g++

ifeq ($(PLATFORM), Win32)
CP = xcopy /E /S /Y
RM = del
endif

#Target
EXE = ***Invalid Platform***

ifeq ($(PLATFORM), Win32)
EXE = ../bin/$(MODE)-$(PLATFORM)/client/IT.exe
endif

ifeq ($(PLATFORM), Linux)
EXE = ../bin/$(MODE)-$(PLATFORM)/client/IT
endif

ifeq ($(EXE), ***Invalid Platform***)
$(error Invalid Platform: Supported platforms are Win32, Linux.)
endif

#Dirs
SRC_DIR = ./src
RES_DIR = ./res
OBJ_DIR = ./obj
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/$(MODE)-$(PLATFORM)/%.o)
DEPS = $(OBJ:$(OBJ_DIR)/$(MODE)-$(PLATFORM)/%.o=$(OBJ_DIR)/$(MODE)-$(PLATFORM)/%.d)

ifeq ($(PLATFORM), Win32)
OBJ += $(OBJ_DIR)/$(MODE)-$(PLATFORM)/res.o
endif

#Flags (preprocessor, compiler, and linker)
CPPFLAGS += -I./include -I./res -I../config -I../deps/$(PLATFORM)/Ogre/include \
-I../deps/$(PLATFORM)/Ogre/include/OIS \
-I../deps/$(PLATFORM)/OgrePagedGeometry/include -I../deps/$(PLATFORM)/RakNet/include \
-I../deps/$(PLATFORM)/fmod/include -I../deps/$(PLATFORM)/zzip/include
CFLAGS += -Wall -fpermissive
LDFLAGS += -L../deps/$(PLATFORM)/Ogre/bin -L../deps/$(PLATFORM)/OgrePagedGeometry/lib \
-L../deps/$(PLATFORM)/RakNet/bin -L../deps/$(PLATFORM)/fmod/bin \
-L../deps/$(PLATFORM)/zzip/lib -Wl,--enable-stdcall-fixup
LDLIBS += -lOgreMain -lPagedGeometry -lOIS -lRakNetDLL -lws2_32 -lfmod -lzziplib -lzlib \
-ldbghelp

ifeq ($(MODE), Debug)
CFLAGS += -g
else
CFLAGS += -O3
endif

.PHONY: all clean clean-Win32 clean-Linux


#Recipes
#=======
all: $(EXE) deps-$(PLATFORM) data-$(PLATFORM)

$(EXE): $(OBJ)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

-include $(DEPS)

$(OBJ_DIR)/$(MODE)-$(PLATFORM)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@ -MMD -MF $(@:.o=.d)

obj/$(MODE)-$(PLATFORM)/res.o: $(RES_DIR)/ogremagix.rc
	windres $(RES_DIR)/ogremagix.rc $(OBJ_DIR)/$(MODE)-$(PLATFORM)/res.o

clean: clean-$(PLATFORM)

clean-Win32:
	$(RM) obj\Debug-Win32\*.o
	$(RM) obj\Debug-Win32\*.d
	$(RM) obj\Release-Win32\*.o
	$(RM) obj\Release-Win32\*.d

clean-Linux:
	$(RM) $(OBJ)
	$(RM) $(DEPS)

deps-Win32:
	$(CP) ..\deps\$(PLATFORM)\Ogre\bin ..\bin\$(MODE)-$(PLATFORM)\client
	$(CP) ..\deps\$(PLATFORM)\RakNet\bin ..\bin\$(MODE)-$(PLATFORM)\client
	$(CP) ..\deps\$(PLATFORM)\fmod\bin ..\bin\$(MODE)-$(PLATFORM)\client
	$(CP) ..\deps\$(PLATFORM)\gcc ..\bin\$(MODE)-$(PLATFORM)\client

deps-Linux:
	$(CP) ../deps/$(PLATFORM)/Ogre/bin ../bin/$(MODE)-$(PLATFORM)/client
	$(CP) ../deps/$(PLATFORM)/RakNet/bin ../bin/$(MODE)-$(PLATFORM)/client
	$(CP) ../deps/$(PLATFORM)/fmod/bin ../bin/$(MODE)-$(PLATFORM)/client
	$(CP) ../deps/$(PLATFORM)/gcc ../bin/$(MODE)-$(PLATFORM)/client

data-Win32:
	$(CP) ..\static\client\campaigns ..\bin\$(MODE)-$(PLATFORM)\client\campaigns
	$(CP) ..\static\client\config ..\bin\$(MODE)-$(PLATFORM)\client
	$(CP) ..\static\client\default ..\bin\$(MODE)-$(PLATFORM)\client
	$(CP) ..\static\client\text ..\bin\$(MODE)-$(PLATFORM)\client
	$(CP) ..\data ..\bin\$(MODE)-$(PLATFORM)\client\data
	$(RM) ..\bin\Release-Win32\client\localIP.txt

data-Linux:
	$(CP) ../static/client/campaigns ../bin/$(MODE)-$(PLATFORM)/client/campaigns
	$(CP) ../static/client/config ../bin/$(MODE)-$(PLATFORM)/client
	$(CP) ../static/client/default ../bin/$(MODE)-$(PLATFORM)/client
	$(CP) ../static/client/text ../bin/$(MODE)-$(PLATFORM)/client
	$(CP) -r ../data ./bin/$(MODE)-$(PLATFORM)/client/data
	$(RM) ../bin/Release-Linux/client/localIP.txt