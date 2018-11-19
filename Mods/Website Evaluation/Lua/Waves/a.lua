timer = 0
bullets = {}

locksleft = {}
locksright = {}
locksy = {}

correctAnswer = false
timeOfCorrect = 0

lx = -200
rx = 200

function Update()
	lx = lx + 1
	rx = rx - 1
	if timer == 0 then
		local question = CreateProjectile("accuracyq", 0, 80)
		local relevance = CreateProjectile("relevance", 40, -50)
		relevance.SetVar("quizValue", -1)
		table.insert(bullets, relevance)
		local accuracy = CreateProjectile("accuracy", 40, 50)
		accuracy.SetVar("quizValue", 1)
		table.insert(bullets, accuracy)
		local authenticity = CreateProjectile("authenticity", -40, 50)
		authenticity.SetVar("quizValue", -1)
		table.insert(bullets, authenticity)
		local currency = CreateProjectile("currency", -40, -50)
		currency.SetVar("quizValue", -1)
		table.insert(bullets, currency)
		
		y = 100
		for i=0, 10 do
			local lockl = CreateProjectile("lock", lx, y)
			lockl.SetVar("quizValue", 0)
			table.insert(locksleft, lockl)
			local lockr = CreateProjectile("lock", rx, y)
			lockr.SetVar("quizValue", 0)
			table.insert(locksright, lockr)
			table.insert(locksy, y)
			y = y - 20
		end
	end
	
	for i,v in ipairs(locksleft) do
		v.MoveTo(lx, locksy[i])
	end
	
	for i,v in ipairs(locksright) do
		v.MoveTo(rx, locksy[i]) 
	end
	
	if correctAnswer then
			EndWave()
	end
	
	timer = timer + 1
end

function OnHit(bullet)
	if bullet.GetVar("quizValue") == 0 then
		Player.Hurt(20)
	else if bullet.GetVar("quizValue") == -1 then
		Player.Hurt(7)
	else
		correct = CreateProjectile("correct", -40, 100)
		correctAnswer = true
	end
end
end