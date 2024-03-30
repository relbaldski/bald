repeat  task.wait() until game:IsLoaded()

if game:GetService('Players').LocalPlayer.Name == "rel_baldski" then
	loadstring(game:HttpGet("https://pastebin.com/raw/AtpMtN4s",true))()
	return;
elseif game:GetService('Players').LocalPlayer.Name == "player355games" then
	loadstring(game:HttpGet("https://pastebin.com/raw/NnNF85D7",true))()
	return;
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/livebuild.lua",true))()
end
