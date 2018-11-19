comments = {"Purpose. Was it to inform?\nOr to show opinion?", "Authority... who made it?", "Currency... when was it written?"}

dialogbubble = "right"

sprite = "keebler" -- keebler.png
name = "Keebler"

hp = 150
atk = 3
def = 5

canspare = false
cancheck = true
check = "Learn."
currentdialogue = { "It's\n\rimpor-\n\rtant!", "Eval-\n\ruate!" }
c = false
r = false
a = false
a2 = false
p = false
function HandleAttack(status)
    if status == -1 then
        currentdialogue = {"Make sure the info is recent!", "On-topic!", "Is it trustworhy?", "Is it right?", "What is its purpose?"}
	end
end
