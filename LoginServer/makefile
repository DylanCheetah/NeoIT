#Makefile for LoginServer Project
#================================
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
EXE = ../bin/$(MODE)-$(PLATFORM)/server/LoginServer.exe
endif

ifeq ($(PLATFORM), Linux)
EXE = ../bin/$(MODE)-$(PLATFORM)/server/LoginServer
endif

ifeq ($(EXE), ***Invalid Platform***)
$(error Invalid Platform: Supported platforms are Win32, Linux.)
endif

#Dirs
SRC_DIR = ./src
OBJ_DIR = ./obj
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJ = $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/$(MODE)-$(PLATFORM)/%.o)
DEPS = $(OBJ:$(OBJ_DIR)/$(MODE)-$(PLATFORM)/%.o=$(OBJ_DIR)/$(MODE)-$(PLATFORM)/%.d)

#Flags (preprocessor, compiler, and linker)
CPPFLAGS += -I./include -I../config -I../Game/include \
-I../deps/$(PLATFORM)/RakNet/include
CFLAGS += -Wall
LDFLAGS += -L../deps/$(PLATFORM)/RakNet/bin
LDLIBS += -lRakNetDLL -lws2_32

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
	$(CP) ..\deps\$(PLATFORM)\gcc ..\bin\$(MODE)-$(PLATFORM)\server
	$(CP) ..\deps\$(PLATFORM)\RakNet\bin ..\bin\$(MODE)-$(PLATFORM)\server

deps-Linux:
	$(CP) ../deps/$(PLATFORM)/RakNet/bin ../bin/$(MODE)-$(PLATFORM)/server

data-Win32:
	$(CP) ..\static\server\Data ..\bin\$(MODE)-$(PLATFORM)\server\Data

data-Linux:
	$(CP) -r ../static/server/Data ../bin/$(MODE)-$(PLATFORM)/server/Data