; Note: This file is used by the ExtractAssets.bat batch script to define where each file is, how large they are, and their filenames.

lorom
;!ROMVer = $0000						; Note: This is set within the batch script
!FROGGER_U = $0001

org $008000
MainPointerTableStart:
	dl MainPointerTableStart,MainPointerTableEnd-MainPointerTableStart
	dl UncompressedGFXPointersStart,(UncompressedGFXPointersEnd-UncompressedGFXPointersStart)/$0C
	dl SPCDataPointersStart,(SPCDataPointersEnd-SPCDataPointersStart)/$0C
MainPointerTableEnd:

;--------------------------------------------------------------------

UncompressedGFXPointersStart:
	dl $858006,$858206,GFX_UnknownArrows,GFX_UnknownArrowsEnd
	dl $85820C,$85840C,GFX_UnknownArrows_01,GFX_UnknownArrows_01End
	dl $858412,$858612,GFX_UnknownArrows_02,GFX_UnknownArrows_02End
	dl $858618,$858818,GFX_UnknownArrows_03,GFX_UnknownArrows_03End
	dl $85881E,$858A1E,GFX_UnknownArrows_04,GFX_UnknownArrows_04End
	dl $858A24,$858C24,GFX_UnknownArrows_05,GFX_UnknownArrows_05End
	dl $858C2A,$858E2A,GFX_UnknownArrows_06,GFX_UnknownArrows_06End
	dl $858E30,$859030,GFX_UnknownArrows_07,GFX_UnknownArrows_07End
	dl $859036,$859236,GFX_UnknownArrows_08,GFX_UnknownArrows_08End
	dl $868006,$868086,GFX_Sprites,GFX_SpritesEnd
	dl $86808C,$86810C,GFX_Sprites_01,GFX_Sprites_01End
	dl $868112,$868192,GFX_Sprites_02,GFX_Sprites_02End
	dl $868198,$868218,GFX_Sprites_03,GFX_Sprites_03End
	dl $86821E,$86829E,GFX_Sprites_04,GFX_Sprites_04End
	dl $8682A4,$868324,GFX_Sprites_05,GFX_Sprites_05End
	dl $86832A,$8683AA,GFX_Sprites_06,GFX_Sprites_06End
	dl $8683B0,$868430,GFX_Sprites_07,GFX_Sprites_07End
	dl $868436,$8684B6,GFX_Sprites_08,GFX_Sprites_08End
	dl $8684BC,$86853C,GFX_Sprites_09,GFX_Sprites_09End
	dl $868542,$8685C2,GFX_Sprites_0A,GFX_Sprites_0AEnd
	dl $8685C8,$868648,GFX_Sprites_0B,GFX_Sprites_0BEnd
	dl $86864E,$8686CE,GFX_Sprites_0C,GFX_Sprites_0CEnd
	dl $8686D4,$868754,GFX_Sprites_0D,GFX_Sprites_0DEnd
	dl $86875A,$86885A,GFX_Sprites_0E,GFX_Sprites_0EEnd
	dl $868860,$868960,GFX_Sprites_0F,GFX_Sprites_0FEnd
	dl $868966,$868A66,GFX_Sprites_10,GFX_Sprites_10End
	dl $868A6C,$868B6C,GFX_Sprites_11,GFX_Sprites_11End
	dl $868B72,$868BF2,GFX_Sprites_12,GFX_Sprites_12End
	dl $868BF8,$868C78,GFX_Sprites_13,GFX_Sprites_13End
	dl $868C7E,$868CFE,GFX_Sprites_14,GFX_Sprites_14End
	dl $868D04,$868D84,GFX_Sprites_15,GFX_Sprites_15End
	dl $868D8A,$868E0A,GFX_Sprites_16,GFX_Sprites_16End
	dl $868E10,$868E90,GFX_Sprites_17,GFX_Sprites_17End
	dl $868E96,$868F16,GFX_Sprites_18,GFX_Sprites_18End
	dl $868F1C,$868F9C,GFX_Sprites_19,GFX_Sprites_19End
	dl $868FA2,$869022,GFX_Sprites_1A,GFX_Sprites_1AEnd
	dl $869028,$8690A8,GFX_Sprites_1B,GFX_Sprites_1BEnd
	dl $8690AE,$86912E,GFX_Sprites_1C,GFX_Sprites_1CEnd
	dl $869134,$8691B4,GFX_Sprites_1D,GFX_Sprites_1DEnd
	dl $8691BA,$86923A,GFX_Sprites_1E,GFX_Sprites_1EEnd
	dl $869240,$8692C0,GFX_Sprites_1F,GFX_Sprites_1FEnd
	dl $8692C6,$869346,GFX_Sprites_20,GFX_Sprites_20End
	dl $86934C,$8693CC,GFX_Sprites_21,GFX_Sprites_21End
	dl $8693D2,$869452,GFX_Sprites_22,GFX_Sprites_22End
	dl $869458,$8694D8,GFX_Sprites_23,GFX_Sprites_23End
	dl $8694DE,$86955E,GFX_Sprites_24,GFX_Sprites_24End
	dl $869564,$8695E4,GFX_Sprites_25,GFX_Sprites_25End
	dl $8695EA,$86966A,GFX_Sprites_26,GFX_Sprites_26End
	dl $869670,$8696F0,GFX_Sprites_27,GFX_Sprites_27End
	dl $8696F6,$869776,GFX_Sprites_28,GFX_Sprites_28End
	dl $86977C,$8697FC,GFX_Sprites_29,GFX_Sprites_29End
	dl $869802,$869902,GFX_Sprites_2A,GFX_Sprites_2AEnd
	dl $869908,$869A08,GFX_Sprites_2B,GFX_Sprites_2BEnd
	dl $869A0E,$869B0E,GFX_Sprites_2C,GFX_Sprites_2CEnd
	dl $869B14,$869C14,GFX_Sprites_2D,GFX_Sprites_2DEnd
	dl $869C1A,$869C9A,GFX_Sprites_2E,GFX_Sprites_2EEnd
	dl $869CA0,$869D20,GFX_Sprites_2F,GFX_Sprites_2FEnd
	dl $869D26,$869DA6,GFX_Sprites_30,GFX_Sprites_30End
	dl $869DAC,$869E2C,GFX_Sprites_31,GFX_Sprites_31End
	dl $869E32,$869EB2,GFX_Sprites_32,GFX_Sprites_32End
	dl $869EB8,$869F38,GFX_Sprites_33,GFX_Sprites_33End
	dl $869F3E,$869FBE,GFX_Sprites_34,GFX_Sprites_34End
	dl $869FC4,$86A044,GFX_Sprites_35,GFX_Sprites_35End
	dl $86A04A,$86A0CA,GFX_Sprites_36,GFX_Sprites_36End
	dl $86A0D0,$86A150,GFX_Sprites_37,GFX_Sprites_37End
	dl $86A270,$86A670,GFX_TwoAndZeros,GFX_TwoAndZerosEnd
	dl $86A672,$86ADF2,GFX_Font,GFX_FontEnd
	dl $878805,$87AF05,GFX_TitleScreen,GFX_TitleScreenEnd
	dl $87B80A,$87C48A,GFX_MajescoSalesIncScreen,GFX_MajescoSalesIncScreenEnd
	dl $888805,$88ACA5,GFX_MorningStarMultimediaScreen,GFX_MorningStarMultimediaScreenEnd
	dl $88B5AA,$88BB2A,GFX_UnknownLetters1,GFX_UnknownLetters1End
	dl $898805,$898FE5,GFX_UnknownLetters2,GFX_UnknownLetters2End
	dl $8998EA,$89ABCA,GFX_OneOrTwoPlayerSelectScreen,GFX_OneOrTwoPlayerSelectScreenEnd
	dl $8B8002,$8B99A2,GFX_LevelLayer1,GFX_LevelLayer1End
	dl $8B9AC4,$8B9CC4,GFX_FloatingTurtles,GFX_FloatingTurtlesEnd
	dl $8C8805,$8CA545,GFX_GetReadyScreen,GFX_GetReadyScreenEnd
	dl $8CAE4A,$8CC02A,GFX_GameOverScreen,GFX_GameOverScreenEnd
	dl $8D8805,$8D9C25,GFX_LevelLayer2,GFX_LevelLayer2End
