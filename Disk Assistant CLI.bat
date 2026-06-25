@echo off
setlocal EnableDelayedExpansion
title Disk Assistant CLI v1.2
chcp 65001 >nul
mode con: cols=120 lines=40

for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

set "LANG=EN"

:lang_switch
if "%LANG%"=="RU" (
    set "STR_TITLE=ПОМОЩНИК ПО РАБОТЕ С ДИСКАМИ"
    set "STR_SYS_DISK=[Система] Активный диск Windows:"
    set "STR_PROTECTED=[ЗАЩИЩЕН - нельзя стереть]"
    set "STR_NO_SYS=[!] Не удалось определить системный диск. Действуйте осторожно!"
    set "STR_MENU1=Форматировать USB-флешку"
    set "STR_MENU2=Стереть внутренний HDD/SSD"
    set "STR_MENU3=Проверить диск на ошибки (Chkdsk)"
    set "STR_MENU4=Вкл/Выкл защиту от записи (RO)"
    set "STR_MENU5=Проверить здоровье дисков (S.M.A.R.T.)"
    set "STR_MENU6=Быстрая очистка мусора на диске C:"
    set "STR_MENU7=Инструкция по полному сносу ПК (WinRE)"
    set "STR_MENU8=Анализатор места на диске"
    set "STR_MENU9=Поиск пустых папок"
    set "STR_MENU10=Инструменты восстановления системы"
    set "STR_MENU11=Очистка корзины"
    set "STR_MENU0=Сменить язык / Change language"
    set "STR_EXIT=Выход"
    set "STR_SELECT=Выберите пункт меню"
    set "STR_INVALID=Неверный выбор!"
    set "STR_SAFE=безопасно, только USB"
    set "STR_DANGER=опасно, экспертный режим"
    set "STR_SCANNING=Сканирование USB-накопителей..."
    set "STR_NO_USB=USB-накопители не обнаружены!"
    set "STR_INSERT=Вставьте USB-накопитель и нажмите любую клавишу..."
    set "STR_ENTER_NUM=Введите номер USB-диска"
    set "STR_INVALID_NUM=Неверный ввод. Введите число."
    set "STR_BLOCKED_SYS=[БЛОКИРОВАНО] Диск"
    set "STR_IS_SYSTEM=является СИСТЕМНЫМ диском. Операция прервана!"
    set "STR_NOT_USB=[ОШИБКА] Диск"
    set "STR_NOT_USB2=не является USB-накопителем!"
    set "STR_USE_OPT=Используйте пункт [2] для внутренних HDD/SSD."
    set "STR_SEL_FS=Выберите файловую систему:"
    set "STR_FS1=FAT32  - совместимость, макс. файл 4ГБ"
    set "STR_FS2=NTFS   - только Windows, большие файлы"
    set "STR_FS3=exFAT  - кроссплатформенная, большие файлы"
    set "STR_CHOICE=Ваш выбор"
    set "STR_DEFAULT=по умолчанию"
    set "STR_WARNING=WARNING:"
    set "STR_ALL_DATA=все данные на диске"
    set "STR_WILL_BE=будут уничтожены!"
    set "STR_TO_CONFIRM=Для подтверждения введите код ниже:"
    set "STR_ENTER_CODE=Введите код:"
    set "STR_WRONG_CODE=Неверный код. Операция отменена."
    set "STR_FORMATTING=Форматирование диска"
    set "STR_AS=как"
    set "STR_FAIL=[ОШИБКА] Форматирование не удалось. См. вывод DiskPart выше."
    set "STR_OK=[OK] Диск"
    set "STR_OK2=успешно отформатирован как"
    set "STR_PRESS_KEY=Нажмите любую клавишу для продолжения..."
    set "STR_SELECT_DISK=Выберите номер диска"
    set "STR_CHECKING=Проверка диска..."
    set "STR_CHKDSK_DONE=Проверка завершена."
    set "STR_RO_ENABLE=Включить защиту от записи"
    set "STR_RO_DISABLE=Выключить защиту от записи"
    set "STR_RO_CHOICE=Ваш выбор"
    set "STR_RO_SET=Защита от записи включена на диске"
    set "STR_RO_CLEAR=Защита от записи выключена на диске"
    set "STR_HEALTH_CHECK=Проверка здоровья дисков..."
    set "STR_CLEANUP_START=Очистка временных файлов..."
    set "STR_CLEANUP_DONE=Очистка завершена."
    set "STR_WINRE_TITLE=ИНСТРУКЦИЯ: ПОЛНЫЙ СНОС ПК ЧЕРЕЗ WINRE"
    set "STR_WINRE1=1. Создайте загрузочную флешку Windows или используйте установочный диск"
    set "STR_WINRE2=2. Загрузитесь с флешки/диска"
    set "STR_WINRE3=3. На экране установки нажмите Shift+F10 для открытия командной строки"
    set "STR_WINRE4=4. Скопируйте этот скрипт на флешку и запустите его из командной строки"
    set "STR_WINRE5=5. В среде WinRE защита системного диска НЕ работает - можно стереть всё"
    set "STR_WINRE6=6. Используйте пункт [2] для стирания внутренних дисков"
    set "STR_SCAN_SECOND_OS=Проверка наличия второй ОС..."
    set "STR_SECOND_OS_FOUND=[ВНИМАНИЕ] На диске обнаружена папка Windows или Users!"
    set "STR_SECOND_OS_WARN=Это может быть вторая операционная система. Продолжить?"
    set "STR_BACK=b=назад в меню"
    set "STR_ENTER_LETTER=Введите букву диска"
    set "STR_DEVICE_TYPE=Тип устройства:"
    set "STR_CONFIRM_WIPE=Подтвердите стирание диска"
    set "STR_RECOMMENDED=Рекомендуется:"
    set "STR_QUICK_CHECK=Быстрая проверка (только чтение)"
    set "STR_REPAIR_ERRORS=Исправление ошибок (/f)"
    set "STR_DEEP_SCAN=Глубокая проверка (/r) - медленно"
    set "STR_SELECT_MODE=Выберите режим проверки"
    set "STR_SFC_DESC=Сканирует и восстанавливает защищённые файлы Windows."
    set "STR_DISM_DESC=Восстанавливает образ Windows через Центр обновлений."
    set "STR_REPAIR_DESC=Восстановление повреждённых системных файлов Windows."
    set "STR_CLEANUP_DESC=Удаление временных файлов, кэша обновлений и системного мусора."
    set "STR_SMART_DESC=Проверка физического состояния дисков по данным S.M.A.R.T."
    set "STR_BIN_DESC=Безвозвратное удаление всех файлов из корзины."
    set "STR_EMPTY_DESC=Поиск пустых директорий, которые можно безопасно удалить."
    set "STR_USAGE_DESC=Анализ использования пространства на всех дисках."
    set "STR_SMART_EXPORT=Экспорт отчета S.M.A.R.T."
    set "STR_REPORT_SAVED=Отчет сохранен как"
    set "STR_WU_CACHE=Очистка кэша обновлений"
    set "STR_WU_CLEANED=Кэш обновлений очищен"
    set "STR_BIN_CLEAN=Очистка корзины"
    set "STR_BIN_CLEANED=Корзина успешно очищена"
    set "STR_NO_EMPTY=Пустых папок не найдено"
    set "STR_EMPTY_FOLDERS=Пустые папки"
    set "STR_SELECTED_DISK=Выбранный диск:"
    set "STR_REC_USB_SMALL=USB drive under 32 GB"
    set "STR_REC_USB_LARGE=USB drive over 32 GB"
    set "STR_REC_INTERNAL=Internal SSD/HDD"
    set "STR_SELECT_DRIVE=Выберите диск для сканирования"
) else (
    set "STR_TITLE=DISK ASSISTANT CLI"
    set "STR_SYS_DISK=[System] Active Windows disk:"
    set "STR_PROTECTED=[PROTECTED - cannot be wiped]"
    set "STR_NO_SYS=[!] Could not detect system disk. Proceed with extreme caution!"
    set "STR_MENU1=Format USB flash drive"
    set "STR_MENU2=Wipe internal HDD/SSD"
    set "STR_MENU3=Check disk for errors (Chkdsk)"
    set "STR_MENU4=Toggle Write Protection (RO)"
    set "STR_MENU5=Check disk health (S.M.A.R.T.)"
    set "STR_MENU6=Quick cleanup of C: drive"
    set "STR_MENU7=Full system wipe guide (WinRE)"
    set "STR_MENU8=Disk Space Analyzer"
    set "STR_MENU9=Empty Folder Finder"
    set "STR_MENU10=System Repair Tools"
    set "STR_MENU11=Recycle Bin Cleaner"
    set "STR_MENU0=Change language / Сменить язык"
    set "STR_EXIT=Exit"
    set "STR_SELECT=Select option"
    set "STR_INVALID=Invalid choice!"
    set "STR_SAFE=safe, USB only"
    set "STR_DANGER=dangerous, expert mode"
    set "STR_SCANNING=Scanning for USB drives..."
    set "STR_NO_USB=No USB drives detected!"
    set "STR_INSERT=Please insert a USB drive and press any key..."
    set "STR_ENTER_NUM=Enter USB disk number"
    set "STR_INVALID_NUM=Invalid input. Enter a number."
    set "STR_BLOCKED_SYS=[BLOCKED] Disk"
    set "STR_IS_SYSTEM=is the SYSTEM disk. Operation aborted!"
    set "STR_NOT_USB=[ERROR] Disk"
    set "STR_NOT_USB2=is not a USB drive!"
    set "STR_USE_OPT=Use option [2] for internal HDD/SSD."
    set "STR_SEL_FS=Select file system:"
    set "STR_FS1=FAT32  - compatible, max file 4GB"
    set "STR_FS2=NTFS   - Windows only, large files"
    set "STR_FS3=exFAT  - cross-platform, large files"
    set "STR_CHOICE=Choice"
    set "STR_DEFAULT=default"
    set "STR_WARNING=WARNING:"
    set "STR_ALL_DATA=all data on disk"
    set "STR_WILL_BE=will be destroyed!"
    set "STR_TO_CONFIRM=To confirm, type the code below:"
    set "STR_ENTER_CODE=Enter code:"
    set "STR_WRONG_CODE=Wrong code. Operation cancelled."
    set "STR_FORMATTING=Formatting disk"
    set "STR_AS=as"
    set "STR_FAIL=[FAIL] Formatting failed. See DiskPart output above."
    set "STR_OK=[OK] Disk"
    set "STR_OK2=successfully formatted as"
    set "STR_PRESS_KEY=Press any key to continue..."
    set "STR_SELECT_DISK=Select disk number"
    set "STR_CHECKING=Checking disk..."
    set "STR_CHKDSK_DONE=Check completed."
    set "STR_RO_ENABLE=Enable write protection"
    set "STR_RO_DISABLE=Disable write protection"
    set "STR_RO_CHOICE=Your choice"
    set "STR_RO_SET=Write protection enabled on disk"
    set "STR_RO_CLEAR=Write protection disabled on disk"
    set "STR_HEALTH_CHECK=Checking disk health..."
    set "STR_CLEANUP_START=Cleaning temporary files..."
    set "STR_CLEANUP_DONE=Cleanup completed."
    set "STR_WINRE_TITLE=GUIDE: FULL SYSTEM WIPE VIA WINRE"
    set "STR_WINRE1=1. Create Windows bootable USB or use installation media"
    set "STR_WINRE2=2. Boot from USB/disc"
    set "STR_WINRE3=3. On setup screen press Shift+F10 to open command prompt"
    set "STR_WINRE4=4. Copy this script to USB and run it from command prompt"
    set "STR_WINRE5=5. In WinRE environment system disk protection DOES NOT work - can wipe everything"
    set "STR_WINRE6=6. Use option [2] to wipe internal disks"
    set "STR_SCAN_SECOND_OS=Checking for secondary OS..."
    set "STR_SECOND_OS_FOUND=[WARNING] Windows or Users folder found on disk!"
    set "STR_SECOND_OS_WARN=This may be a second operating system. Continue?"
    set "STR_BACK=b=back to menu"
    set "STR_ENTER_LETTER=Enter drive letter"
    set "STR_DEVICE_TYPE=Device type:"
    set "STR_CONFIRM_WIPE=Confirm disk wipe"
    set "STR_RECOMMENDED=Recommended:"
    set "STR_QUICK_CHECK=Quick check (read-only)"
    set "STR_REPAIR_ERRORS=Repair errors (/f)"
    set "STR_DEEP_SCAN=Deep scan (/r) - slow"
    set "STR_SELECT_MODE=Select check mode"
    set "STR_SFC_DESC=Scans and repairs protected Windows files."
    set "STR_DISM_DESC=Repairs the Windows image using Windows Update."
    set "STR_REPAIR_DESC=Repairs damaged Windows system files."
    set "STR_CLEANUP_DESC=Removes temporary files, update cache, and system junk."
    set "STR_SMART_DESC=Checks physical disk health using S.M.A.R.T. data."
    set "STR_BIN_DESC=Permanently deletes all files in Recycle Bin."
    set "STR_EMPTY_DESC=Finds empty directories that can be safely deleted."
    set "STR_USAGE_DESC=Analyzes disk space usage for all drives."
    set "STR_SMART_EXPORT=Export S.M.A.R.T. report"
    set "STR_REPORT_SAVED=Report saved as"
    set "STR_WU_CACHE=Windows Update cache cleanup"
    set "STR_WU_CLEANED=Windows Update cache cleaned"
    set "STR_BIN_CLEAN=Recycle Bin cleanup"
    set "STR_BIN_CLEANED=Recycle Bin cleaned successfully"
    set "STR_NO_EMPTY=No empty folders found"
    set "STR_EMPTY_FOLDERS=Empty folders"
    set "STR_SELECTED_DISK=Selected disk:"
    set "STR_REC_USB_SMALL=USB drive under 32 GB"
    set "STR_REC_USB_LARGE=USB drive over 32 GB"
    set "STR_REC_INTERNAL=Internal SSD/HDD"
    set "STR_SELECT_DRIVE=Select drive to scan"
)

