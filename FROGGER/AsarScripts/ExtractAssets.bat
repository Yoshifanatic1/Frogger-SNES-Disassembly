@echo off

set PATH="../../Global"
set Input1=
set ROMName=FROGGER.sfc
set MemMap=lorom

setlocal EnableDelayedExpansion

echo To fully extract all files for supported ROMs, you'll need one of the following ROMs in each group:
echo - Uncompressed GFX: Any
echo - Compressed GFX: Any
echo - Samples: Any
echo.

:Start
echo Place a headerless FROGGER ROM named %ROMName% in this folder, then type the number representing what version %ROMName% is.
echo 0 = FROGGER (USA)

:Mode
set /p Input1=""
if exist %ROMName% goto :ROMExists

echo You need to place a FROGGER ROM named %ROMName% in this folder before you can extract any assets^^!
goto :Mode

:ROMExists
if "%Input1%" equ "0" goto :USA

echo %Input1% is not a valid mode.
goto :Mode

:USA
set UGFXLoc="../Graphics"
set SPCDatLoc="../SPC700"
set ROMBit=$0001
goto :BeginExtract

:BeginExtract
set i=0
set PointerSet=0

echo Generating temporary ROM
asar --fix-checksum=off --no-title-check --define ROMVer="%ROMBit%" "AssetPointersAndFiles.asm" TEMP.sfc

CALL :GetLoopIndex
set MaxFileTypes=%Length%
set PointerSet=6

:GetNewLoopIndex
CALL :GetLoopIndex

:ExtractLoop
if %i% equ %Length% goto :NewFileType

CALL :GetGFXFileName
CALL :ExtractFile
set /a i = %i%+1
if exist TEMP1.asm del TEMP1.asm
if exist TEMP2.asm del TEMP2.asm
if exist TEMP3.txt del TEMP3.txt
goto :ExtractLoop

:NewFileType
echo Moving extracted files to appropriate locations
if %PointerSet% equ 6 goto :MoveUGFX
if %PointerSet% equ 12 goto :MoveSPCDat
goto :MoveNothing

:MoveUGFX
CALL :MergeSplitGFX
move "*.bin" %UGFXLoc%
goto :MoveNothing

:MoveSPCDat
move "*.bin" %SPCDatLoc%
goto :MoveNothing

:MoveNothing
set i=0
set /a PointerSet = %PointerSet%+6
if %PointerSet% neq %MaxFileTypes% goto :GetNewLoopIndex
if exist TEMP.sfc del TEMP.sfc

echo Done^^!
goto :Start

EXIT /B %ERRORLEVEL% 

:ExtractFile
echo:%MemMap% >> TEMP1.asm
echo:org $008000 >> TEMP1.asm
echo:check bankcross off >> TEMP1.asm
echo:^^!OffsetStart #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$00+(%i%*$0C)))) >> TEMP1.asm
echo:^^!OffsetEnd #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$03+(%i%*$0C)))) >> TEMP1.asm
echo:incbin %ROMName%:(^^!OffsetStart)-(^^!OffsetEnd) >> TEMP1.asm

echo Extracting %FileName%
asar --fix-checksum=off --no-title-check "TEMP1.asm" %FileName%
EXIT /B 0

:GetGFXFileName
echo:%MemMap% >> TEMP2.asm
echo:org $008000 >> TEMP2.asm
echo:^^!FileNameStart #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$06+(%i%*$0C)))) >> TEMP2.asm
echo:^^!FileNameEnd #= snestopc(readfile3("TEMP.sfc", snestopc(readfile3("TEMP.sfc", snestopc($008000+%PointerSet%))+$09+(%i%*$0C)))) >> TEMP2.asm
echo:incbin TEMP.sfc:(^^!FileNameStart)-(^^!FileNameEnd) >> TEMP2.asm
asar --fix-checksum=off --no-title-check "TEMP2.asm" TEMP3.txt

for /f "delims=" %%x in (TEMP3.txt) do set FileName=%%x

EXIT /B 0

