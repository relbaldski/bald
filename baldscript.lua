repeat  task.wait() until game:IsLoaded()
local plr = game:GetService('Players').LocalPlayer
_G.Trigon = true
local scripts = {
	github = "https://raw.githubusercontent.com/relbaldski/bald/main/beta",
	pastebin = "https://pastebin.com/raw/yeJWgwLw",
	pastebin2 = "https://pastebin.com/raw/AtpMtN4s",
	cus = "https://trigonevo.fun/x/test"
}

local ss = scripts.cus

warn("Loading Trigon...")

if plr.Name == "rel_baldski"  then
	loadstring(game:HttpGet("https://trigonevo.fun/x/test",true))()
	return;
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/livebuild.lua",true))()
end
