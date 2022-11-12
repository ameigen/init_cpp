#!/bin/bash
PROJECT_NAME="${1:-"default_project"}"
MAIN_NAME="${1:-"main"}"
DIRECTORY="${2:-${PWD}}"
NEW_INCLUDE="$DIRECTORY/include/"
NEW_SRC="$DIRECTORY/src/"
MAKE_TOP="#OBJS specifies which files to compile as part of the project
OBJS = $NEW_SRC*.cpp

#CC specifies which compiler we're using
CC = g++

#COMPILER_FLAGS specifies the additional compilation options we're using
# -w suppresses all warnings
COMPILER_FLAGS = -w

#LINKER_FLAGS specifies the libraries we're linking against
LINKER_FLAGS = -lstdc++

#INCLUDE_DIR specifies the relative path to this projects defined headers
INCLUDE_DIR = -I./include/

#OBJ_NAME specifies the name of our exectuable
OBJ_NAME = $PROJECT_NAME"

MAKE_BOT='
#This is the target that compiles our executable
all : $(OBJS)
        $(CC) $(OBJS) $(COMPILER_FLAGS) $(INCLUDE_DIR) $(LINKER_FLAGS) -o $(OBJ_NAME)
'
MAKE_TEMPLATE="$MAKE_TOP$MAKE_BOT"

MAIN_TEMPLATE="
#include <stdio.h>
#include \"$MAIN_NAME.h\"
int main()
{
        printf(\"Hello, world!\");
        return 0;
}
"

HEADER_TEMPLATE="#pragma once"

function createDirectories(){
        sudo mkdir "$NEW_INCLUDE"
        sudo mkdir "$NEW_SRC"
}

function createFiles()
{
        sudo echo  "$MAKE_TEMPLATE" >> "$DIRECTORY/Makefile"
                sudo echo  "$MAIN_TEMPLATE" >> "$NEW_SRC/$MAIN_NAME.cpp"
                sudo echo  "$HEADER_TEMPLATE" >> "$NEW_INCLUDE/$MAIN_NAME.h"
}

createDirectories
createFiles