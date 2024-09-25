local HttpService = game:GetService("HttpService")

base64 = {}
b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
ENCRYPTION_KEY = "tK5UTui+DPh8lIlBxya5XVsmeDCoUl6vHhdIESMB6sQ="

function base64.decode(data)
	data = string.gsub(data, '[^'..b..'=]', '')
	return (data:gsub('.', function(x)
		if (x == '=') then return '' end
		r,f='',(b:find(x)-1)
		for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
		return r;
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if (#x ~= 8) then return '' end
		c=0
		for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
		return string.char(c)
	end))
end

function decrypt(encrypted)
	decoded = base64.decode(encrypted)
	decrypted = ""
	for i = 1, #decoded do
		byte = string.byte(decoded, i)
		key_byte = string.byte(ENCRYPTION_KEY, (i - 1) % #ENCRYPTION_KEY + 1)
		decrypted = decrypted .. string.char(bit32.bxor(byte, key_byte))
	end
	return decrypted
end

local function gethwid()
	HWID = game:GetService("RbxAnalyticsService"):GetClientId()
	return tostring(HWID)
end

local function getKeylink()
	return "https://trigonevo.fun/whitelist/?HWID=".. gethwid()
end

local function checkWhitelist()
	local hwid = gethwid()
	local url = "https://trigonevo.fun/whitelist/status.php?HWID=" .. hwid
	local success, response = pcall(function()
		return game:HttpGet(url)
	end)

	if success then
		local decrypted = decrypt(response)
		if decrypted then
			local success, data = pcall(function()
				return HttpService:JSONDecode(decrypted)
			end)
			if success then
				if data.verified then
					return "Your HWID is verified! Expiration date: " .. tostring(data.expiration), true
				else
					return "HWID is not verified", false
				end
			else
				return "Failed to parse the decrypted data", false
			end
		else
			return "Failed to decrypt the response", false
		end
	else
		return "Failed to fetch whitelist status: " .. response, false
	end
end

local stat, verified = checkWhitelist()

if verified then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/beta",true))()
	return

else


	local _trigon =
		{
			Trigon_Whitelist = Instance.new("ScreenGui"),
			Canvas = Instance.new("Frame"),
			copyLink = Instance.new("ImageButton"),
			Main = Instance.new("Frame"),
			TextLabel = Instance.new("TextLabel"),
			UIPadding = Instance.new("UIPadding"),
			Icon = Instance.new("ImageLabel"),
			UICorner = Instance.new("UICorner"),
			logo = Instance.new("ImageLabel"),
			Title = Instance.new("TextLabel"),
			sub2 = Instance.new("TextLabel"),
			sub = Instance.new("TextLabel"),
			CloseBtn = Instance.new("ImageButton"),
			Main_1 = Instance.new("Frame"),
			Icon_1 = Instance.new("ImageLabel"),
			UICorner_1 = Instance.new("UICorner"),
			List = Instance.new("Frame"),
			list_item = Instance.new("Frame"),
			img = Instance.new("ImageLabel"),
			txt = Instance.new("TextLabel"),
			UIPadding_1 = Instance.new("UIPadding"),
			UICorner_2 = Instance.new("UICorner"),
			UIListLayout = Instance.new("UIListLayout"),
			Listx = Instance.new("Frame"),
			list_item_1 = Instance.new("Frame"),
			UICorner_3 = Instance.new("UICorner"),
			UIListLayout_1 = Instance.new("UIListLayout"),
			img_1 = Instance.new("ImageLabel"),
			LocalScript = Instance.new("LocalScript"),
			UIPadding_2 = Instance.new("UIPadding"),
			txt_1 = Instance.new("TextLabel"),
			UIListLayout_2 = Instance.new("UIListLayout"),
			info = Instance.new("TextLabel"),
			UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint"),
			LocalScript_1 = Instance.new("LocalScript"),
			UIStroke = Instance.new("UIStroke")

		}

	_trigon.Trigon_Whitelist.IgnoreGuiInset = true
	_trigon.Trigon_Whitelist.DisplayOrder = -1
	_trigon.Trigon_Whitelist.Name = "Trigon_Whitelist"
	_trigon.Trigon_Whitelist.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	_trigon.Trigon_Whitelist.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	_trigon.Trigon_Whitelist.Parent = gethui()

	_trigon.Canvas.BorderSizePixel = 0
	_trigon.Canvas.BackgroundColor3 = Color3.fromRGB(15, 23, 39)
	_trigon.Canvas.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.Canvas.Size = UDim2.new(1, 0, 1, 0)
	_trigon.Canvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.Canvas.BackgroundTransparency = 0.06
	_trigon.Canvas.Name = "Canvas"
	_trigon.Canvas.Position = UDim2.new(0.5, 0, 0.5, 0)
	_trigon.Canvas.Parent = _trigon.Trigon_Whitelist

	_trigon.copyLink.BorderSizePixel = 0
	_trigon.copyLink.Position = UDim2.new(0.5, 0, 0.86144, 0)
	_trigon.copyLink.BackgroundColor3 = Color3.fromRGB(68, 71, 80)
	_trigon.copyLink.Name = "copyLink"
	_trigon.copyLink.AnchorPoint = Vector2.new(0.5, 0.9)
	_trigon.copyLink.Size = UDim2.new(0.190301, 0, 0.062297, 0)
	_trigon.copyLink.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.copyLink.BackgroundTransparency = 0.75
	_trigon.copyLink.Parent = _trigon.Canvas
	
	_trigon.UIStroke.Color = Color3.fromRGB(98, 104, 116)
	_trigon.UIStroke.Thickness = 2
	_trigon.UIStroke.Parent = _trigon.copyLink


	_trigon.Main.BorderSizePixel = 0
	_trigon.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.Main.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.Main.Size = UDim2.new(0.994505, 0, 0.913044, 0)
	_trigon.Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.Main.BackgroundTransparency = 1
	_trigon.Main.Name = "Main"
	_trigon.Main.Position = UDim2.new(0.502747, 0, 0.5, 0)
	_trigon.Main.Parent = _trigon.copyLink

	_trigon.TextLabel.TextWrapped = true
	_trigon.TextLabel.BorderSizePixel = 0
	_trigon.TextLabel.TextScaled = true
	_trigon.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.TextLabel.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	_trigon.TextLabel.Position = UDim2.new(0.57863, 0, 0.484556, 0)
	_trigon.TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.TextLabel.TextSize = 21
	_trigon.TextLabel.Size = UDim2.new(0.736736, 0, 0.452381, 0)
	_trigon.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.TextLabel.Text = "Copy Whitelist Link"
	_trigon.TextLabel.BackgroundTransparency = 1
	_trigon.TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	_trigon.TextLabel.Parent = _trigon.Main

	_trigon.UIPadding.Parent = _trigon.TextLabel

	_trigon.Icon.ImageColor3 = Color3.fromRGB(231, 231, 231)
	_trigon.Icon.BorderSizePixel = 0
	_trigon.Icon.ScaleType = Enum.ScaleType.Fit
	_trigon.Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.Icon.Position = UDim2.new(0.115661, 0, 0.484019, 0)
	_trigon.Icon.Name = "Icon"
	_trigon.Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.Icon.Image = "rbxassetid://13848618194"
	_trigon.Icon.Size = UDim2.new(0.108524, 0, 1.09524, 0)
	_trigon.Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.Icon.BackgroundTransparency = 1
	_trigon.Icon.Parent = _trigon.Main

	_trigon.UICorner.CornerRadius = UDim.new(0.1, 0)
	_trigon.UICorner.Parent = _trigon.copyLink

	_trigon.logo.BorderSizePixel = 0
	_trigon.logo.ScaleType = Enum.ScaleType.Fit
	_trigon.logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.logo.Position = UDim2.new(0.493907, 0, 0.0619883, 0)
	_trigon.logo.Name = "logo"
	_trigon.logo.AnchorPoint = Vector2.new(0.5, 0)
	_trigon.logo.Image = "rbxassetid://82500352718600"
	_trigon.logo.Size = UDim2.new(0.238998, 0, 0.0830409, 0)
	_trigon.logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.logo.BackgroundTransparency = 1
	_trigon.logo.Parent = _trigon.Canvas

	_trigon.Title.TextWrapped = true
	_trigon.Title.TextScaled = true
	_trigon.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	_trigon.Title.Position = UDim2.new(0.5, 0, 0.2, 0)
	_trigon.Title.Name = "Title"
	_trigon.Title.AnchorPoint = Vector2.new(0.5, 0.2)
	_trigon.Title.TextSize = 14
	_trigon.Title.Size = UDim2.new(0.482036, 0, 0.0760031, 0)
	_trigon.Title.TextColor3 = Color3.fromRGB(240, 240, 240)
	_trigon.Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
	_trigon.Title.Text = "Trigon..."
	_trigon.Title.BackgroundTransparency = 1
	_trigon.Title.Parent = _trigon.Canvas

	_trigon.sub2.TextWrapped = true
	_trigon.sub2.TextScaled = true
	_trigon.sub2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.sub2.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	_trigon.sub2.Position = UDim2.new(0.5, 0, 0.906616, 0)
	_trigon.sub2.Name = "sub2"
	_trigon.sub2.AnchorPoint = Vector2.new(0.5, 0.95)
	_trigon.sub2.TextSize = 14
	_trigon.sub2.Size = UDim2.new(0.482036, 0, 0.0197308, 0)
	_trigon.sub2.TextColor3 = Color3.fromRGB(240, 240, 240)
	_trigon.sub2.BorderColor3 = Color3.fromRGB(27, 42, 53)
	_trigon.sub2.Text = "Support @ discord.gg/trigon"
	_trigon.sub2.BackgroundTransparency = 1
	_trigon.sub2.Parent = _trigon.Canvas

	_trigon.sub.TextWrapped = true
	_trigon.sub.TextScaled = true
	_trigon.sub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.sub.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	_trigon.sub.Position = UDim2.new(0.5, 0, 0.294854, 0)
	_trigon.sub.Name = "sub"
	_trigon.sub.AnchorPoint = Vector2.new(0.5, 0.3)
	_trigon.sub.TextSize = 14
	_trigon.sub.Size = UDim2.new(0.482036, 0, 0.0606309, 0)
	_trigon.sub.TextColor3 = Color3.fromRGB(240, 240, 240)
	_trigon.sub.BorderColor3 = Color3.fromRGB(27, 42, 53)
	_trigon.sub.Text = "Please complete the whitelist process to gain access!"
	_trigon.sub.BackgroundTransparency = 1
	_trigon.sub.Parent = _trigon.Canvas

	_trigon.CloseBtn.BorderSizePixel = 0
	_trigon.CloseBtn.Position = UDim2.new(0.95, 0, 0.05, 0)
	_trigon.CloseBtn.BackgroundColor3 = Color3.fromRGB(221, 221, 245)
	_trigon.CloseBtn.Name = "CloseBtn"
	_trigon.CloseBtn.AnchorPoint = Vector2.new(0.95, 0.05)
	_trigon.CloseBtn.Size = UDim2.new(0.0408389, 0, 0.0688839, 0)
	_trigon.CloseBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.CloseBtn.BackgroundTransparency = 0.98
	_trigon.CloseBtn.Parent = _trigon.Canvas

	_trigon.Main_1.BorderSizePixel = 0
	_trigon.Main_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.Main_1.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.Main_1.Size = UDim2.new(0.994505, 0, 0.913044, 0)
	_trigon.Main_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.Main_1.BackgroundTransparency = 1
	_trigon.Main_1.Name = "Main"
	_trigon.Main_1.Position = UDim2.new(0.502747, 0, 0.5, 0)
	_trigon.Main_1.Parent = _trigon.CloseBtn

	_trigon.Icon_1.ImageColor3 = Color3.fromRGB(231, 231, 231)
	_trigon.Icon_1.BorderSizePixel = 0
	_trigon.Icon_1.ScaleType = Enum.ScaleType.Fit
	_trigon.Icon_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.Icon_1.Position = UDim2.new(0.5, 0, 0.5, 0)
	_trigon.Icon_1.Name = "Icon"
	_trigon.Icon_1.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.Icon_1.Image = "rbxassetid://13857985197"
	_trigon.Icon_1.Size = UDim2.new(0.533237, 0, 1, 0)
	_trigon.Icon_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.Icon_1.BackgroundTransparency = 1
	_trigon.Icon_1.Parent = _trigon.Main_1

	_trigon.UICorner_1.CornerRadius = UDim.new(0.1, 0)
	_trigon.UICorner_1.Parent = _trigon.CloseBtn

	_trigon.List.BorderSizePixel = 0
	_trigon.List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.List.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.List.Size = UDim2.new(0.362221, 0, 0.377778, 0)
	_trigon.List.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.List.BackgroundTransparency = 1
	_trigon.List.Name = "List"
	_trigon.List.Position = UDim2.new(0.5, 0, 0.55848, 0)
	_trigon.List.Parent = _trigon.Canvas

	_trigon.list_item.BorderSizePixel = 0
	_trigon.list_item.BackgroundColor3 = Color3.fromRGB(216, 228, 255)
	_trigon.list_item.Size = UDim2.new(1, 0, 0.14843, 0)
	_trigon.list_item.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.list_item.BackgroundTransparency = 0.95
	_trigon.list_item.Name = "list_item"
	_trigon.list_item.Parent = _trigon.List

	_trigon.img.BorderSizePixel = 0
	_trigon.img.ScaleType = Enum.ScaleType.Fit
	_trigon.img.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.img.ImageTransparency = 0.11
	_trigon.img.Position = UDim2.new(0.0257837, 0, 0.5, 0)
	_trigon.img.Name = "img"
	_trigon.img.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.img.Image = "rbxassetid://81111209361717"
	_trigon.img.Size = UDim2.new(0.048989, 0, 1, 0)
	_trigon.img.BorderColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.img.ZIndex = 2
	_trigon.img.BackgroundTransparency = 1
	_trigon.img.Parent = _trigon.list_item

	_trigon.txt.TextWrapped = true
	_trigon.txt.TextScaled = true
	_trigon.txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.txt.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	_trigon.txt.Position = UDim2.new(0.503935, 0, 0.5, 0)
	_trigon.txt.Name = "txt"
	_trigon.txt.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.txt.TextSize = 14
	_trigon.txt.Size = UDim2.new(0.822274, 0, 0.391942, 0)
	_trigon.txt.TextColor3 = Color3.fromRGB(240, 240, 240)
	_trigon.txt.BorderColor3 = Color3.fromRGB(27, 42, 53)
	_trigon.txt.Text = "Initializing for first time use.."
	_trigon.txt.BackgroundTransparency = 1
	_trigon.txt.TextXAlignment = Enum.TextXAlignment.Left
	_trigon.txt.Parent = _trigon.list_item

	_trigon.UIPadding_1.PaddingLeft = UDim.new(0.05, 0)
	_trigon.UIPadding_1.Parent = _trigon.list_item

	_trigon.UICorner_2.CornerRadius = UDim.new(0.1, 0)
	_trigon.UICorner_2.Parent = _trigon.list_item

	_trigon.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	_trigon.UIListLayout.Padding = UDim.new(0.02, 0)
	_trigon.UIListLayout.Parent = _trigon.List

	_trigon.Listx.BorderSizePixel = 0
	_trigon.Listx.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.Listx.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.Listx.Size = UDim2.new(0.362221, 0, 0.442105, 0)
	_trigon.Listx.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.Listx.BackgroundTransparency = 1
	_trigon.Listx.Visible = false
	_trigon.Listx.Name = "Listx"
	_trigon.Listx.Position = UDim2.new(0.5, 0, 0.590643, 0)
	_trigon.Listx.Parent = _trigon.Canvas

	_trigon.list_item_1.BorderSizePixel = 0
	_trigon.list_item_1.BackgroundColor3 = Color3.fromRGB(216, 228, 255)
	_trigon.list_item_1.Size = UDim2.new(1, 0, 0.11747, 0)
	_trigon.list_item_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.list_item_1.BackgroundTransparency = 0.95
	_trigon.list_item_1.Name = "list_item"
	_trigon.list_item_1.Position = UDim2.new(0.011215, 0, -0.00793651, 0)
	_trigon.list_item_1.Parent = _trigon.Listx

	_trigon.UICorner_3.CornerRadius = UDim.new(0.1, 0)
	_trigon.UICorner_3.Parent = _trigon.list_item_1

	_trigon.UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
	_trigon.UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center
	_trigon.UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
	_trigon.UIListLayout_1.Padding = UDim.new(0.02, 0)
	_trigon.UIListLayout_1.Parent = _trigon.list_item_1

	_trigon.img_1.BorderSizePixel = 0
	_trigon.img_1.ScaleType = Enum.ScaleType.Fit
	_trigon.img_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	_trigon.img_1.ImageTransparency = 0.11
	_trigon.img_1.Position = UDim2.new(0.0257837, 0, 0.5, 0)
	_trigon.img_1.Name = "img"
	_trigon.img_1.AnchorPoint = Vector2.new(0.5, 0.5)
	_trigon.img_1.Image = "rbxassetid://81111209361717"
	_trigon.img_1.Size = UDim2.new(0.0515674, 0, 1, 0)
	_trigon.img_1.BorderColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.img_1.ZIndex = 2
	_trigon.img_1.BackgroundTransparency = 1
	_trigon.img_1.Parent = _trigon.list_item_1

	_trigon.LocalScript.Parent = _trigon.img_1

	_trigon.UIPadding_2.PaddingLeft = UDim.new(0.05, 0)
	_trigon.UIPadding_2.Parent = _trigon.list_item_1

	_trigon.txt_1.TextWrapped = true
	_trigon.txt_1.TextScaled = true
	_trigon.txt_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.txt_1.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	_trigon.txt_1.Position = UDim2.new(0.508278, 0, 0.743936, 0)
	_trigon.txt_1.Name = "txt"
	_trigon.txt_1.AnchorPoint = Vector2.new(0.5, 0.95)
	_trigon.txt_1.TextSize = 14
	_trigon.txt_1.Size = UDim2.new(0.873422, 0, 0.391942, 0)
	_trigon.txt_1.TextColor3 = Color3.fromRGB(240, 240, 240)
	_trigon.txt_1.BorderColor3 = Color3.fromRGB(27, 42, 53)
	_trigon.txt_1.Text = "Initializing for first time use.."
	_trigon.txt_1.BackgroundTransparency = 1
	_trigon.txt_1.TextXAlignment = Enum.TextXAlignment.Left
	_trigon.txt_1.Parent = _trigon.list_item_1

	_trigon.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	_trigon.UIListLayout_2.Padding = UDim.new(0.02, 0)
	_trigon.UIListLayout_2.Parent = _trigon.Listx

	_trigon.info.TextWrapped = true
	_trigon.info.TextScaled = true
	_trigon.info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_trigon.info.FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	_trigon.info.Position = UDim2.new(0.5, 0, 0.984978, 0)
	_trigon.info.Name = "info"
	_trigon.info.AnchorPoint = Vector2.new(0.5, 0.95)
	_trigon.info.TextSize = 14
	_trigon.info.Size = UDim2.new(0.482036, 0, 0.0197308, 0)
	_trigon.info.TextColor3 = Color3.fromRGB(240, 240, 240)
	_trigon.info.BorderColor3 = Color3.fromRGB(27, 42, 53)
	_trigon.info.Text = "{..}"
	_trigon.info.BackgroundTransparency = 1
	_trigon.info.Parent = _trigon.Canvas

	_trigon.UIAspectRatioConstraint.AspectRatio = 1.72749
	_trigon.UIAspectRatioConstraint.Parent = _trigon.Trigon_Whitelist

	_trigon.LocalScript_1.Parent = _trigon.Trigon_Whitelist


	task.spawn(function()
		local script = _trigon.LocalScript_1

		local TweenService = game:GetService("TweenService")
		local HttpService = game:GetService("HttpService")

		local CHECK = "rbxassetid://13858820419"
		local CIRCLE = "rbxassetid://81111209361717"

		local canv = script.Parent.Canvas
		local copyLink = canv.copyLink
		local close = canv.CloseBtn
		local list = canv.List
		local listitem = list.list_item
		listitem.Parent = nil

		local function addOrUpdateItem(text, isCompleted, itemToUpdate)
			local newItem = itemToUpdate or listitem:Clone()
			local itemImg = newItem.img
			local itemText = newItem.txt
			itemText.Text = text
			itemImg.Image = isCompleted and CHECK or CIRCLE

			if not itemToUpdate then
				newItem.Parent = list
			end

			if not isCompleted then
				local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
				local tween = TweenService:Create(itemImg, tweenInfo, {Rotation = 360})
				tween:Play()
			else
				TweenService:Create(itemImg, TweenInfo.new(0.5), {Rotation = 0}):Play()
			end

			if isCompleted and text:find("verified") then
				newItem.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			else
				newItem.BackgroundColor3 = listitem.BackgroundColor3
			end

			return newItem
		end

		copyLink.Activated:Connect(function()
			setclipboard(getKeylink())
			canv.info.Text = "{ Copied whitelist link to clipboard }"
		end)

		close.Activated:Connect(function()
			script.Parent:Destroy()
		end)

		local initItem = addOrUpdateItem("Initializing for first time use..", false)
		task.wait(2)  
		addOrUpdateItem("Initialization complete", true, initItem)

		local whitelistItem = addOrUpdateItem("Checking whitelist status..", false)
		local function checkWhitelistPeriodically()
			while true do
				local statusText, isVerified = checkWhitelist()
				if isVerified then
					addOrUpdateItem(statusText, true, whitelistItem)
					wait(2)
					script.Parent:Destroy()
					loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/beta",true))()
					break
				else
					for i = 8, 1, -1 do
						addOrUpdateItem(statusText .. " (Checking again in " .. i .. "s)", false, whitelistItem)
						task.wait(1)
					end
				end
			end
		end

		task.spawn(checkWhitelistPeriodically)
	end)
end



