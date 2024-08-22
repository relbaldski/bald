repeat  task.wait() until game:IsLoaded()
_G.Trigon = true

local usernames = {
    "imhungrylolol20203a", "Jeikaru", "dltngks1234", "Umurs_ALT", "SirUghsALot_1", 
    "jagerclient", "paulusco_levrais", "8i_19f", "iamdaun5", "ofkxdjx_alt1", 
    "ZBGProisaac", "YanDyDka63", "오이", "Shadowstar12", "AdvenchesPley", 
    "Yandudka63", "cetriolo_ocerdy", "CrowzedX", "thinkabtzzuu", "Larissa1973", 
    "akizinho777", "Ihate8230", "Noradrenaline_Test", "m_ybalshurt", "zhopa22899","EPIKGAMINGCHAIR2323",
	"alt_acc2344", "VC_OwA", "ondxv_acc", "namirin1237", "eleornaa01", "extremekidneydisease","TESTSUBJECT08E98", "nictrybrotha",
	"Bjqlechomeur1","jqo1hsudb3ownsb", "tiahh4h","ReapSploitzRBLX","gger_FatNi",
	"rel_baldski"
}

local player = game.Players.LocalPlayer
warn("Loading Trigon...")

for _, username in ipairs(usernames) do
    if player.Name == username or player.DisplayName == username then
		warn("Loading Trigon beta...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/beta",true))()
		return;
    end
end


if player.Name == "rel_baldski"  then
	loadstring(game:HttpGet("https://trigonevo.fun/x/test",true))()
	return;
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/livebuild.lua",true))()
end