:GetLoopIndex
echo:%MemMap% >> TEMP4.asm
echo:org $008000 >> TEMP4.asm
echo:^^!OnesDigit = 0 >> TEMP4.asm
echo:^^!TensDigit = 0 >> TEMP4.asm
echo:^^!HundredsDigit = 0 >> TEMP4.asm
echo:^^!ThousandsDigit = 0 >> TEMP4.asm
echo:^^!TensDigitSet = 0 >> TEMP4.asm
echo:^^!HundredsDigitSet = 0 >> TEMP4.asm
echo:^^!ThousandsDigitSet = 0 >> TEMP4.asm
echo:^^!Offset #= readfile3("TEMP.sfc", snestopc($008000+%PointerSet%+$03)) >> TEMP4.asm
echo:while ^^!Offset ^> 0 >> TEMP4.asm
::echo:print hex(^^!Offset) >> TEMP4.asm
echo:^^!OnesDigit #= ^^!OnesDigit+1 >> TEMP4.asm
echo:if ^^!OnesDigit == 10 >> TEMP4.asm
echo:^^!OnesDigit #= 0 >> TEMP4.asm
echo:^^!TensDigit #= ^^!TensDigit+1 >> TEMP4.asm
echo:^^!TensDigitSet #= 1 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!TensDigit == 10 >> TEMP4.asm
echo:^^!TensDigit #= 0 >> TEMP4.asm
echo:^^!HundredsDigit #= ^^!HundredsDigit+1 >> TEMP4.asm
echo:^^!HundredsDigitSet #= 1 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!HundredsDigit == 10 >> TEMP4.asm
echo:^^!HundredsDigit #= 0 >> TEMP4.asm
echo:^^!ThousandsDigit #= ^^!ThousandsDigit+1 >> TEMP4.asm
echo:^^!ThousandsDigitSet #= 1 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:^^!Offset #= ^^!Offset-1 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!ThousandsDigitSet == 1 >> TEMP4.asm
echo:db ^^!ThousandsDigit+$30 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!HundredsDigitSet == 1 >> TEMP4.asm
echo:db ^^!HundredsDigit+$30 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:if ^^!TensDigitSet == 1 >> TEMP4.asm
echo:db ^^!TensDigit+$30 >> TEMP4.asm
echo:endif >> TEMP4.asm
echo:db ^^!OnesDigit+$30 >> TEMP4.asm
asar --fix-checksum=off --no-title-check "TEMP4.asm" TEMP5.txt

for /f "delims=" %%x in (TEMP5.txt) do set Length=%%x

if exist TEMP4.asm del TEMP4.asm
if exist TEMP5.txt del TEMP5.txt

EXIT /B 0

:MergeSplitGFX
if not exist "GFX_UnknownArrows.bin" goto :NoSplitGFX1
if not exist "GFX_UnknownArrows_01.bin" goto :NoSplitGFX1
if not exist "GFX_UnknownArrows_02.bin" goto :NoSplitGFX1
if not exist "GFX_UnknownArrows_03.bin" goto :NoSplitGFX1
if not exist "GFX_UnknownArrows_04.bin" goto :NoSplitGFX1
if not exist "GFX_UnknownArrows_05.bin" goto :NoSplitGFX1
if not exist "GFX_UnknownArrows_06.bin" goto :NoSplitGFX1
if not exist "GFX_UnknownArrows_07.bin" goto :NoSplitGFX1
if not exist "GFX_UnknownArrows_08.bin" goto :NoSplitGFX1
echo: Merging GFX_UnknownArrow files

echo:%MemMap% >> TEMP1.asm
echo:^^!Offset #= filesize("GFX_UnknownArrows.bin") >> TEMP1.asm
echo:org $008000+^^!Offset >> TEMP1.asm
echo:incbin GFX_UnknownArrows_01.bin >> TEMP1.asm
echo:incbin GFX_UnknownArrows_02.bin >> TEMP1.asm
echo:incbin GFX_UnknownArrows_03.bin >> TEMP1.asm
echo:incbin GFX_UnknownArrows_04.bin >> TEMP1.asm
echo:incbin GFX_UnknownArrows_05.bin >> TEMP1.asm
echo:incbin GFX_UnknownArrows_06.bin >> TEMP1.asm
echo:incbin GFX_UnknownArrows_07.bin >> TEMP1.asm
echo:incbin GFX_UnknownArrows_08.bin >> TEMP1.asm
asar --fix-checksum=off --no-title-check "TEMP1.asm" "GFX_UnknownArrows.bin"
if exist TEMP1.asm del TEMP1.asm
if exist GFX_UnknownArrows_01.bin del GFX_UnknownArrows_01.bin
if exist GFX_UnknownArrows_02.bin del GFX_UnknownArrows_02.bin
if exist GFX_UnknownArrows_03.bin del GFX_UnknownArrows_03.bin
if exist GFX_UnknownArrows_04.bin del GFX_UnknownArrows_04.bin
if exist GFX_UnknownArrows_05.bin del GFX_UnknownArrows_05.bin
if exist GFX_UnknownArrows_06.bin del GFX_UnknownArrows_06.bin
if exist GFX_UnknownArrows_07.bin del GFX_UnknownArrows_07.bin
if exist GFX_UnknownArrows_08.bin del GFX_UnknownArrows_08.bin
:NoSplitGFX1

