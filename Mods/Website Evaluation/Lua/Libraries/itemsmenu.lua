local self = {}
self.items = require "Libraries/itemlist"
self.page = 1
function self.Update()
	if Input.Right == 1 then
		if Player.absx == 65 then
			if self.items.items[self.playernum + 1] ~= nil then
				Player.MoveToAbs(321,Player.absy,true)
				self.playernum = self.playernum + 1
			end
		else
			if self.items.items[self.playernum + 3] ~= nil then
				Player.MoveToAbs(65,Player.absy,true)
				self.page = self.page + 1
				self.playernum = self.playernum + 3
				self.UpdateText()
			end
		end
	elseif Input.Left == 1 then
		if Player.absx == 321 then
			if self.items.items[self.playernum - 1] ~= nil then
				Player.MoveToAbs(65,Player.absy,true)
				self.playernum = self.playernum - 1
			end
		else
			if self.items.items[self.playernum - 3] ~= nil then
				Player.MoveToAbs(321,Player.absy,true)
				self.page = self.page - 1
				self.playernum = self.playernum - 3
				self.UpdateText()
			end
		end
	elseif Input.Down == 1 then
		if Player.absy == 190 then
			if self.items.items[self.playernum + 2] ~= nil then
				Player.MoveToAbs(Player.absx,160,true)
				self.playernum = self.playernum + 2
			end
		end
	elseif Input.Up == 1 then
		if Player.absy == 160 then
			if self.items.items[self.playernum - 2] ~= nil then
				Player.MoveToAbs(Player.absx,190,true)
				self.playernum = self.playernum - 2
			end
		end
	elseif Input.Confirm == 1 then
		Audio.PlaySound("menuconfirm")
		self.items.HandleItem(self.playernum)
		self.playernum = 1
		self.page = 1
		self.PlayerMask.Remove()
		self.inmenu = false
	elseif Input.Cancel == 1 then
		self.playernum = 1
		self.page = 1
		self.PlayerMask.Remove()
		self.inmenu = false
		State("ACTIONSELECT")
	end
end
function self.OpenItemMenu()
	if #self.items.items > 0 then
		self.playernum = 1
		self.PlayerMask = CreateProjectile("ut-heart",Player.x,Player.y)
		self.PlayerMask.SetVar("safe",true)
		self.PlayerMask.sprite.color = {1,0,0}
		self.PlayerMask.sprite.SetParent(Player.sprite)
		Player.MoveToAbs(65,190,true)
		self.inmenu = true
		self.UpdateText()
	else
		State("DIALOGRESULT")
		State("ACTIONSELECT")
	end
end
function self.UpdateText()
	self.items.RebuildTable()
	local string = "[noskip][instant][starcolor:000000]"
	local num = #self.items.items ; if num > self.page*4 then ; num = self.page*4 ; end
	local num2 = (self.page-1)*4 + 1
	for i=num2,num do
		if i%2==0 and i > 0 then
			string = string.."\t* "..self.items.items[i].."\r"
		else
			string = string.."* "..self.items.items[i]
		end
	end
	local string2 = ""
	if num-(self.page*4) == -1 or num-(self.page*4) == -2 then
		string2 = "\r"
	elseif num-(self.page*4) == -3 then
		string2 = "\r\r"
	end
	string = string..string2.."\tPAGE "..self.page
	BattleDialog({string})
	State("NONE")
end
function self.UseItem(item)
	self.inmenu = false
end
return self