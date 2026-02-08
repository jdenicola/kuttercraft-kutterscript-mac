# KutterScript

Este script de Bash automatiza la actualización y parcheo de los archivos de recursos de **Ultimaker Cura** de la imporesoraKuttercraft [https://kuttercraft.com/](https://kuttercraft.com/) en macOS con archivos modificados personalizados (presumiblemente para impresoras Kuttercraft).

Este archivo es una modificacion del script original que se adjunta con el instalador de Cura en la web de Kuttercraft

## Modificaciones:

1.  Se completa una línea repetida utilizando `sed`
2.  Se agrega la ruta absoluta de la carpeta 'ARCHIVOS MODIFICADOS'
3.  No renombra la aplicacion 'Ultimaker Cura.app' a 'Cura Kuttercraft.app' en caso que falle el script

## Funcionalidad

El script realiza las siguientes acciones:

1.  **Detecta la Versión de Cura:**
    *   Navega al directorio de instalación de Ultimaker Cura (`/Applications/Ultimaker Cura.app`).
    *   Extrae la versión de configuración (`setting_version`) de un archivo de configuración existente (`ultimaker3_extended_aa04.inst.cfg`).

2.  **Actualiza los Archivos Modificados:**
    *   Recorre los archivos en la carpeta local `ARCHIVOS MODIFICADOS/Resources/resources/variants` y actualiza la línea 7 de cada archivo con la versión detectada de Cura.
    *   Recorre los archivos en la carpeta local `ARCHIVOS MODIFICADOS/Resources/resources/quality`, actualiza la línea 6 con la versión detectada y asegura que la línea 7 sea `type = quality`.

3.  **Instala los Archivos (Copia de Recursos):**
    *   Copia los archivos actualizados desde las carpetas locales en `ARCHIVOS MODIFICADOS` hacia los directorios correspondientes dentro de la aplicación Ultimaker Cura.
    *   Las carpetas que se copian incluyen:
        *   `quality`
        *   `variants`
        *   `meshes`
        *   `materials`
        *   `extruders`
        *   `definitions`
        *   `images`
    *   También instala plugins desde `ARCHIVOS MODIFICADOS/Resources/plugins` a la carpeta de scripts de post-procesamiento de Cura.

## Requisitos

*   **Sistema Operativo:** macOS.
*   **Aplicación:** Ultimaker Cura debe estar instalado en la carpeta `/Applications` con el nombre `Ultimaker Cura.app`.
*   **Archivos Fuente:** Debe existir una carpeta llamada `ARCHIVOS MODIFICADOS` en el mismo directorio que este script, preservando la estructura de subcarpetas (`Resources/resources/...`).

## Uso

1.  Asegúrate de que Ultimaker Cura esté cerrado e instalado desde la web de Kuttercraft [https://kuttercraft.com/](https://kuttercraft.com/).
2.  Abre una terminal.
3.  Navega hasta el directorio donde se encuentra este script.
4.  Ejecuta el script:
    ```bash
    ./kutterscript.sh
    ```
    *(Es posible que necesites dar permisos de ejecución con `chmod +x kutterscript.sh` antes de correrlo)*.

> **Nota:** Este script modifica directamente los archivos dentro del paquete de la aplicación. Se recomienda tener una copia de seguridad de su configuración o de la aplicación antes de ejecutarlo.
