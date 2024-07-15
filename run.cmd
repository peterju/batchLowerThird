@echo off
setlocal enabledelayedexpansion
echo --------------------------------------
echo     ���������جۤ��۰ʤW�r�d�u��
echo --------------------------------------
echo     1. �ݨϥ� ImageMagick �R�O�C�u��
echo     2. ���ǳƦr�d�Ϥ� bottom.png
echo     3. �N���جۤ���� source\ �ؿ�
echo --------------------------------------
echo.

rem �]�w�ӷ��M��X�ؿ�
set source_dir=.\source
set output_dir=.\output
set bottom_image=.\bottom.png
set "CONVERT=ImageMagick7\convert.exe"

rem �ȥ��ϥ����޸��]�q���|�A�קK���|���t���Ů�ɭP���~

rem �p�G��X�ؿ����s�b�A�h�إߤ�
if not exist "%output_dir%" mkdir "%output_dir%"

rem �ӷ��ؿ������Ҧ� JPG �M PNG ���
for %%f in ("%source_dir%\*.jpg" "%source_dir%\*.png") do (
    set "filename=%%~nf"
    set "output_file=%output_dir%\!filename!_output.png"
    echo �B�z�ɮ�: %%f
    rem ���� ImageMagick �� convert �R�O
    %CONVERT% "%%f" "!bottom_image!" -gravity South -geometry +0+0 -composite -resize 1920x1080 "!output_file!"
)

rem ���ɮ��`�޶}�� output �ؿ�
explorer "%output_dir%"
echo.
echo The image merging is completed and the results are stored in the "%cd%\output

pause
rem timeout 6