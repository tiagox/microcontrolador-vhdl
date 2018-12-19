# Microcontrolador VHDL

Para la materia Diseño Lógico de la UNTreF es condición de aprobación final de la materia, construir un microcontrolador simple utilizando VHDL.

Para la simulación de este proyecto, se planteó la condición de utilizar herramientas libres y que además sean compatibles con cualquier sistema operativo (Windows, GNU/Linux, MacOSX).

Las herramientas seleccionadas fueron elegidas por contar con soporte de parte de sus desarrolladores y por ser ampliamente utilizadas por la comunidad de desarrollo. Estas son:

* GHDL (http://ghdl.free.fr/)

    Compilación de diseños VHDL y simulacíon de los mismos.

* GTKWave (http://gtkwave.sourceforge.net/)

    Visualización de los archivos de señales generados por la simulación de GHDL.

Para escribir el código VHDL, se recomienda utilizar cualquier editor que cuente con soporte para dicho lenguaje. En lo personal, recomiendo utilizar [Sublime Text](https://www.sublimetext.com/) con el paquete [VHDL Mode](https://packagecontrol.io/packages/VHDL%20Mode).


## Nota sobre la simulación

Si se requiere ver todas las señales internas y creadas por el usuario hay que generar los archivos de señales en formato GHW y no en VCD (que solo soporta señales de tipos básicos).

## Recursos para el uso de GHDL

1. https://ghdl.readthedocs.io/
1. https://lauri.võsandi.com/hdl/ghdl.html
2. https://www.fpgarelated.com/showarticle/20.php
4. https://www.edaplayground.com/
    * Ejemplo de simulación de la ALU con EDA Playground: https://www.edaplayground.com/x/6P7g
5. Getting Started with VHDL on Linux (GHDL & GTKWave) https://www.youtube.com/watch?v=dvLeDNbXfFw
6. Getting Started With VHDL on Windows (GHDL & GTKWave) https://www.youtube.com/watch?v=H2GyAIYwZbw
