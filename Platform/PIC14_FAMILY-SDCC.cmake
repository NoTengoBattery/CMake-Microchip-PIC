#===--PIC14_FAMILY-SDCC.cmake - Archivo de soporte de compilador para CMake  --------------------------*- CMake -*-===//
#
# Copyright (c) 2018 Oever González
#
# Todos los derechos reservados. Prohibida su distribución total o parcial, y cualquier obra derivada como lo define
# The Free Software Foundation, a menos que sea para fines exclusivamente académicos. Este archivo se distribuye tal
# cual, sin ninguna garantía implícita o explícita, excepto las aplicables por ley.
#
#===---------------------------------------------------------------------------------------------------------------===//
#
# Da soporte a la familia PIC14_FAMILY con SDCC para CMAKE.
#
#===---------------------------------------------------------------------------------------------------------------===//

# Extraído de: https://github.com/Kitware/CMake/blob/master/Modules/Platform/Generic-SDCC-C.cmake
SET ( CMAKE_STATIC_LIBRARY_PREFIX )
SET ( CMAKE_STATIC_LIBRARY_SUFFIX ".lib" )
SET ( CMAKE_SHARED_LIBRARY_PREFIX )
SET ( CMAKE_SHARED_LIBRARY_SUFFIX ".lib" )
SET ( CMAKE_IMPORT_LIBRARY_PREFIX )
SET ( CMAKE_IMPORT_LIBRARY_SUFFIX )
SET ( CMAKE_EXECUTABLE_SUFFIX ".hex" )
SET ( CMAKE_LINK_LIBRARY_SUFFIX ".lib" )
SET ( CMAKE_DL_LIBS )
SET ( CMAKE_C_OUTPUT_EXTENSION ".o" )

# El archivador de SDCC
GET_FILENAME_COMPONENT ( SDCC_LOCATION "${CMAKE_C_COMPILER}" PATH )
FIND_PROGRAM ( SDCCLIB_EXECUTABLE sdcclib PATHS "${SDCC_LOCATION}" NO_DEFAULT_PATH )
FIND_PROGRAM ( SDCCLIB_EXECUTABLE sdcclib )
SET ( CMAKE_AR "${SDCCLIB_EXECUTABLE}" CACHE FILEPATH "The SDCC librarian" FORCE )

# Las banderas (mínimas) para hacer funcionar nuestro SDCC
SET ( CMAKE_C_FLAGS_INIT
    "-m${COMPILER_PORT} -p${COMPILER_CPU} --std-sdcc11 --use-non-free --profile --peep-asm --opt-code-speed -V" )
SET ( CMAKE_EXE_LINKER_FLAGS_INIT "--model-small" )

IF(NOT (DEFINED ENV{SDCC_HOME}) OR NOT (DEFINED ENV{SDCC_INCLUDE}) OR NOT (DEFINED ENV{SDCC_LIB}))
  MESSAGE ( WARNING "SDCC environment variables are not set. Your build may fail because of this.\n\
Try the following values:\n\
\tSDCC_HOME=${SDCC_LOCATION}\n\
\tSDCC_INCLUDE=${SDCC_LOCATION}/include\n\
\tSDCC_LIB=${SDCC_LOCATION}/lib\n" )
ENDIF()

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