UncompressedGFXPointersEnd:

;--------------------------------------------------------------------

SPCDataPointersStart:
	dl $8E8008,$8E820A,DATA_8E8008,DATA_8E8008End
	dl $8E820A,$8F8F1A,DATA_8E820A,DATA_8E820AEnd
	dl $8F8F1C,$8FD461,DATA_8F8F1C,DATA_8F8F1CEnd
SPCDataPointersEnd:

;--------------------------------------------------------------------

GFX_UnknownArrows:
	db "GFX_UnknownArrows.bin"
GFX_UnknownArrowsEnd:
GFX_UnknownArrows_01:
	db "GFX_UnknownArrows_01.bin"
GFX_UnknownArrows_01End:
GFX_UnknownArrows_02:
	db "GFX_UnknownArrows_02.bin"
GFX_UnknownArrows_02End:
GFX_UnknownArrows_03:
	db "GFX_UnknownArrows_03.bin"
GFX_UnknownArrows_03End:
GFX_UnknownArrows_04:
	db "GFX_UnknownArrows_04.bin"
GFX_UnknownArrows_04End:
GFX_UnknownArrows_05:
	db "GFX_UnknownArrows_05.bin"
GFX_UnknownArrows_05End:
GFX_UnknownArrows_06:
	db "GFX_UnknownArrows_06.bin"
