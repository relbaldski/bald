repeat  task.wait() until game:IsLoaded()
local plr = game:GetService('Players').LocalPlayer
_G.Trigon = true
local scripts = {
	github = "https://raw.githubusercontent.com/relbaldski/bald/main/beta",
	pastebin = "https://pastebin.com/raw/yeJWgwLw",
	pastebin2 = "https://pastebin.com/raw/AtpMtN4s",
	cus = "https://arponag.xyz/test"
}

local ss = scripts.cus

warn("Loading Trigon...")

if plr.Name == "rel_baldski"  then
	warn("Trigon Test Branch... "..ss)
	loadstring(game:HttpGet(ss,true))()
	return;
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/livebuild.lua",true))()
end
