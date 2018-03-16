#===-- Platform/PIC14_FAMILY-SDCC.cmake - Archivo de soporte de compilador para CMake  ----------------*- CMake -*-===//
#
# Copyright (c) 2018 Oever González
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#===---------------------------------------------------------------------------------------------------------------===//
#
# Da soporte a la familia PIC14_FAMILY con SDCC para CMAKE.
#
#===---------------------------------------------------------------------------------------------------------------===//

# Las banderas (mínimas) para hacer funcionar nuestro SDCC
SET ( CMAKE_C_OUTPUT_EXTENSION ".o" )
SET ( CMAKE_C_FLAGS_INIT "-m${COMPILER_PORT} -p${COMPILER_CPU} --use-non-free --std-sdcc11 --vc" )
SET ( CMAKE_EXE_LINKER_FLAGS_INIT "" )

SET ( SDCC_MINVER 3.7.1 )
EXECUTE_PROCESS ( COMMAND ${CMAKE_C_COMPILER} -v OUTPUT_VARIABLE SDCC_VER )

IF ( NOT "${SDCC_VER}" STREQUAL "" )
    MESSAGE( STATUS "Checking SDCC version..." )
    STRING ( REGEX MATCH "[0-9]+\\.[0-9]+\\.[0-9]+" SDCC_VER ${SDCC_VER} )
    IF ( ${SDCC_VER} VERSION_LESS ${SDCC_MINVER} )
        MESSAGE ( FATAL_ERROR
        "SDCC version ${SDCC_MINVER} or greater is needed to use this build system, but found ${SDCC_VER}." )
    ENDIF()
ELSE()
    MESSAGE( FATAL_ERROR "The SDCC version string returned nothing. Maybe SDCC is not in PATH." )
ENDIF()

IF(NOT (DEFINED ENV{SDCC_HOME}) OR NOT (DEFINED ENV{SDCC_INCLUDE}) OR NOT (DEFINED ENV{SDCC_LIB}))
  MESSAGE ( WARNING "SDCC environment variables are not set. Your build may fail because of this.\n\
\tPlease, setup these variables: SDCC_HOME, SDCC_INCLUDE, SDCC_LIB" )
ENDIF()

GET_FILENAME_COMPONENT ( CMAKE_SDCC_HOME ${CMAKE_C_COMPILER} DIRECTORY )
GET_FILENAME_COMPONENT ( CMAKE_SDCC_HOME ${CMAKE_SDCC_HOME} DIRECTORY )

# If you have manually installed or built the tools, try to source this script. SDCC_HOME is the dir of your SDCC setup.
# export SDCC_HOME=/usr/local/sdcc
# if [ -d $SDCC_HOME ]; then
#         export SDCC_HOME=$SDCC_HOME
#         export SDCC_INCLUDE=$SDCC_HOME/include
#         export SDCC_LIB=$SDCC_HOME/lib
#         export PATH=$SDCC_HOME/bin:$PATH
# else
#         unset SDCC_HOME
# fi


