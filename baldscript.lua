repeat  task.wait() until game:IsLoaded()
_G.Trigon = true
local player = game.Players.LocalPlayer

warn("Loading Trigon...")

if player.Name == "rel_baldski"  then
	loadstring(game:HttpGet("https://trigonevo.fun/x/test",true))()
	return;
else
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/beta",true))()
	--loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/livebuild.lua",true))()
end
