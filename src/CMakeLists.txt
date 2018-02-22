#===-- src/CMakeLists.txt - Archivo de CMake  ---------------------------------------------------------*- CMake -*-===//
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
# Contiene la estructura de los archivos fuente del proyecto. En este archivo se incluyen todos los códigos fuente.
# Se pueden agregar bibliotecas y multiples directorios. NUNCA debe modificarse el CMakeLists.txt raíz.
#
# Se pueden agregar cuantos ejecutables hagan falta, con cuantos archivos y bibliotecas hagan falta. Se pueden
# "instalar" (es decir, poner todos los productos finales en un directorio), de esta forma se puede acceder fácilmente
# al producto.
#
#===---------------------------------------------------------------------------------------------------------------===//

# Agregar todos los archivos fuente al ejecutable
ADD_EXECUTABLE ( firmware main.c main.asm )
# Instalar (que es simplemente copiar) los archivos al directorio hex
INSTALL ( TARGETS firmware DESTINATION hex )
