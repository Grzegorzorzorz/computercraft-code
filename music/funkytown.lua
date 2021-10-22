--[[ Funkytown: Lipps Inc --]]

--[[ Configuration section --]]

speakerName = "right"
songVolume = 3.0
bpm = 122

--[[ End of configuration --]]

--[[ Notes --]]
G1 = 0.529732
A1 = 0.594604
C2 = 1.414214
E2 = 1.781797
F2 = 1.887749 


function playNote(instrument, volume, pitch)
	peripheral.call(speakerName, "playNote", instrument, volume, pitch)
end

function rest(length)
	for rests = 1, length, 1 do
		sleep(1 / (bpm / 60))
	end
end

function funkySequence()
	playNote("flute", songVolume, C2)
	rest(1)
	playNote("flute", songVolume, C2)
	rest(1)
	playNote("flute", songVolume, A1)
	rest(1)
	playNote("flute", songVolume, C2)
	rest(1)
	playNote("flute", songVolume, G1)
	rest(1)
	playNote("flute", songVolume, G1)
	rest(1)
	playNote("flute", songVolume, C2)
	rest(1)
	playNote("flute", songVolume, F2)
	rest(1)
	playNote("flute", songVolume, E2)
	rest(1)
	playNote("flute", songVolume, C2)
end

function main()
	funkySequence()
	return 0
end

main()

