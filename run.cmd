@echo off
setlocal enabledelayedexpansion
echo --------------------------------------
echo     斐陶斐受贈相片自動上字卡工具
echo --------------------------------------
echo     1. 需使用 ImageMagick 命令列工具
echo     2. 須準備字卡圖片 bottom.png
echo     3. 將受贈相片放到 source\ 目錄
echo --------------------------------------
echo.

rem 設定來源和輸出目錄
set source_dir=.\source
set output_dir=.\output
set bottom_image=.\bottom.png
set "CONVERT=ImageMagick7\convert.exe"

rem 務必使用雙引號包裹路徑，避免路徑中含有空格導致錯誤

rem 如果輸出目錄不存在，則建立之
if not exist "%output_dir%" mkdir "%output_dir%"

rem 來源目錄中的所有 JPG 和 PNG 文件
for %%f in ("%source_dir%\*.jpg" "%source_dir%\*.png") do (
    set "filename=%%~nf"
    set "output_file=%output_dir%\!filename!_output.png"
    echo 處理檔案: %%f
    rem 執行 ImageMagick 的 convert 命令
    %CONVERT% "%%f" "!bottom_image!" -gravity South -geometry +0+0 -composite -resize 1920x1080 "!output_file!"
)

rem 用檔案總管開啟 output 目錄
explorer "%output_dir%"
echo.
echo The image merging is completed and the results are stored in the "%cd%\output

pause
rem timeout 6