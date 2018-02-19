#===-- CMakeLists.txt - Proyecto principal de CMake  --------------------------------------------------*- CMake -*-===//
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
# CMakeLists.txt define un proyecto de CMake. CMake no es compatible con MPLAB, porque es una herramienta más bien
# genérica, independiente del IDE y del sistema de compilación. MPLAB usa GNU Make, y CMake puede generar proyectos en
# GNU Make, así como proyectos de Code::Blocks (de XCode, Visual Studio, y un largo etc) a partir de este único archivo.
#
# La razón por la cual uso CMake en vez de MPLAB es porque:
#    1. Tengo basta experiencia en CMake
#    2. Es genérico y portable, media vez exista el compilador y las binutils
#    3. Se puede compilar usando las herramientas que provee XCode (yo uso Mac)
#    4. Permite utilizar CLion, un IDE para C/C++ que es infinitamente superior
#    5. Puedo usar SDCC. Esto es muy importante porque SDCC soporta C11, una versión del estándar de C mucho más moderna
#       que la que soporta XC8.
#       a. Además, XC8 produce código basura. Es literalmente basura si no se compra la licencia.
#    6. La más importante: tengo control total del build system.
#       a. Esto permite agregar o quitar caraterísticas, por ejemplo, archivos de esnamblador preprocesados.
#
# DO NOT MODIFY THIS FILE. If you think you need to do so, please report a bug in the GitHub Issue Tracker or to
#   Oever González <notengobattery@gmail.com>
#
#===---------------------------------------------------------------------------------------------------------------===//

CMAKE_MINIMUM_REQUIRED ( VERSION 3.10 )

INCLUDE ( Selector.txt )
# In Selector.txt (a file created in the root directory, whiere this one lives), you setup your target.
# DO NOT AND NEVER MODIFY THIS FILE.
# Use the following comment as template:
# SET ( CMAKE_SYSTEM_PROCESSOR PIC16F887 )
# SET ( PIC_C_COMPILER SDCC )
# SET ( PIC_ASM_COMPILER GPASM )
# SET ( PIC_PROJECT_NAME Firmware )
#
# Obviusly, you have to un-comment those lines.

# For easy-installation, you list all executables (hex files) in this command. Note that this only works in the same
# scope that the respective ADD_EXECUTABLE command
# INSTALL ( TARGETS ${HEX_FILES_TO_INSTALL} DESTINATION hex )

# Define el sistema. Este sistema no es soportado oficialmente por CMake, así que yo le daré soporte.
SET ( CMAKE_SYSTEM_NAME PIC14_FAMILY )
# Donde van los archivos terminados
SET ( CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/built )

# CMake soporta SDCC, es fácil: tan solo se configura CMAKE_C_COMPILER como sdcc y listo. El asunto es que no pretendo
# hacerlo directamente aquí. Los archivos de plataforma deberían configurar esto dado un compilador compatible aquí.
# Esto es así porque pienso soportar XC8
INCLUDE ( Platform/PIC14_SUPPORT.cmake )

IF ( ${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR} )
  MESSAGE ( FATAL_ERROR "In-source builds are not supported." )
ENDIF ( )

# El proyecto se llama Firmware, escrito en los lenguajes C y ASM
PROJECT ( ${PIC_PROJECT_NAME} ASM C )
INCLUDE ( Platform/PIC14_CONFIG.cmake )

# Agrega el subdirectorio /src donde viven todos los archivos de código fuente.
ADD_SUBDIRECTORY ( src )