if not exist "GFX_Sprites.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_01.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_02.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_03.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_04.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_05.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_06.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_07.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_08.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_09.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_0A.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_0B.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_0C.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_0D.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_0E.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_0F.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_10.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_11.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_12.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_13.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_14.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_15.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_16.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_17.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_18.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_19.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_1A.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_1B.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_1C.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_1D.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_1E.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_1F.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_20.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_21.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_22.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_23.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_24.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_25.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_26.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_27.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_28.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_29.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_2A.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_2B.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_2C.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_2D.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_2E.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_2F.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_30.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_31.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_32.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_33.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_34.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_35.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_36.bin" goto :NoSplitGFX2
if not exist "GFX_Sprites_37.bin" goto :NoSplitGFX2
echo: Merging GFX_Sprites files

echo:%MemMap% >> TEMP1.asm
echo:^^!Offset #= filesize("GFX_Sprites.bin") >> TEMP1.asm
echo:org $008000+^^!Offset >> TEMP1.asm
echo:incbin GFX_Sprites_01.bin >> TEMP1.asm
echo:incbin GFX_Sprites_02.bin >> TEMP1.asm
echo:incbin GFX_Sprites_03.bin >> TEMP1.asm
echo:incbin GFX_Sprites_04.bin >> TEMP1.asm
echo:incbin GFX_Sprites_05.bin >> TEMP1.asm
echo:incbin GFX_Sprites_06.bin >> TEMP1.asm
echo:incbin GFX_Sprites_07.bin >> TEMP1.asm
echo:incbin GFX_Sprites_08.bin >> TEMP1.asm
echo:incbin GFX_Sprites_09.bin >> TEMP1.asm
echo:incbin GFX_Sprites_0A.bin >> TEMP1.asm
echo:incbin GFX_Sprites_0B.bin >> TEMP1.asm
echo:incbin GFX_Sprites_0C.bin >> TEMP1.asm
echo:incbin GFX_Sprites_0D.bin >> TEMP1.asm
echo:incbin GFX_Sprites_0E.bin >> TEMP1.asm
echo:incbin GFX_Sprites_0F.bin >> TEMP1.asm
echo:incbin GFX_Sprites_10.bin >> TEMP1.asm
echo:incbin GFX_Sprites_11.bin >> TEMP1.asm
echo:incbin GFX_Sprites_12.bin >> TEMP1.asm
echo:incbin GFX_Sprites_13.bin >> TEMP1.asm
echo:incbin GFX_Sprites_14.bin >> TEMP1.asm
echo:incbin GFX_Sprites_15.bin >> TEMP1.asm
echo:incbin GFX_Sprites_16.bin >> TEMP1.asm
echo:incbin GFX_Sprites_17.bin >> TEMP1.asm
echo:incbin GFX_Sprites_18.bin >> TEMP1.asm
echo:incbin GFX_Sprites_19.bin >> TEMP1.asm
echo:incbin GFX_Sprites_1A.bin >> TEMP1.asm
echo:incbin GFX_Sprites_1B.bin >> TEMP1.asm
echo:incbin GFX_Sprites_1C.bin >> TEMP1.asm
echo:incbin GFX_Sprites_1D.bin >> TEMP1.asm
echo:incbin GFX_Sprites_1E.bin >> TEMP1.asm
echo:incbin GFX_Sprites_1F.bin >> TEMP1.asm
echo:incbin GFX_Sprites_20.bin >> TEMP1.asm
echo:incbin GFX_Sprites_21.bin >> TEMP1.asm
echo:incbin GFX_Sprites_22.bin >> TEMP1.asm
echo:incbin GFX_Sprites_23.bin >> TEMP1.asm
echo:incbin GFX_Sprites_24.bin >> TEMP1.asm
echo:incbin GFX_Sprites_25.bin >> TEMP1.asm
echo:incbin GFX_Sprites_26.bin >> TEMP1.asm
echo:incbin GFX_Sprites_27.bin >> TEMP1.asm
echo:incbin GFX_Sprites_28.bin >> TEMP1.asm
echo:incbin GFX_Sprites_29.bin >> TEMP1.asm
echo:incbin GFX_Sprites_2A.bin >> TEMP1.asm
echo:incbin GFX_Sprites_2B.bin >> TEMP1.asm
echo:incbin GFX_Sprites_2C.bin >> TEMP1.asm
echo:incbin GFX_Sprites_2D.bin >> TEMP1.asm
echo:incbin GFX_Sprites_2E.bin >> TEMP1.asm
echo:incbin GFX_Sprites_2F.bin >> TEMP1.asm
echo:incbin GFX_Sprites_30.bin >> TEMP1.asm
echo:incbin GFX_Sprites_31.bin >> TEMP1.asm
echo:incbin GFX_Sprites_32.bin >> TEMP1.asm
echo:incbin GFX_Sprites_33.bin >> TEMP1.asm
echo:incbin GFX_Sprites_34.bin >> TEMP1.asm
echo:incbin GFX_Sprites_35.bin >> TEMP1.asm
echo:incbin GFX_Sprites_36.bin >> TEMP1.asm
echo:incbin GFX_Sprites_37.bin >> TEMP1.asm
asar --fix-checksum=off --no-title-check "TEMP1.asm" "GFX_Sprites.bin"
if exist TEMP1.asm del TEMP1.asm
if exist GFX_Sprites_01.bin del GFX_Sprites_01.bin
if exist GFX_Sprites_02.bin del GFX_Sprites_02.bin
if exist GFX_Sprites_03.bin del GFX_Sprites_03.bin
if exist GFX_Sprites_04.bin del GFX_Sprites_04.bin
if exist GFX_Sprites_05.bin del GFX_Sprites_05.bin
if exist GFX_Sprites_06.bin del GFX_Sprites_06.bin
if exist GFX_Sprites_07.bin del GFX_Sprites_07.bin
if exist GFX_Sprites_08.bin del GFX_Sprites_08.bin
if exist GFX_Sprites_09.bin del GFX_Sprites_09.bin
if exist GFX_Sprites_0A.bin del GFX_Sprites_0A.bin
if exist GFX_Sprites_0B.bin del GFX_Sprites_0B.bin
if exist GFX_Sprites_0C.bin del GFX_Sprites_0C.bin
if exist GFX_Sprites_0D.bin del GFX_Sprites_0D.bin
if exist GFX_Sprites_0E.bin del GFX_Sprites_0E.bin
if exist GFX_Sprites_0F.bin del GFX_Sprites_0F.bin
if exist GFX_Sprites_10.bin del GFX_Sprites_10.bin
if exist GFX_Sprites_11.bin del GFX_Sprites_11.bin
if exist GFX_Sprites_12.bin del GFX_Sprites_12.bin
if exist GFX_Sprites_13.bin del GFX_Sprites_13.bin
if exist GFX_Sprites_14.bin del GFX_Sprites_14.bin
if exist GFX_Sprites_15.bin del GFX_Sprites_15.bin
if exist GFX_Sprites_16.bin del GFX_Sprites_16.bin
if exist GFX_Sprites_17.bin del GFX_Sprites_17.bin
if exist GFX_Sprites_18.bin del GFX_Sprites_18.bin
if exist GFX_Sprites_19.bin del GFX_Sprites_19.bin
if exist GFX_Sprites_1A.bin del GFX_Sprites_1A.bin
if exist GFX_Sprites_1B.bin del GFX_Sprites_1B.bin
if exist GFX_Sprites_1C.bin del GFX_Sprites_1C.bin
if exist GFX_Sprites_1D.bin del GFX_Sprites_1D.bin
if exist GFX_Sprites_1E.bin del GFX_Sprites_1E.bin
if exist GFX_Sprites_1F.bin del GFX_Sprites_1F.bin
if exist GFX_Sprites_20.bin del GFX_Sprites_20.bin
if exist GFX_Sprites_21.bin del GFX_Sprites_21.bin
if exist GFX_Sprites_22.bin del GFX_Sprites_22.bin
if exist GFX_Sprites_23.bin del GFX_Sprites_23.bin
if exist GFX_Sprites_24.bin del GFX_Sprites_24.bin
if exist GFX_Sprites_25.bin del GFX_Sprites_25.bin
if exist GFX_Sprites_26.bin del GFX_Sprites_26.bin
if exist GFX_Sprites_27.bin del GFX_Sprites_27.bin
if exist GFX_Sprites_28.bin del GFX_Sprites_28.bin
if exist GFX_Sprites_29.bin del GFX_Sprites_29.bin
if exist GFX_Sprites_2A.bin del GFX_Sprites_2A.bin
if exist GFX_Sprites_2B.bin del GFX_Sprites_2B.bin
if exist GFX_Sprites_2C.bin del GFX_Sprites_2C.bin
if exist GFX_Sprites_2D.bin del GFX_Sprites_2D.bin
if exist GFX_Sprites_2E.bin del GFX_Sprites_2E.bin
if exist GFX_Sprites_2F.bin del GFX_Sprites_2F.bin
if exist GFX_Sprites_30.bin del GFX_Sprites_30.bin
if exist GFX_Sprites_31.bin del GFX_Sprites_31.bin
if exist GFX_Sprites_32.bin del GFX_Sprites_32.bin
if exist GFX_Sprites_33.bin del GFX_Sprites_33.bin
if exist GFX_Sprites_34.bin del GFX_Sprites_34.bin
if exist GFX_Sprites_35.bin del GFX_Sprites_35.bin
if exist GFX_Sprites_36.bin del GFX_Sprites_36.bin
if exist GFX_Sprites_37.bin del GFX_Sprites_37.bin
:NoSplitGFX2

EXIT /B 0
