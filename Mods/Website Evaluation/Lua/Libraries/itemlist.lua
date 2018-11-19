local self = {}
self.items = {"Currency", "Relevance", "Authority", "Accuracy", "Purpose"}
-- self.items = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","Now","I","know","My","A","B","C\'s","next","time","won't","you","sing","with","me?"}
function self.HandleItem(pos)
	local itemname = self.items[pos]
	BattleDialog({"You ate the "..itemname})
	self.RemoveItem(pos)
	Player.hp = Player.hp + 5
	if Player.hp > 20 then
		Player.hp = 20
	end
end
function self.HealAndReturnString(num,sound)
	local string = nil
	if Player.hp + num >= self.GetMaxHP() then
		string = "Your HP was maxed out!"
	else
		string = "You recovered "..num.." HP!"
	end
	Player.hp = Player.hp + num
	if sound ~= nil then
		Audio.PlaySound(sound)
	else
		Audio.PlaySound("healsound")
	end
	return string
end
function self.GetMaxHP()
	if Player.lv < 20 then
		return 16 + (4 * Player.lv)
	elseif Player.lv == 20 then
		return 99
	end
end
function self.RemoveItem(pos)
	table.remove(self.items,pos)--self.items[pos] = nil
end
function self.SwapItems(item,item2)
	for i=1,#self.items do
		if string.upper(self.items[i]) == string.upper(item) then
			self.items[i] = item2
		end
	end
end
function self.RebuildTable()
	local table = {}
	for i=1,#self.items do
		if self.items[i] ~= nil then
			table[#table+1] = self.items[i]
		end
	end

	self.items = table
end
return self