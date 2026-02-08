#!/bin/bash
CURRENT=$(pwd)

# IR A DIRECTORIO DE INSTALACION DE CURA ULTIMAKER
cd /Applications/Ultimaker\ Cura.app/Contents/Resources/resources/variants
VERSION="$(grep "setting_version" ultimaker3_extended_aa04.inst.cfg)"

echo Version Ultimaker:$VERSION 

# VOLVER A DIRECTORIO DE ORIGEN
cd "$CURRENT"

#CAMBIAR VARIANTS A VERSION DESEADA
cd $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/resources/variants
files=(*)
for file in "${files[@]}"; do
    echo "$file"
    sed -i '' -e '7s|.*|'"${VERSION}"'|' "$file"
done

# VOLVER A DIRECTORIO DE ORIGEN
cd "$CURRENT"

#CAMBIAR QUALITY A VERSION DESEADA
cd $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/resources/quality
IFS=$'\n'
paths=($(find . -type f))
unset IFS
for path in "${paths[@]}"; do
    echo "$path"
    sed -i '' -e '6s|.*|'"${VERSION}"'|' "$path"
    # sed -i '' '6d' "$path"
    sed -i '' -e '7s|.*|type = quality|' "$path"
done

# VOLVER A DIRECTORIO DE ORIGEN
cd "$CURRENT"

echo $CURRENT

# REEMPLAZAR CARPETA RESOURCES
cp -a $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/resources/quality/* /Applications/Ultimaker\ Cura.app/Contents/Resources/resources/quality
cp -a $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/resources/variants/* /Applications/Ultimaker\ Cura.app/Contents/Resources/resources/variants
cp -a $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/resources/meshes/* /Applications/Ultimaker\ Cura.app/Contents/Resources/resources/meshes
cp -a $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/resources/materials/* /Applications/Ultimaker\ Cura.app/Contents/Resources/resources/materials
cp -a $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/resources/extruders/* /Applications/Ultimaker\ Cura.app/Contents/Resources/resources/extruders
cp -a $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/resources/definitions/* /Applications/Ultimaker\ Cura.app/Contents/Resources/resources/definitions
cp -a $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/resources/images/* /Applications/Ultimaker\ Cura.app/Contents/Resources/resources/images
cp -a $CURRENT/ARCHIVOS\ MODIFICADOS/Resources/plugins/* /Applications/Ultimaker\ Cura.app/Contents/Resources/plugins/plugins/PostProcessingPlugin/scripts

# cd "/Applications"
# mv "Ultimaker Cura.app" "Cura Kuttercraft.app"
