--[[
//Programmed by vamik64

Usage:

--~~
function MorseCodeTranslator.ToMorse(str) (str = string)
[Returns a conversion from string to morse code
in order, returns a table.]
--~~

--~~
function MorseCodeTranslator.ToString(morse) (morse = table containing morse code, example {"....", ".."}
[Returns a conversion from morse code to string
the conversion is a table]
--~~

Examples:

MorseCodeTranslator.ToMorse("Hello World!")
returns {"....", ".", ".-..", ".-..", "---", "/" ".--" "---" ".-." ".-.." "-.." "-.-.--"}

MorseCodeTranslator.ToString("....", "..")
returns {"H", "I"}
	
--]]

local mct = {}
local alphabet = {
	A = ".-";
	B = "-...";
	C = "-.-.";
	D = "-..";
	E = ".";
	F = "..-.";
	G = "--.";
	H = "....";
	I = "..";
	J = ".---";
	K = "-.-";
	L = ".-..";
	M = "--";
	N = "-.";
	O = "---";
	P = ".--.";
	Q = "--.-";
	R = ".-.";
	S = "...";
	T = "-";
	U = "..-";
	V = "...-";
	W = ".--";
	X = "-..-";
	Y = "-.--";
	Z = "--..";
	["1"] = ".----";
	["2"] = "..---";
	["3"] = "...--";
	["4"] = "....-";
	["5"] = ".....";
	["6"] = "-....";
	["7"] = "--...";
	["8"] = "---..";
	["9"] = "----.";
	["0"] = "-----";
	["."] = ".-.-.-";
	[","] = "--..--";
	["?"] = "..--..";
	["/"] = "-..-.";
	["@"] = ".--.-.";
	["!"] = "-.-.--"
	[" "] = "/"
	["&"] = ".-..."
	["("] = "-.--."
	[")"] = "-.--.-"
	
}

function mct.ToMorse(str)
	local tab = {}
	for i = 1, #str do
		local cr = string.sub(str, i, i):upper()
		for let, mor in pairs(alphabet) do
			if let == cr then
				table.insert(tab, mor)
			end
		end
	end
	return tab
end

function mct.ToString(morse)
	local tab = {}
	for num = 1, #morse do
		for let, mor in pairs(alphabet) do
			if morse[num] == mor then
				table.insert(tab, let)
			end
		end
	end
	return tab
end

return mct
