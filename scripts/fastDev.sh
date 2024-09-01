#!/bin/bash

filename=$1

path="$(find ./ -type f -name $filename | sed 's/^.\{3\}//' | xargs -I {} dirname {})"
pathTest="$(echo "$path" | sed 's|/main/|/test/|')"
pathForJacoco="$(echo "$path" | sed 's|.*java/||')"
basename=$(echo "$filename" | sed -E 's/(.*)(Screen|Activity)\.kt/\1/')

echo "path    :$path"
echo "pathTest:$pathTest"

tmpDir=~/fastDev.kt

touch "$tmpDir"

contentToJacoco="
'/${pathForJacoco}/${basename}Activity*.*',
'/${pathForJacoco}/${basename}Navigator*.*',
'/${pathForJacoco}/${basename}Contract*.*',
"

outputJacoco=$(echo -e "$contentToJacoco")

echo "/** Agregar excepciones a JaCoCo **/" >> $tmpDir
echo "$outputJacoco" >> $tmpDir
echo "/** end **/" >> $tmpDir
echo >> $tmpDir
echo >> $tmpDir

echo "/** Agregar activity a PresentatioModule **/" >> $tmpDir
echo "@ContributesAndroidInjector(modules = [CustomModule::class])
abstract fun contribute${basename}Activity(): ${basename}Activity" >> $tmpDir
echo "/** end **/" >> $tmpDir
echo >> $tmpDir


echo "/** Configurar presenter y navigator en Module **/" >> $tmpDir
echo "@Binds
abstract fun provide${basename}Presenter(presenter : ${basename}Presenter): ${basename}Contract.Presenter

@Binds
abstract fun provide${basename}Navigator(navigator : ${basename}Navigator): ${basename}Contract.Navigator" >> $tmpDir
  echo "/** end **/" >> $tmpDir




#preview dir
bat $tmpDir

#clear file
echo > $tmpDir
