@echo off

del *.csv
del /q temp\*.*

for %%f in (Lua*.xml) do (
  @echo Processing: %%~nf.xml to %%~nf.csv
  java -jar bin\saxon9he.jar "%%~nf.xml" "bin\pos_fixDynamic.xsl" >"temp\%%~nf_fixed.xml"
  java -jar bin\saxon9he.jar "temp\%%~nf_fixed.xml" "bin\methods_merge.xsl" >"temp\%%~nf_merged.xml"
  java -jar bin\saxon9he.jar "temp\%%~nf_merged.xml" "bin\csv.xsl" >"%%~nf.csv"
)
