Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = Config or {}

Config.Locations = {
    ["decrypt"] = {
        coords = {x = 1276.21, y = -1709.88, z = 54.57, h = 305.5, r = 1.0},
    },
}

Config.Decrypting = {
	RebootInfo = {
		state = false,
		percentage = 0,
	}
}

Config.Tier1 = {
	[1] = "Bring the pilot to 2135.79 4777.72 for some good fun", --cokerun
	[2] = "Some shady individuals have been spotted melting jewellery at the Grand Banks Steeling factory", --smelting
	[3] = "I found some chatter about methdealers. There are two Shady Tree Farm warehouses in Grapeseed", --mobilemeth
	[4] = "You can sell gold bars at the $F.T. Pawnshop by Clinton Ave.", --goldbars
	[5] = "Bring an advanced lockpick and check if you can break into the houses at North Rockford Dr. There should be some nice loot over there!", --rockford drive villa's houserobbery
	[6] = "You can find me (Ph03nix) by the Vinewood Self Storage", --green laptop
	[7] = "A hacker named Ramsay can be found by docks underneath the Miriam Turner Overpass" -- blue laptop
}
Config.Tier2 = {
	[1] = "I found some security details about the jewellery store, you need to hack the security via the roof. You can unlock the door from the inside with a purple security card, just swipe it", --jewellery
	[2] = "I found files about the installation of a moneywash in the South Side, you can clean your marked bills over there if you have the right key...", --moneywash
	[3] = "Apparently there is a bench made for weapon attchments by the docks...", --attachmentcrafting
	[4] = "I found recent photographs of a famous firearms expert at a small hut in the mountains, who was presumed dead.", --gunrepair
	[5] = "A hacker named Plague can be found by a caravan on the road behind Route 68" -- red laptop
}
Config.Tier3 = {
	[1] = "I found some encrypted messages about drugdealers holding a weedfarm inside a lab", --weedlab
	[2] = "I found some encrypted emails about a cocaine lab in the city of Los Santos", --cokelab
	[3] = "I found messages concerning a meth lab in the middle of the city", --methlab
	[4] = "A notorious hacker named Trinity can be found by the FridgeIt Ice & Storage Factory" -- gold laptop
}