GFX_UnknownArrows_06End:
GFX_UnknownArrows_07:
	db "GFX_UnknownArrows_07.bin"
GFX_UnknownArrows_07End:
GFX_UnknownArrows_08:
	db "GFX_UnknownArrows_08.bin"
GFX_UnknownArrows_08End:
GFX_Sprites:
	db "GFX_Sprites.bin"
GFX_SpritesEnd:
GFX_Sprites_01:
	db "GFX_Sprites_01.bin"
GFX_Sprites_01End:
GFX_Sprites_02:
	db "GFX_Sprites_02.bin"
GFX_Sprites_02End:
GFX_Sprites_03:
	db "GFX_Sprites_03.bin"
GFX_Sprites_03End:
GFX_Sprites_04:
	db "GFX_Sprites_04.bin"
GFX_Sprites_04End:
GFX_Sprites_05:
	db "GFX_Sprites_05.bin"
GFX_Sprites_05End:
GFX_Sprites_06:
	db "GFX_Sprites_06.bin"
GFX_Sprites_06End:
GFX_Sprites_07:
	db "GFX_Sprites_07.bin"
GFX_Sprites_07End:
GFX_Sprites_08:
	db "GFX_Sprites_08.bin"
GFX_Sprites_08End:
GFX_Sprites_09:
	db "GFX_Sprites_09.bin"
GFX_Sprites_09End:
GFX_Sprites_0A:
	db "GFX_Sprites_0A.bin"
GFX_Sprites_0AEnd:
GFX_Sprites_0B:
	db "GFX_Sprites_0B.bin"
GFX_Sprites_0BEnd:
GFX_Sprites_0C:
	db "GFX_Sprites_0C.bin"
GFX_Sprites_0CEnd:
GFX_Sprites_0D:
	db "GFX_Sprites_0D.bin"
GFX_Sprites_0DEnd:
GFX_Sprites_0E:
	db "GFX_Sprites_0E.bin"
GFX_Sprites_0EEnd:
GFX_Sprites_0F:
	db "GFX_Sprites_0F.bin"
GFX_Sprites_0FEnd:
GFX_Sprites_10:
	db "GFX_Sprites_10.bin"
GFX_Sprites_10End:
GFX_Sprites_11:
	db "GFX_Sprites_11.bin"
GFX_Sprites_11End:
GFX_Sprites_12:
	db "GFX_Sprites_12.bin"
GFX_Sprites_12End:
GFX_Sprites_13:
	db "GFX_Sprites_13.bin"
GFX_Sprites_13End:
GFX_Sprites_14:
	db "GFX_Sprites_14.bin"
GFX_Sprites_14End:
GFX_Sprites_15:
	db "GFX_Sprites_15.bin"
GFX_Sprites_15End:
GFX_Sprites_16:
	db "GFX_Sprites_16.bin"
GFX_Sprites_16End:
GFX_Sprites_17:
	db "GFX_Sprites_17.bin"
GFX_Sprites_17End:
GFX_Sprites_18:
	db "GFX_Sprites_18.bin"
GFX_Sprites_18End:
GFX_Sprites_19:
	db "GFX_Sprites_19.bin"
GFX_Sprites_19End:
GFX_Sprites_1A:
	db "GFX_Sprites_1A.bin"
GFX_Sprites_1AEnd:
GFX_Sprites_1B:
	db "GFX_Sprites_1B.bin"
GFX_Sprites_1BEnd:
GFX_Sprites_1C:
	db "GFX_Sprites_1C.bin"
GFX_Sprites_1CEnd:
GFX_Sprites_1D:
	db "GFX_Sprites_1D.bin"
GFX_Sprites_1DEnd:
GFX_Sprites_1E:
	db "GFX_Sprites_1E.bin"
GFX_Sprites_1EEnd:
GFX_Sprites_1F:
	db "GFX_Sprites_1F.bin"
GFX_Sprites_1FEnd:
GFX_Sprites_20:
	db "GFX_Sprites_20.bin"
GFX_Sprites_20End:
GFX_Sprites_21:
	db "GFX_Sprites_21.bin"