goto main_menu

net session >nul 2>&1
if !errorLevel! neq 0 (
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

if not "%~1"=="" (
    echo This tool must be run interactively.
    pause
    exit /b
)

:refresh_sys_disk
for /f %%i in ('powershell -NoProfile -Command "try { (Get-Partition -DriveLetter $env:SystemDrive.TrimEnd(':') | Select-Object -First 1).DiskNumber } catch { -1 }" 2^>nul') do set "SYS_DISK=%%i"
if not defined SYS_DISK set "SYS_DISK=-1"
exit /b

:main_menu
call :refresh_sys_disk
cls
echo ========================================================================================================
echo                                         Disk Assistant CLI v1.2
echo ========================================================================================================
echo.
if !SYS_DISK! geq 0 (
    echo   !STR_SYS_DISK! !SYS_DISK!  !STR_PROTECTED!
) else (
    echo   !STR_NO_SYS!
)
echo.
echo   [1] !STR_MENU1!           (!STR_SAFE!)
echo   [2] !STR_MENU2!            (!STR_DANGER!)
echo   [3] !STR_MENU3!
echo   [4] !STR_MENU4!
echo   [5] !STR_MENU5!
echo   [6] !STR_MENU6!
echo   [7] !STR_MENU7!
echo   [8] !STR_MENU8!
echo   [9] !STR_MENU9!
echo   [10] !STR_MENU10!
echo   [11] !STR_MENU11!
echo   [0] !STR_MENU0!
echo.
echo ========================================================================================================
set /p "choice=!STR_SELECT! [0-11]: "

if "!choice!"=="1" goto menu_usb
if "!choice!"=="2" goto menu_hdd
if "!choice!"=="3" goto menu_chkdsk
if "!choice!"=="4" goto menu_readonly
if "!choice!"=="5" goto menu_smart
if "!choice!"=="6" goto menu_cleanup
if "!choice!"=="7" goto menu_winre
if "!choice!"=="8" goto menu_diskusage
if "!choice!"=="9" goto menu_emptyfolders
if "!choice!"=="10" goto menu_repair
if "!choice!"=="11" goto menu_bin
if "!choice!"=="0" goto change_lang
echo !STR_INVALID!
timeout /t 2 >nul
goto main_menu

:change_lang
if "%LANG%"=="RU" (
    set "LANG=EN"
) else (
    set "LANG=RU"
)
goto lang_switch

:get_recommended_fs
set "RECOMMENDED_FS=NTFS"
set "RECOMMENDED_IDX=2"
set "RECOMMENDED_REASON=!STR_REC_INTERNAL!"

for /f "delims=" %%a in ('powershell -NoProfile -Command "try { $d = Get-Disk -Number %1 -ErrorAction Stop; $sizeGB = $d.Size / 1GB; if ($d.BusType -eq 'USB') { if ($sizeGB -lt 32) { 'FAT32|1|!STR_REC_USB_SMALL!' } else { 'exFAT|3|!STR_REC_USB_LARGE!' } } else { 'NTFS|2|!STR_REC_INTERNAL!' } } catch { 'FAT32|1|Unknown' }" 2^>nul') do (
    for /f "tokens=1,2,3 delims=|" %%x in ("%%a") do (
        set "RECOMMENDED_FS=%%x"
        set "RECOMMENDED_IDX=%%y"
        set "RECOMMENDED_REASON=%%z"
    )
)
exit /b

:get_device_type
set "DEVICE_TYPE=Unknown"
if /I "%~1"=="USB" set "DEVICE_TYPE=USB Flash Drive"
if /I "%~1"=="NVMe" set "DEVICE_TYPE=Internal NVMe SSD"
if /I "%~1"=="SSD" set "DEVICE_TYPE=Internal SSD"
if /I "%~1"=="SATA" set "DEVICE_TYPE=Internal SATA Drive"
if /I "%~1"=="SCSI" set "DEVICE_TYPE=Internal SCSI Drive"
if /I "%~1"=="RAID" set "DEVICE_TYPE=RAID Array"
if /I "%~1"=="iSCSI" set "DEVICE_TYPE=iSCSI Drive"
if /I "%~1"=="SAS" set "DEVICE_TYPE=SAS Drive"
if /I "%~1"=="Fibre Channel" set "DEVICE_TYPE=Fibre Channel Drive"
if /I "%~1"=="File-Backed Virtual" set "DEVICE_TYPE=Virtual Disk"
exit /b

:trim
for /f "tokens=* delims= " %%a in ("!%1!") do set "%1=%%a"
exit /b

:menu_usb
call :refresh_sys_disk
cls
echo === Disk Assistant CLI - !STR_MENU1! ===
echo.
echo !STR_SCANNING!
echo.

set "usb_found=0"
powershell -NoProfile -Command ^
    "$usb = Get-Disk | Where-Object BusType -eq 'USB';" ^
    "if ($usb) { $usb | Format-Table Number, FriendlyName, @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}}, HealthStatus -AutoSize; exit 0 } else { exit 1 }" ^
    > "%temp%\da_usb.txt" 2>&1
if !errorlevel! equ 0 set "usb_found=1"

type "%temp%\da_usb.txt"

if "!usb_found!"=="0" (
    echo.
    echo !STR_NO_USB!
    echo !STR_INSERT!
    pause >nul
    goto main_menu
)

echo.
echo !STR_BACK!
set /p "disknum=!STR_ENTER_NUM!: "

if /I "!disknum!"=="b" goto main_menu

echo(!disknum!| findstr /rx "[0-9][0-9]*" >nul || (
    echo !STR_INVALID_NUM!
    timeout /t 2 >nul
    goto menu_usb
)

if !SYS_DISK! geq 0 if "!disknum!"=="!SYS_DISK!" (
    echo.
    echo %ESC%[91mWARNING:%ESC%[0m !STR_BLOCKED_SYS! !disknum! !STR_IS_SYSTEM!
    pause
    goto main_menu
)

powershell -NoProfile -Command ^
    "$d = Get-Disk -Number !disknum! -ErrorAction SilentlyContinue;" ^
    "if (-not $d -or $d.BusType -ne 'USB') { exit 1 }" >nul 2>&1
if errorlevel 1 (
    echo.
    echo %ESC%[91mWARNING:%ESC%[0m !STR_NOT_USB! !disknum! !STR_NOT_USB2!
    echo !STR_USE_OPT!
    pause
    goto main_menu
)

for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Disk -Number !disknum!).FriendlyName" 2^>nul') do set "disk_name=%%a"
for /f %%a in ('powershell -NoProfile -Command "[math]::Round((Get-Disk -Number !disknum!).Size / 1GB, 1)" 2^>nul') do set "disk_size_gb=%%a"
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Disk -Number !disknum!).BusType" 2^>nul') do set "bus_type=%%a"

echo.
echo !STR_SELECTED_DISK! !disk_name! (!disk_size_gb! GB)
call :get_device_type !bus_type!
echo !STR_DEVICE_TYPE! !DEVICE_TYPE!

call :get_recommended_fs !disknum!

echo.
echo !STR_SEL_FS!

set "line1=[1] !STR_FS1!"
set "line2=[2] !STR_FS2!"
set "line3=[3] !STR_FS3!"

if "!RECOMMENDED_IDX!"=="1" set "line1=[1] !STR_FS1! (Recommended - !RECOMMENDED_REASON!)"
if "!RECOMMENDED_IDX!"=="2" set "line2=[2] !STR_FS2! (Recommended - !RECOMMENDED_REASON!)"
if "!RECOMMENDED_IDX!"=="3" set "line3=[3] !STR_FS3! (Recommended - !RECOMMENDED_REASON!)"

echo   !line1!
echo   !line2!
echo   !line3!
echo.
echo !STR_BACK!
set /p "fsChoice=!STR_CHOICE! [1-3, !STR_DEFAULT!=1]: "

if /I "!fsChoice!"=="b" goto main_menu

if "!fsChoice!"=="" set "fsChoice=1"
if "!fsChoice!"=="1" set "FS=FAT32"
if "!fsChoice!"=="2" set "FS=NTFS"
if "!fsChoice!"=="3" set "FS=exFAT"
if not defined FS set "FS=FAT32"

set /a "CODE=!RANDOM! %% 9000 + 1000"
echo.
echo %ESC%[91mWARNING:%ESC%[0m %ESC%[97m!STR_ALL_DATA! !disknum! !STR_WILL_BE!%ESC%[0m
echo.
echo !STR_TO_CONFIRM!  !CODE!
echo !STR_BACK!
set /p "INPUT=!STR_ENTER_CODE! "

if /I "!INPUT!"=="b" goto main_menu

if "!INPUT!" neq "!CODE!" (
    echo !STR_WRONG_CODE!
    timeout /t 2 >nul
    goto main_menu
)

(
    echo select disk !disknum!
    echo clean
    echo create partition primary
    echo format fs=!FS! quick
    echo assign
    echo exit
) > "%temp%\da_format.txt"

echo.
echo !STR_FORMATTING! !disknum! !STR_AS! !FS!...
echo.
diskpart /s "%temp%\da_format.txt"

if errorlevel 1 (
    echo.
    echo %ESC%[91mWARNING:%ESC%[0m !STR_FAIL!
) else (
    echo.
    echo !STR_OK! !disknum! !STR_OK2! !FS!!
)

del "%temp%\da_format.txt" 2>nul
del "%temp%\da_usb.txt" 2>nul
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:menu_hdd
call :refresh_sys_disk
cls
echo === Disk Assistant CLI - !STR_MENU2! ===
echo.
echo %ESC%[91mWARNING:%ESC%[0m %ESC%[97m!STR_ALL_DATA! !STR_WILL_BE!%ESC%[0m
echo.
powershell -NoProfile -Command "Get-Disk | Where-Object { $_.Number -ne !SYS_DISK! -and $_.BusType -ne 'USB' } | Format-Table Number, FriendlyName, @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}}, BusType -AutoSize"
echo.
echo !STR_BACK!
set /p "disknum=!STR_SELECT_DISK!: "

if /I "!disknum!"=="b" goto main_menu

echo(!disknum!| findstr /rx "[0-9][0-9]*" >nul || (
    echo !STR_INVALID_NUM!
    timeout /t 2 >nul
    goto menu_hdd
)

if !SYS_DISK! geq 0 if "!disknum!"=="!SYS_DISK!" (
    echo.
    echo %ESC%[91mWARNING:%ESC%[0m !STR_BLOCKED_SYS! !disknum! !STR_IS_SYSTEM!
    pause
    goto main_menu
)

for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Disk -Number !disknum!).FriendlyName" 2^>nul') do set "disk_name=%%a"
for /f %%a in ('powershell -NoProfile -Command "[math]::Round((Get-Disk -Number !disknum!).Size / 1GB, 1)" 2^>nul') do set "disk_size_gb=%%a"
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-Disk -Number !disknum!).BusType" 2^>nul') do set "bus_type=%%a"

echo.
echo !STR_SELECTED_DISK! !disk_name! (!disk_size_gb! GB)
call :get_device_type !bus_type!
echo !STR_DEVICE_TYPE! !DEVICE_TYPE!
echo.

echo !STR_SCAN_SECOND_OS!
powershell -NoProfile -Command ^
    "$part = Get-Partition -DiskNumber !disknum! -ErrorAction SilentlyContinue | Where-Object Type -eq 'Basic';" ^
    "if ($part) { foreach ($p in $part) { try { $letter = $p.DriveLetter; if ($letter -and ((Test-Path \"${letter}:\Windows\") -or (Test-Path \"${letter}:\Users\"))) { exit 1 } } catch {} } } exit 0" >nul 2>&1
if errorlevel 1 (
    echo %ESC%[91mWARNING:%ESC%[0m !STR_SECOND_OS_FOUND!
    echo !STR_SECOND_OS_WARN!
    set /p "confirm=[Y/N]: "
    if /I not "!confirm!"=="y" goto main_menu
)

call :get_recommended_fs !disknum!

echo.
echo !STR_SEL_FS!

set "line1=[1] !STR_FS1!"
set "line2=[2] !STR_FS2!"
set "line3=[3] !STR_FS3!"

if "!RECOMMENDED_IDX!"=="1" set "line1=[1] !STR_FS1! (Recommended - !RECOMMENDED_REASON!)"
if "!RECOMMENDED_IDX!"=="2" set "line2=[2] !STR_FS2! (Recommended - !RECOMMENDED_REASON!)"
if "!RECOMMENDED_IDX!"=="3" set "line3=[3] !STR_FS3! (Recommended - !RECOMMENDED_REASON!)"

echo   !line1!
echo   !line2!
echo   !line3!
echo.
echo !STR_BACK!
set /p "fsChoice=!STR_CHOICE! [1-3, !STR_DEFAULT!=1]: "

if /I "!fsChoice!"=="b" goto main_menu

if "!fsChoice!"=="" set "fsChoice=1"
if "!fsChoice!"=="1" set "FS=FAT32"
if "!fsChoice!"=="2" set "FS=NTFS"
if "!fsChoice!"=="3" set "FS=exFAT"
if not defined FS set "FS=FAT32"

set /a "CODE=!RANDOM! %% 9000 + 1000"
echo.
echo %ESC%[91mWARNING:%ESC%[0m %ESC%[97m!STR_ALL_DATA! !disknum! !STR_WILL_BE!%ESC%[0m
echo.
echo !STR_TO_CONFIRM!  !CODE!
echo !STR_BACK!
set /p "INPUT=!STR_ENTER_CODE! "

if /I "!INPUT!"=="b" goto main_menu

if "!INPUT!" neq "!CODE!" (
    echo !STR_WRONG_CODE!
    timeout /t 2 >nul
    goto main_menu
)

(
    echo select disk !disknum!
    echo clean
    echo create partition primary
    echo format fs=!FS! quick
    echo assign
    echo exit
) > "%temp%\da_format.txt"

echo.
echo !STR_FORMATTING! !disknum! !STR_AS! !FS!...
echo.
diskpart /s "%temp%\da_format.txt"

if errorlevel 1 (
    echo.
    echo %ESC%[91mWARNING:%ESC%[0m !STR_FAIL!
) else (
    echo.
    echo !STR_OK! !disknum! !STR_OK2! !FS!!
)

del "%temp%\da_format.txt" 2>nul
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:menu_chkdsk
cls
echo === Disk Assistant CLI - !STR_MENU3! ===
echo.
echo Checks disk for errors and bad sectors.
echo.
echo [1] !STR_QUICK_CHECK!
echo     Fast scan, no repairs
echo.
echo [2] !STR_REPAIR_ERRORS!
echo     Fixes file system errors
echo.
echo [3] !STR_DEEP_SCAN!
echo     Finds bad sectors and recovers data
echo.
echo !STR_BACK!
set /p "chkdsk_mode=!STR_SELECT_MODE! [1-3]: "

if /I "!chkdsk_mode!"=="b" goto main_menu

if not "!chkdsk_mode!"=="1" if not "!chkdsk_mode!"=="2" if not "!chkdsk_mode!"=="3" (
    echo !STR_INVALID!
    timeout /t 2 >nul
    goto menu_chkdsk
)

cls
echo === Disk Assistant CLI - !STR_MENU3! ===
echo.
powershell -NoProfile -Command "Get-Volume | Where-Object DriveLetter | Format-Table DriveLetter, FileSystemLabel, @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}}, HealthStatus -AutoSize"
echo.
echo !STR_BACK!
set /p "letter=!STR_ENTER_LETTER! (A-Z): "

if /I "!letter!"=="b" goto main_menu

set "letter=!letter:~0,1!"

echo !letter!| findstr /rx "[A-Za-z]" >nul || (
    echo !STR_INVALID_NUM!
    timeout /t 2 >nul
    goto menu_chkdsk
)

echo.
echo !STR_CHECKING! !letter!:...
echo.

if "!chkdsk_mode!"=="1" (
    chkdsk !letter!:
) else if "!chkdsk_mode!"=="2" (
    chkdsk !letter!: /f
) else if "!chkdsk_mode!"=="3" (
    chkdsk !letter!: /f /r
)

echo.
echo !STR_CHKDSK_DONE!
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:menu_readonly
call :refresh_sys_disk
cls
echo === Disk Assistant CLI - !STR_MENU4! ===
echo.
powershell -NoProfile -Command "Get-Disk | Format-Table Number, FriendlyName, @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}}, IsReadOnly -AutoSize"
echo.
echo !STR_BACK!
set /p "disknum=!STR_SELECT_DISK!: "

if /I "!disknum!"=="b" goto main_menu

echo(!disknum!| findstr /rx "[0-9][0-9]*" >nul || (
    echo !STR_INVALID_NUM!
    timeout /t 2 >nul
    goto menu_readonly
)

if !SYS_DISK! geq 0 if "!disknum!"=="!SYS_DISK!" (
    echo.
    echo %ESC%[91mWARNING:%ESC%[0m !STR_BLOCKED_SYS! !disknum! !STR_IS_SYSTEM!
    pause
    goto main_menu
)

echo.
echo   [1] !STR_RO_ENABLE!
echo   [2] !STR_RO_DISABLE!
echo.
echo !STR_BACK!
set /p "roChoice=!STR_RO_CHOICE! [1-2]: "

if /I "!roChoice!"=="b" goto main_menu

if "!roChoice!"=="1" (
    (
        echo select disk !disknum!
        echo attributes disk set readonly
        echo exit
    ) > "%temp%\da_ro.txt"
    diskpart /s "%temp%\da_ro.txt" >nul 2>&1
    echo.
    echo !STR_RO_SET! !disknum!
) else if "!roChoice!"=="2" (
    (
        echo select disk !disknum!
        echo attributes disk clear readonly
        echo exit
    ) > "%temp%\da_ro.txt"
    diskpart /s "%temp%\da_ro.txt" >nul 2>&1
    echo.
    echo !STR_RO_CLEAR! !disknum!
) else (
    echo !STR_INVALID!
    timeout /t 2 >nul
)

del "%temp%\da_ro.txt" 2>nul
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:menu_smart
cls
echo === Disk Assistant CLI - !STR_MENU5! ===
echo.
echo !STR_SMART_DESC!
echo.
echo !STR_HEALTH_CHECK!
echo.
powershell -NoProfile -Command "Get-PhysicalDisk | Format-Table FriendlyName, MediaType, BusType, @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}}, HealthStatus, OperationalStatus -AutoSize"
echo.
echo !STR_SMART_EXPORT!?
set /p "export=[Y/N]: "
if /I "!export!"=="y" (
    set "datestamp=%date:~-4%-%date:~3,2%-%date:~0,2%"
    set "report_file=SMART_Report_!datestamp!.txt"
    powershell -NoProfile -Command "Get-PhysicalDisk | Format-List *" > "!report_file!"
    echo.
    echo !STR_REPORT_SAVED! !report_file!
)
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:menu_cleanup
cls
echo === Disk Assistant CLI - !STR_MENU6! ===
echo.
echo !STR_CLEANUP_DESC!
echo.
echo !STR_CLEANUP_START!
echo.
echo Cleaning %TEMP%...
del /q /s "%TEMP%\*" >nul 2>&1
echo Cleaning Windows\Temp...
del /q /s "%SystemRoot%\Temp\*" >nul 2>&1
echo Cleaning Prefetch...
del /q /s "%SystemRoot%\Prefetch\*" >nul 2>&1
echo Cleaning Recent files...
del /q /s "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1
echo !STR_WU_CACHE!...
net stop wuauserv >nul 2>&1
del /q /s "%SystemRoot%\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1
echo !STR_WU_CLEANED!

echo.
echo !STR_CLEANUP_DONE!
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:menu_winre
cls
echo === Disk Assistant CLI - !STR_WINRE_TITLE! ===
echo.
echo !STR_WINRE1!
echo !STR_WINRE2!
echo !STR_WINRE3!
echo !STR_WINRE4!
echo !STR_WINRE5!
echo !STR_WINRE6!
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:menu_diskusage
cls
echo === Disk Assistant CLI - !STR_MENU8! ===
echo.
echo !STR_USAGE_DESC!
echo.
echo Drive   Used Space   Free Space   Usage
echo ==========================================================

powershell -NoProfile -Command ^
    "Get-Volume | Where-Object DriveLetter | ForEach-Object { " ^
    "$drive = $_.DriveLetter; " ^
    "$size = [math]::Round($_.Size / 1GB, 2); " ^
    "$free = [math]::Round($_.SizeRemaining / 1GB, 2); " ^
    "$used = [math]::Round(($_.Size - $_.SizeRemaining) / 1GB, 2); " ^
    "$pct = if ($size -gt 0) { [math]::Round(($used / $size) * 100, 1) } else { 0 }; " ^
    "Write-Host ('{0,-8}{1,-13}{2,-13}{3}%%' -f \"$drive:\", \"$used GB\", \"$free GB\", $pct)" ^
    "}"

echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:menu_emptyfolders
cls
echo === Disk Assistant CLI - !STR_MENU9! ===
echo.
echo !STR_EMPTY_DESC!
echo.
powershell -NoProfile -Command "Get-Volume | Where-Object DriveLetter | Format-Table DriveLetter, @{N='SizeGB';E={[math]::Round($_.Size/1GB,1)}} -AutoSize"
echo.
echo !STR_BACK!
set /p "drive_letter=!STR_SELECT_DRIVE! (C, D, E, etc.): "

if /I "!drive_letter!"=="b" goto main_menu

set "drive_letter=!drive_letter:~0,1!"
echo !drive_letter!| findstr /rx "[A-Za-z]" >nul || (
    echo !STR_INVALID_NUM!
    timeout /t 2 >nul
    goto menu_emptyfolders
)

echo.
echo Scanning !drive_letter!: for empty folders...
echo This may take a few minutes.
echo.

powershell -NoProfile -Command ^
    "$empty = Get-ChildItem -Path \"!drive_letter!:\\\" -Recurse -Directory -ErrorAction SilentlyContinue | " ^
    "    Where-Object { (Get-ChildItem -Path $_.FullName -Recurse -File -ErrorAction SilentlyContinue).Count -eq 0 }; " ^
    "if ($empty) { " ^
    "    $empty | Select-Object FullName " ^
    "} else { " ^
    "    Write-Host '!STR_NO_EMPTY!' " ^
    "}"
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:menu_repair
cls
echo === Disk Assistant CLI - !STR_MENU10! ===
echo.
echo !STR_REPAIR_DESC!
echo.
echo [1] SFC /SCANNOW
echo     !STR_SFC_DESC!
echo.
echo [2] DISM /RestoreHealth
echo     !STR_DISM_DESC!
echo.
echo !STR_BACK!
set /p "repair_choice=Select repair tool [1-2]: "

if /I "!repair_choice!"=="b" goto main_menu

if "!repair_choice!"=="1" (
    cls
    echo === SFC /SCANNOW ===
    echo.
    echo Scanning and repairing protected Windows files...
    echo This may take 10-15 minutes.
    echo.
    sfc /scannow
    echo.
    echo !STR_PRESS_KEY!
    pause >nul
    goto main_menu
) else if "!repair_choice!"=="2" (
    cls
    echo === DISM /RestoreHealth ===
    echo.
    echo Repairing Windows image using Windows Update...
    echo This may take 10-20 minutes.
    echo.
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    echo !STR_PRESS_KEY!
    pause >nul
    goto main_menu
) else (
    echo !STR_INVALID!
    timeout /t 2 >nul
    goto menu_repair
)

:menu_bin
cls
echo === Disk Assistant CLI - !STR_MENU11! ===
echo.
echo !STR_BIN_DESC!
echo.
echo !STR_BIN_CLEAN!...
echo.
powershell -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo !STR_BIN_CLEANED!
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu
