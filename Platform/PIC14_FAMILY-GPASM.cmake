#===-- Platform/PIC14_FAMILY-GPASM.cmake - Archivo de soporte de compilador para CMake  ---------------*- CMake -*-===//
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
# Da soporte a la familia PIC14_FAMILY con GPASM para CMAKE.
#
#===---------------------------------------------------------------------------------------------------------------===//

# Las banderas (mínimas) para hacer funcionar nuestro GPASM
SET ( CMAKE_ASM_FLAGS_INIT "" )

SET ( GPUTILS_MINVER 1.5.2 )
EXECUTE_PROCESS ( COMMAND ${CMAKE_ASM_COMPILER} -v ERROR_VARIABLE GPUTILS_VER )

STRING ( REGEX MATCH "[0-9]+\\.[0-9]+\\.[0-9]+" GPUTILS_VER ${GPUTILS_VER} )
IF ( ${GPUTILS_VER} VERSION_LESS ${GPUTILS_MINVER} )
  MESSAGE ( FATAL_ERROR
    "GPUTILS version ${GPUTILS_MINVER} or greater is needed to use this build system, but found ${GPUTILS_VER}." )
ENDIF()

IF(NOT (DEFINED ENV{GPUTILS_HEADER_PATH}) OR NOT (DEFINED ENV{GPUTILS_LKR_PATH}))
  MESSAGE ( WARNING "GPUTILS environment variables are not set. Your build may fail because of this.\n\
Please, setup these variables: GPUTILS_HEADER_PATH, GPUTILS_LKR_PATH, GPUTILS_LIB_PATH" )
ENDIF()

# If you have manually installed or built the tools, try to source this script. GPUTILS_HOME is the dir of your
# GPUTILS setup.
# export GPUTILS_HOME=/usr/local/gputils
# if [ -d $GPUTILS_HOME ]; then
#         export GPUTILS_HEADER_PATH=$GPUTILS_HOME/header
#         export GPUTILS_LKR_PATH=$GPUTILS_HOME/lkr
#         export GPUTILS_LIB_PATH=$SDCC_LIB/pic14:$SDCC_HOME/non-free/lib/pic14
#         export PATH=$GPUTILS_HOME/bin:$PATH
# else
#         unset GPUTILS_HOME
# fi