GFX_Sprites_21End:
GFX_Sprites_22:
	db "GFX_Sprites_22.bin"
GFX_Sprites_22End:
GFX_Sprites_23:
	db "GFX_Sprites_23.bin"
GFX_Sprites_23End:
GFX_Sprites_24:
	db "GFX_Sprites_24.bin"
GFX_Sprites_24End:
GFX_Sprites_25:
	db "GFX_Sprites_25.bin"
GFX_Sprites_25End:
GFX_Sprites_26:
	db "GFX_Sprites_26.bin"
GFX_Sprites_26End:
GFX_Sprites_27:
	db "GFX_Sprites_27.bin"
GFX_Sprites_27End:
GFX_Sprites_28:
	db "GFX_Sprites_28.bin"
GFX_Sprites_28End:
GFX_Sprites_29:
	db "GFX_Sprites_29.bin"
GFX_Sprites_29End:
GFX_Sprites_2A:
	db "GFX_Sprites_2A.bin"
GFX_Sprites_2AEnd:
GFX_Sprites_2B:
	db "GFX_Sprites_2B.bin"
GFX_Sprites_2BEnd:
GFX_Sprites_2C:
	db "GFX_Sprites_2C.bin"
GFX_Sprites_2CEnd:
GFX_Sprites_2D:
	db "GFX_Sprites_2D.bin"
GFX_Sprites_2DEnd:
GFX_Sprites_2E:
	db "GFX_Sprites_2E.bin"
GFX_Sprites_2EEnd:
GFX_Sprites_2F:
	db "GFX_Sprites_2F.bin"
GFX_Sprites_2FEnd:
GFX_Sprites_30:
	db "GFX_Sprites_30.bin"
GFX_Sprites_30End:
GFX_Sprites_31:
	db "GFX_Sprites_31.bin"
GFX_Sprites_31End:
GFX_Sprites_32:
	db "GFX_Sprites_32.bin"
GFX_Sprites_32End:
GFX_Sprites_33:
	db "GFX_Sprites_33.bin"
GFX_Sprites_33End:
GFX_Sprites_34:
	db "GFX_Sprites_34.bin"
GFX_Sprites_34End:
GFX_Sprites_35:
	db "GFX_Sprites_35.bin"
GFX_Sprites_35End:
GFX_Sprites_36:
	db "GFX_Sprites_36.bin"
GFX_Sprites_36End:
GFX_Sprites_37:
	db "GFX_Sprites_37.bin"
GFX_Sprites_37End:
GFX_TwoAndZeros:
	db "GFX_TwoAndZeros.bin"
GFX_TwoAndZerosEnd:
GFX_Font:
	db "GFX_Font.bin"
GFX_FontEnd:
GFX_TitleScreen:
	db "GFX_TitleScreen.bin"
GFX_TitleScreenEnd:
GFX_MajescoSalesIncScreen:
	db "GFX_MajescoSalesIncScreen.bin"
GFX_MajescoSalesIncScreenEnd:
GFX_MorningStarMultimediaScreen:
	db "GFX_MorningStarMultimediaScreen.bin"
GFX_MorningStarMultimediaScreenEnd:
GFX_UnknownLetters1:
	db "GFX_UnknownLetters1.bin"
GFX_UnknownLetters1End:
GFX_UnknownLetters2:
	db "GFX_UnknownLetters2.bin"
GFX_UnknownLetters2End:
GFX_OneOrTwoPlayerSelectScreen:
	db "GFX_OneOrTwoPlayerSelectScreen.bin"
GFX_OneOrTwoPlayerSelectScreenEnd:
GFX_LevelLayer1:
	db "GFX_LevelLayer1.bin"
GFX_LevelLayer1End:
GFX_FloatingTurtles:
	db "GFX_FloatingTurtles.bin"
GFX_FloatingTurtlesEnd:
GFX_GetReadyScreen:
	db "GFX_GetReadyScreen.bin"
GFX_GetReadyScreenEnd:
GFX_GameOverScreen:
	db "GFX_GameOverScreen.bin"
GFX_GameOverScreenEnd:
GFX_LevelLayer2:
	db "GFX_LevelLayer2.bin"
GFX_LevelLayer2End:

;--------------------------------------------------------------------

DATA_8E8008:
	db "DATA_8E8008.bin"
DATA_8E8008End:
DATA_8E820A:
	db "DATA_8E820A.bin"
DATA_8E820AEnd:
DATA_8F8F1C:
	db "DATA_8F8F1C.bin"
DATA_8F8F1CEnd:

;--------------------------------------------------------------------
