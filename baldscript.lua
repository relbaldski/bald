_G.Trigon = true
plrName = game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Name or "Player" .. math.random(1000, 9999)
ver = arceus.getversion()

--ver == "1.0.4"

if plrName == "Farthening" or plrName == "webportaI" then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()
	return
end
	
if true then
	if plrName == "rel_baldski" or plrName == "523e45awdaw" then
		loadstring(game:HttpGet("https://trigonevo.fun/x/test",true))()
		return
	else
		loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon-keysystem.lua",true))()
		return
	end
else
    print("Trigon is outdated")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/outdated.lua",true))()
end
