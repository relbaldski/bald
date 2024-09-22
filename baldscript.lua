warn("Loading Trigon...")
--repeat  task.wait() until game:IsLoaded()
_G.Trigon = true
player = game.Players.LocalPlayer 
ver = arceus.getversion()

--ver == "1.0.4"
if true then
	if player.Name == "rel_baldski" or player.Name == "lukaku_208" then
	    print("loading test version..")
		loadstring(game:HttpGet("https://trigonevo.fun/x/test",true))()
		return
	else
		loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon-keysystem.lua",true))()
		--loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/beta",true))()
		return
	end
else
    print("Trigon is outdated")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/outdated.lua",true))()
end
