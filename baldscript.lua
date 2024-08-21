repeat  task.wait() until game:IsLoaded()
local plr = game:GetService('Players').LocalPlayer
warn("Loading Trigon...")
if plr.Name == "rel_baldski"  then
	warn("Trigon Test Branch...")
	--loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/livebuild.lua",true))()
	--loadstring(game:HttpGet("https://pastebin.com/raw/yeJWgwLw",true))()
	loadstring(game:HttpGet("https://trigonevo.fun/x/test",true))()
	--loadstring(game:HttpGet("https://pastebin.com/raw/AtpMtN4s",true))()
	return;
elseif plr.Name == "player355games" then
	loadstring(game:HttpGet("https://pastebin.com/raw/NnNF85D7",true))()
	return;
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/livebuild.lua",true))()
end
