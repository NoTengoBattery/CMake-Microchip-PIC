#===-- CMakeLists.txt - Archivo de CMake  -------------------------------------------------------------*- CMake -*-===//
#
#                                     Microcontroladores aplicados a la Industria
#                                                 Hoja de trabajo #2
#
# Copyright (c) 2018 Oever González
#
# Todos los derechos reservados. Prohibida su distribución total o parcial, y cualquier obra derivada como lo define
# The Free Software Foundation, a menos que sea para fines exclusivamente académicos. Este archivo se distribuye tal
# cual, sin ninguna garantía implícita o explícita, excepto las aplicables por ley.
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
#       a. Además, XC8 produce código basura. Es literalmente asqueroso y lento si no se compra la licencia.
#    6. La más importante: tengo control total del build system.
#       a. Esto permite agregar o quitar caraterísticas, por ejemplo, archivos de esnamblador preprocesados.
#
#===---------------------------------------------------------------------------------------------------------------===//

CMAKE_MINIMUM_REQUIRED ( VERSION 3.10 )

# Define el sistema. Este sistema no es soportado oficialmente por CMake, así que yo le daré soporte.
SET ( CMAKE_SYSTEM_NAME PIC14_FAMILY )
SET ( CMAKE_SYSTEM_PROCESSOR PIC16F887 )

# CMake soporta SDCC, es fácil: tan solo se configura CMAKE_C_COMPILER como sdcc y listo. El asunto es que no pretendo
# hacerlo directamente aquí. Los archivos de plataforma deberían configurar esto dado un compilador compatible aquí.
# Esto es así porque pienso soportar XC8
SET ( CMAKE_C_COMPILER sdcc )
SET ( PIC_C_COMPILER SDCC )
SET ( CMAKE_ASM_COMPILER gpasm )
SET ( PIC_ASM_COMPILER GPASM )

IF ( ${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR} )
  MESSAGE ( FATAL_ERROR "In-source builds are not supported." )
ENDIF ( )


# El proyecto se llama Firmware, escrito en los lenguajes C y ASM
PROJECT ( Firmware C ASM )
