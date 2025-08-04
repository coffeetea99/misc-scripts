@echo off
chcp 65001 >nul

set "target_dir=folder_name"
for %%f in ("%target_dir%\*.*") do (
    echo %%~nf
)

endlocal