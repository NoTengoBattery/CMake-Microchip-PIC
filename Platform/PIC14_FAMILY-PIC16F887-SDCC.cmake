#===--PIC14_FAMILY-PIC16F887-SDCC.cmake - Archivo de soporte de plataforma para CMake  ----------------*- CMake -*-===//
#
# Copyright (c) 2018 Oever González
#
# Todos los derechos reservados. Prohibida su distribución total o parcial, y cualquier obra derivada como lo define
# The Free Software Foundation, a menos que sea para fines exclusivamente académicos. Este archivo se distribuye tal
# cual, sin ninguna garantía implícita o explícita, excepto las aplicables por ley.
#
#===---------------------------------------------------------------------------------------------------------------===//
#
# Da soporte a la familia, MCU y compilador que describe el nombre del archivo.
#
#===---------------------------------------------------------------------------------------------------------------===//
MESSAGE ( STATUS "SDCC/PIC14 support for CMake" )

# CMake soporta relativamente bien SDCC, pero requiere ciertos cambios para funcionar para PIC14
SET ( SDCC_CONFIG ${CMAKE_CURRENT_LIST_DIR}/${CMAKE_SYSTEM_NAME}-${PIC_C_COMPILER}.cmake )
SET ( COMPILER_CPU 16f887 )
SET ( COMPILER_PORT pic14 )
INCLUDE ( ${SDCC_CONFIG} )

