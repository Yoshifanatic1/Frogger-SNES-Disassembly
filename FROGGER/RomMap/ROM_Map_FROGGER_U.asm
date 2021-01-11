
macro FROGGER_GameSpecificAssemblySettings()
	!ROM_FROGGER_U = $0001							; These defines assign each ROM version with a different bit so version difference checks will work. Do not touch them!

	%SetROMToAssembleForHack(FROGGER_U, !ROMID)
endmacro

macro FROGGER_LoadGameSpecificMainSNESFiles()
	incsrc ../Misc_Defines_FROGGER.asm
	incsrc ../RAM_Map_FROGGER.asm
	incsrc ../Routine_Macros_FROGGER.asm
	incsrc ../SNES_Macros_FROGGER.asm
endmacro

macro FROGGER_LoadGameSpecificMainSPC700Files()
	incsrc ../SPC700/ARAM_Map_FROGGER.asm
	incsrc ../Misc_Defines_FROGGER.asm
	incsrc ../SPC700/SPC700_Macros_FROGGER.asm
endmacro

macro FROGGER_LoadGameSpecificMainExtraHardwareFiles()
endmacro

macro FROGGER_LoadGameSpecificMSU1Files()
endmacro

macro FROGGER_GlobalAssemblySettings()
	!Define_Global_ApplyAsarPatches = !FALSE
	!Define_Global_InsertRATSTags = !TRUE
	!Define_Global_IgnoreCodeAlignments = !FALSE
	!Define_Global_IgnoreOriginalFreespace = !FALSE
	!Define_Global_CompatibleControllers = !Controller_StandardJoypad
	!Define_Global_DisableROMMirroring = !FALSE
	!Define_Global_CartridgeHeaderVersion = $02
	!Define_Global_FixIncorrectChecksumHack = !FALSE
	!Define_Global_ROMFrameworkVer = 1
	!Define_Global_ROMFrameworkSubVer = 0
	!Define_Global_ROMFrameworkSubSubVer = 0
	!Define_Global_AsarChecksum = $0000
	!Define_Global_LicenseeName = "Morning Star Multimedia"
	!Define_Global_DeveloperName = "Majesco Sales"
	!Define_Global_ReleaseDate = "1998"
	!Define_Global_BaseROMMD5Hash = "b51604def7401af4b71cbaa501b2f00e"

	!Define_Global_MakerCode = "5G"
	!Define_Global_GameCode = "AF7E"
	!Define_Global_ReservedSpace = $00,$00,$00,$00,$00,$00
	!Define_Global_ExpansionFlashSize = !ExpansionMemorySize_0KB
	!Define_Global_ExpansionRAMSize = !ExpansionMemorySize_0KB
	!Define_Global_IsSpecialVersion = $00
	!Define_Global_InternalName = "FROGGER              "
	!Define_Global_ROMLayout = !ROMLayout_LoROM_FastROM
	!Define_Global_ROMType = !ROMType_ROM
	!Define_Global_CustomChip = !Chip_None
	!Define_Global_ROMSize = !ROMSize_512KB
	!Define_Global_SRAMSize = !SRAMSize_0KB
	!Define_Global_Region = !Region_NorthAmerica
	!Define_Global_LicenseeID = $33
	!Define_Global_VersionNumber = $00
	!Define_Global_ChecksumCompliment = !Define_Global_Checksum^$FFFF
	!Define_Global_Checksum = $42CB
	!UnusedNativeModeVector1 = $B15C
	!UnusedNativeModeVector2 = $8080
	!NativeModeCOPVector = SNES_Header_0_Unused3
	!NativeModeBRKVector = SNES_Header_0_EmulationModeCOP
	!NativeModeAbortVector = SNES_Header_0_Unused3
	!NativeModeNMIVector = CODE_80FFA8
	!NativeModeResetVector = SNES_Header_0_Unused3
	!NativeModeIRQVector = CODE_80FFAC
	!UnusedEmulationModeVector1 = $005C+((CODE_80D10F&$0000FF)<<8)
	!UnusedEmulationModeVector2 = CODE_80D10F>>8
	!EmulationModeCOPVector = $005C+((CODE_80D0C1&$0000FF)<<8)
	!EmulationModeBRKVector = CODE_80D0C1>>8
	!EmulationModeAbortVector = $0000
	!EmulationModeNMIVector = SNES_Header_0_Unused3
	!EmulationModeResetVector = CODE_8080B1
	!EmulationModeIRQVector = SNES_Header_0_Unused3
	%LoadExtraRAMFile("SRAM_Map_FROGGER.asm")
endmacro

macro FROGGER_LoadROMMap()
	%FROGGERBank80Macros(!BANK_00, !BANK_00)
	%FROGGERBank81Macros(!BANK_01, !BANK_01)
	%FROGGERBank82Macros(!BANK_02, !BANK_02)
	%FROGGERBank83Macros(!BANK_03, !BANK_03)
	%FROGGERBank84Macros(!BANK_04, !BANK_04)
	%FROGGERBank85Macros(!BANK_05, !BANK_05)
	%FROGGERBank86Macros(!BANK_06, !BANK_06)
	%FROGGERBank87Macros(!BANK_07, !BANK_07)
	%FROGGERBank88Macros(!BANK_08, !BANK_08)
	%FROGGERBank89Macros(!BANK_09, !BANK_09)
	%FROGGERBank8AMacros(!BANK_0A, !BANK_0A)
	%FROGGERBank8BMacros(!BANK_0B, !BANK_0B)
	%FROGGERBank8CMacros(!BANK_0C, !BANK_0C)
	%FROGGERBank8DMacros(!BANK_0D, !BANK_0D)
	%FROGGERBank8EMacros(!BANK_0E, !BANK_0E)
	%FROGGERBank8FMacros(!BANK_0F, !BANK_0F)
endmacro
