@echo off
setlocal EnableDelayedExpansion
title Disk Assistant CLI v1.0
chcp 65001 >nul
mode con: cols=100 lines=40

:: ANSI escape setup
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

:: ============================================================
::  LANGUAGE SYSTEM
:: ============================================================
set "LANG=RU"

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
    set "STR_NOT_IMPL=еще не реализовано."
    set "STR_PRESS_KEY=Нажмите любую клавишу для продолжения..."
    set "STR_SELECT_DISK=Выберите номер диска"
    set "STR_NO_DISKS=Диски не найдены!"
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
    set "STR_NOT_IMPL=not implemented yet."
    set "STR_PRESS_KEY=Press any key to continue..."
    set "STR_SELECT_DISK=Select disk number"
    set "STR_NO_DISKS=No disks found!"
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
)

:: ============================================================
::  STAGE 1: SAFETY GATES
:: ============================================================

:: 1.1 Auto-elevate to Administrator
net session >nul 2>&1
if !errorLevel! neq 0 (
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: 1.2 Block silent/argument launch
if not "%~1"=="" (
    echo This tool must be run interactively.
    pause
    exit /b
)

:: 1.3 Detect system disk number
for /f %%i in ('powershell -NoProfile -Command "(Get-Partition -DriveLetter $env:SystemDrive.TrimEnd(':') | Select-Object -First 1).DiskNumber" 2^>nul') do set "SYS_DISK=%%i"
if not defined SYS_DISK set "SYS_DISK=-1"

:: ============================================================
::  STAGE 2: MAIN MENU
:: ============================================================
:main_menu
cls
echo ================================================================================
echo                         Disk Assistant CLI v1.0
echo ================================================================================
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
echo   [0] !STR_MENU0!
echo.
echo ================================================================================
set /p "choice=!STR_SELECT! [0-7]: "

if "!choice!"=="1" goto menu_usb
if "!choice!"=="2" goto menu_hdd
if "!choice!"=="3" goto menu_chkdsk
if "!choice!"=="4" goto menu_readonly
if "!choice!"=="5" goto menu_smart
if "!choice!"=="6" goto menu_cleanup
if "!choice!"=="7" goto menu_winre
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

:: ============================================================
::  [1] USB FORMAT
:: ============================================================
:menu_usb
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

echo.
echo !STR_SEL_FS!
echo   [1] !STR_FS1!
echo   [2] !STR_FS2!
echo   [3] !STR_FS3!
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

:: ============================================================
::  [2] WIPE HDD/SSD
:: ============================================================
:menu_hdd
cls
echo === Disk Assistant CLI - !STR_MENU2! ===
echo.
echo %ESC%[91mWARNING:%ESC%[0m %ESC%[97m!STR_ALL_DATA! !STR_WILL_BE!%ESC%[0m
echo.
powershell -NoProfile -Command "Get-Disk | Where-Object Number -ne !SYS_DISK! | Format-Table Number, FriendlyName, @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}}, BusType -AutoSize"
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

echo.
echo !STR_SCAN_SECOND_OS!
powershell -NoProfile -Command ^
    "$part = Get-Partition -DiskNumber !disknum! -ErrorAction SilentlyContinue | Where-Object Type -eq 'Basic';" ^
    "if ($part) { foreach ($p in $part) { try { $letter = $p.DriveLetter; if ($letter -and (Test-Path \"${letter}:\Windows\" -or Test-Path \"${letter}:\Users\")) { exit 1 } } catch {} } } exit 0" >nul 2>&1
if errorlevel 1 (
    echo %ESC%[91mWARNING:%ESC%[0m !STR_SECOND_OS_FOUND!
    echo !STR_SECOND_OS_WARN!
    set /p "confirm=[Y/N]: "
    if /I not "!confirm!"=="y" goto main_menu
)

echo.
echo !STR_SEL_FS!
echo   [1] !STR_FS1!
echo   [2] !STR_FS2!
echo   [3] !STR_FS3!
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

:: ============================================================
::  [3] CHKDSK
:: ============================================================
:menu_chkdsk
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
chkdsk !letter!: /f /r

echo.
echo !STR_CHKDSK_DONE!
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:: ============================================================
::  [4] READ-ONLY
:: ============================================================
:menu_readonly
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

:: ============================================================
::  [5] S.M.A.R.T.
:: ============================================================
:menu_smart
cls
echo === Disk Assistant CLI - !STR_MENU5! ===
echo.
echo !STR_HEALTH_CHECK!
echo.
powershell -NoProfile -Command "Get-PhysicalDisk | Format-Table FriendlyName, MediaType, BusType, @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}}, HealthStatus, OperationalStatus -AutoSize"
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:: ============================================================
::  [6] CLEANUP
:: ============================================================
:menu_cleanup
cls
echo === Disk Assistant CLI - !STR_MENU6! ===
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
echo Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
del /q /s "%SystemRoot%\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

echo.
echo !STR_CLEANUP_DONE!
echo.
echo !STR_PRESS_KEY!
pause >nul
goto main_menu

:: ============================================================
::  [7] WINRE GUIDE
:: ============================================================
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
