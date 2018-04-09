#===-- Platform/PIC14_FAMILY-PIC16F887-GPASM.cmake - Archivo de soporte de plataforma para CMake  -----*- CMake -*-===//
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
# Da soporte a la familia, MCU y compilador que describe el nombre del archivo.
#
#===---------------------------------------------------------------------------------------------------------------===//

# CMake no soporta muy bien GPASM. No importa, nosotros le damos soporte.
SET ( GPASM_CONFIG ${CMAKE_CURRENT_LIST_DIR}/${CMAKE_SYSTEM_NAME}-${PIC_ASM_COMPILER}.cmake )
# La CPU es determinada en el encabezado del archivo.L
#SET ( COMPILER_CPU 16f887 )
INCLUDE ( ${GPASM_CONFIG} )

