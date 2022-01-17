@echo off
title 音视频合并
echo 注意事项：
echo ①务必先配置【ffmpeg环境变量】，没有的请百度。
echo ②合并后可选择是否【【删除】】源文件！
echo ③合并后文件在【BAT目录生成】。
echo ④合并后文件名与源视频文件名一致，特殊符号会导致【重命名不完整】！
echo.
set /p audio=请将【音频】文件拖拽到此处，按下回车确认：
set /p video=请将【视频】文件拖拽到此处，按下回车确认：
rem 保存原来的文件名到%name%变量
for /f  %%i in ('dir %video% /b ') do set name=%%i
echo %video%>>原文件名.txt
rem 合并处理
ffmpeg -i %audio% -i %video% -vcodec copy -acodec copy %name%..mp4
echo ————————————————————
echo 合并成功！
echo ————————————————————
echo %name%..mp4
echo ————————————————————
echo 继续则删除源文件！不想删除的直接关闭窗口
echo ————————————————————
pause
del /f /s /q %audio%
del /f /s /q %video%
echo.
exit
