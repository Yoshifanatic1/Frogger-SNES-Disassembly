
macro FROGGER_HandleSplitSPCEngine()
if canreadfile2("SPC700/Engine.bin", $0000) == 1
	!FROGGERBank_SPCEngineSize = readfile2("SPC700/Engine.bin", $0000)
	!LoopCounter #= 0
	while !LoopCounter < !FROGGERBank_SPCEngineSize
		if !LoopCounter+$FC >= !FROGGERBank_SPCEngineSize
			dw !FROGGERBank_SPCEngineSize-!LoopCounter
			dw $0700+!LoopCounter
			!TEMP #= !FROGGERBank_SPCEngineSize
			incbin "SPC700/Engine.bin":(!LoopCounter+$04)-(!TEMP+$04)
			!LoopCounter #= (!FROGGERBank_SPCEngineSize-!LoopCounter)+!LoopCounter
		else
			dw $00FC
			dw $0700+!LoopCounter
			incbin "SPC700/Engine.bin":(!LoopCounter+$04)-(!LoopCounter+$0100)
			!LoopCounter #= !LoopCounter+$FC
		endif
	endif
	incbin "SPC700/Engine.bin":(!LoopCounter+$04)-
else
	error "Engine.bin is missing from the SPC700 folder!"
endif
endmacro