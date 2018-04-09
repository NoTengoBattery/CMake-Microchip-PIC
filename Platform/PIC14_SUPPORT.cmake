#===-- Platform/PIC14_SUPPORT.cmake - Archivo de soporte de plataforma para CMake  --------------------*- CMake -*-===//
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
# Configura el ensamblador y compilador de CMake desde las variables PIC_C_COMPILER y PIC_ASM_COMPILER.
#
#===---------------------------------------------------------------------------------------------------------------===//

IF ( ${PIC_C_COMPILER} STREQUAL "SDCC" )
  SET ( CMAKE_C_COMPILER sdcc )
ELSEIF ( ${PIC_C_COMPILER} STREQUAL "XC8" )
  MESSAGE ( FATAL_ERROR "We don't support XC8 yet." )
ELSE ( )
  MESSAGE ( FATAL_ERROR "Invalid PIC compiler." )
ENDIF ( )

IF ( ${PIC_ASM_COMPILER} STREQUAL "GPASM" )
  SET ( CMAKE_ASM_COMPILER_ID "GPASM_PIC14" )
  SET ( CMAKE_ASM_COMPILER gpasm )
ELSEIF ( ${PIC_C_COMPILER} STREQUAL "MPASM" )
  MESSAGE ( FATAL_ERROR "We don't support MPASM yet." )
ELSE ( )
  MESSAGE ( FATAL_ERROR "Invalid PIC assembler." )
ENDIF ( )
