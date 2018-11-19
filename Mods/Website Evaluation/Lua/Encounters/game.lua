currentstate = "NONE"
encountertext = "Websites are\rsometimes evil."
wavetimer = 20000.0
arenasize = {155, 130}

enemies = {"keebler"}
enemypositions = {{0, -60}}

function Update()
	if items.inmenu then
		items.Update()
	end
end

function EnteringState(new, old)
	currentstate = new
	if new == "ITEMMENU" then
		items.OpenItemMenu()
	end
end

function EncounterStarting()
	items = require "Libraries/itemsmenu"
end

function EnemyDialogueStarting()
	possible_attacks = {"c", "r", "a", "a2", "p"}
	nextwaves = {possible_attacks[math.random(#possible_attacks)]}
end

function EnemyDialogueEnding()
end

function DefenseEnding()
	encountertext = RandomEncounterText()
end

function HandleSpare()
	State("ENEMYDIALOGUE")
end

function HandleItem(id)
	BattleDialog({"You ate a "..id})
end