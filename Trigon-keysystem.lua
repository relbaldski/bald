local cloneref = cloneref or function(o) return o end
local HttpService = cloneref(game:GetService("HttpService"))
local gethui = gethui or function() return cloneref(game:GetService("CoreGui")) end

local hwid = gethwid and gethwid()
if hwid and type(hwid) == "userdata" then
    hwid = tostring(hwid)
end

local http_request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local hasLoaded = false


local NEBULAUTH_BASE_URL = "https://api.nebulauth.com"
local NEBULAUTH_API_TOKEN = "mk_at_HL1rO6wsqNxdYcpguj1TSbyIklCfi_zmragsQ9pUrsM"

local function getSavedKey()
    local success, res = pcall(function() return readfile("TrigonEvo_Key.txt") end)
    if success and res then return res:gsub("%s+", "") end
    return ""
end

local function saveKey(key)
    pcall(function() writefile("TrigonEvo_Key.txt", key) end)
end

local function getKeylink()
	return "https://trigonevo.com/auth/android/"
end

local function checkWhitelist(key, logFunc)
	logFunc = logFunc or function() end 

    if not key or key == "" then
        return {
			success = false,
			message = "No Key Provided",
			details = "Please enter a valid key.",
			code = "NO_KEY"
		}
    end

	local body_obj = {
		key = key,
		requestId = HttpService:GenerateGUID(false),
	}
	local body_string = HttpService:JSONEncode(body_obj)

	local headers = {
		["Content-Type"] = "application/json",
		["Authorization"] = "Bearer " .. NEBULAUTH_API_TOKEN,
	}
    if hwid and hwid ~= "" then
        headers["X-Hwid"] = tostring(hwid)
    end

	local success, response = pcall(function()
		return http_request({
			Url = NEBULAUTH_BASE_URL .. "/api/v1/keys/verify",
			Method = "POST",
			Headers = headers,
			Body = body_string
		})
	end)

	if not success then
		local primaryError = tostring(response)
		logFunc("✗ API connection failed", Color3.fromRGB(255, 100, 100))
		logFunc("  Error: " .. primaryError, Color3.fromRGB(180, 180, 180))
        return {
			success = false,
			message = "Connection Error",
			details = "API is unreachable. " .. primaryError,
			code = "CONNECTION_FAILED"
		}
	end

	if not response or not response.Body or response.Body == "" then
		logFunc("⚠ API returned empty response", Color3.fromRGB(255, 200, 100))
		return {
			success = false,
			message = "Empty Response",
			details = "Server returned an empty response",
			code = "EMPTY_RESPONSE"
		}
	end

	local parseSuccess, data = pcall(function()
		return HttpService:JSONDecode(response.Body)
	end)

	if not parseSuccess then
		local parseError = tostring(data)
		logFunc("⚠ API returned invalid JSON", Color3.fromRGB(255, 200, 100))
		logFunc("  Error: " .. parseError, Color3.fromRGB(180, 180, 180))
		return {
			success = false,
			message = "Parse Error",
			details = parseError,
			code = "PARSE_ERROR"
		}
	end

	if data.valid == true then
		logFunc("✓ API responded successfully", Color3.fromRGB(100, 255, 150))
		return {
			success = true,
			message = "Key Verified",
			details = "Expires: " .. (data.validUntil or "Never"),
			licenseKey = key,
			data = data
		}
	else
		local errorMsg = data.reason or "Invalid Key"
		return {
			success = false,
			message = "Verification Failed",
			details = errorMsg,
			code = data.reason
		}
	end
end

local savedKey = getSavedKey()
local initialCheck = nil
if savedKey ~= "" then
    initialCheck = checkWhitelist(savedKey)
else
    initialCheck = { success = false, message = "No saved key" }
end

if initialCheck.success then
	-- verified
	if not hasLoaded then
		hasLoaded = true
		loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()
	end
	return
else


	local trigon =
	{
		TrigonWhitelist = Instance.new("ScreenGui"),
		Overlay = Instance.new("Frame"),
		MainWindow = Instance.new("Frame"),
		UICorner = Instance.new("UICorner"),
		UIStroke = Instance.new("UIStroke"),
		UISizeConstraint = Instance.new("UISizeConstraint"),
		TitleBar = Instance.new("Frame"),
		UICorner_1 = Instance.new("UICorner"),
		Logo = Instance.new("ImageLabel"),
		CloseButton = Instance.new("TextButton"),
		UICorner_2 = Instance.new("UICorner"),
		UITextSizeConstraint = Instance.new("UITextSizeConstraint"),
		ContentContainer = Instance.new("Frame"),
		LeftPanel = Instance.new("Frame"),
		UICorner_3 = Instance.new("UICorner"),
		UIStroke_1 = Instance.new("UIStroke"),
		HeaderContainer = Instance.new("Frame"),
		StatusIcon = Instance.new("Frame"),
		UICorner_4 = Instance.new("UICorner"),
		Title = Instance.new("TextLabel"),
		UITextSizeConstraint_1 = Instance.new("UITextSizeConstraint"),
		StatusIndicator = Instance.new("Frame"),
		UICorner_5 = Instance.new("UICorner"),
		StatusText = Instance.new("TextLabel"),
		UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint"),
		StatusDetails = Instance.new("TextLabel"),
		UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint"),
		KeyLabel = Instance.new("TextLabel"),
		UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint"),
		KeyInput = Instance.new("Frame"),
		UICorner_6 = Instance.new("UICorner"),
		UIStroke_2 = Instance.new("UIStroke"),
		KeyInputTextBox = Instance.new("TextBox"),
		UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint"),
		PasteButton = Instance.new("ImageButton"),
		PasteButtonImage = Instance.new("ImageLabel"),
		PasteCorner = Instance.new("UICorner"),
		PasteStroke = Instance.new("UIStroke"),
		ConnectionInfoContainer = Instance.new("Frame"),
		UICorner_7 = Instance.new("UICorner"),
		UIStroke_3 = Instance.new("UIStroke"),
		ConnectionTitle = Instance.new("TextLabel"),
		UITextSizeConstraint_6 = Instance.new("UITextSizeConstraint"),
		ApiLabel = Instance.new("TextLabel"),
		UITextSizeConstraint_7 = Instance.new("UITextSizeConstraint"),
		ApiStatus = Instance.new("TextLabel"),
		UITextSizeConstraint_8 = Instance.new("UITextSizeConstraint"),
		FallbackLabel = Instance.new("TextLabel"),
		UITextSizeConstraint_9 = Instance.new("UITextSizeConstraint"),
		FallbackStatus = Instance.new("TextLabel"),
		UITextSizeConstraint_10 = Instance.new("UITextSizeConstraint"),
		LastCheckLabel = Instance.new("TextLabel"),
		UITextSizeConstraint_11 = Instance.new("UITextSizeConstraint"),
		LastCheckTime = Instance.new("TextLabel"),
		UITextSizeConstraint_12 = Instance.new("UITextSizeConstraint"),
		ButtonsContainer = Instance.new("Frame"),
		CopyButton = Instance.new("TextButton"),
		UICorner_8 = Instance.new("UICorner"),
		UIStroke_4 = Instance.new("UIStroke"),
		UITextSizeConstraint_13 = Instance.new("UITextSizeConstraint"),
		VerifyButton = Instance.new("TextButton"),
		UICorner_9 = Instance.new("UICorner"),
		UIStroke_5 = Instance.new("UIStroke"),
		UITextSizeConstraint_14 = Instance.new("UITextSizeConstraint"),
		RightPanel = Instance.new("Frame"),
		UICorner_10 = Instance.new("UICorner"),
		UIStroke_6 = Instance.new("UIStroke"),
		ConsoleContainer = Instance.new("ScrollingFrame"),
		UICorner_11 = Instance.new("UICorner"),
		UIListLayout = Instance.new("UIListLayout"),
		UIPadding = Instance.new("UIPadding")
	}

	trigon.TrigonWhitelist.ResetOnSpawn = false
	trigon.TrigonWhitelist.IgnoreGuiInset = true
	trigon.TrigonWhitelist.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	trigon.TrigonWhitelist.Name = "TrigonWhitelist"
	trigon.TrigonWhitelist.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	trigon.TrigonWhitelist.Parent = gethui()

	trigon.Overlay.BorderSizePixel = 0
	trigon.Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	trigon.Overlay.Size = UDim2.new(1, 0, 1, 0)
	trigon.Overlay.Name = "Overlay"
	trigon.Overlay.BackgroundTransparency = 0.3
	trigon.Overlay.Parent = trigon.TrigonWhitelist

	trigon.MainWindow.BorderSizePixel = 0
	trigon.MainWindow.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
	trigon.MainWindow.AnchorPoint = Vector2.new(0.5, 0.5)
	trigon.MainWindow.Size = UDim2.new(0.751073, 0, 0.772816, 0)
	trigon.MainWindow.Name = "MainWindow"
	trigon.MainWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
	trigon.MainWindow.Parent = trigon.TrigonWhitelist

	trigon.UICorner.CornerRadius = UDim.new(0, 12)
	trigon.UICorner.Parent = trigon.MainWindow

	trigon.UIStroke.Color = Color3.fromRGB(60, 70, 90)
	trigon.UIStroke.Parent = trigon.MainWindow

	trigon.UISizeConstraint.MinSize = Vector2.new(400, 300)
	trigon.UISizeConstraint.MaxSize = Vector2.new(700, 450)
	trigon.UISizeConstraint.Parent = trigon.MainWindow

	trigon.TitleBar.BorderSizePixel = 0
	trigon.TitleBar.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
	trigon.TitleBar.Size = UDim2.new(1, 0, 0.1, 0)
	trigon.TitleBar.Name = "TitleBar"
	trigon.TitleBar.Parent = trigon.MainWindow

	trigon.UICorner_1.CornerRadius = UDim.new(0, 12)
	trigon.UICorner_1.Parent = trigon.TitleBar

	trigon.Logo.Name = "Logo"
	trigon.Logo.Image = "rbxassetid://82500352718600"
	trigon.Logo.ImageContent = Content.fromUri("rbxassetid://82500352718600")
	trigon.Logo.Size = UDim2.new(0.142857, 0, 0.6, 0)
	trigon.Logo.BackgroundTransparency = 1
	trigon.Logo.Position = UDim2.new(-0.0185714, 0, 0.2, 0)
	trigon.Logo.ScaleType = Enum.ScaleType.Fit
	trigon.Logo.Parent = trigon.TitleBar

	trigon.CloseButton.TextWrapped = true
	trigon.CloseButton.TextScaled = true
	trigon.CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	trigon.CloseButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.CloseButton.Name = "CloseButton"
	trigon.CloseButton.AnchorPoint = Vector2.new(1, 0.5)
	trigon.CloseButton.TextSize = 16
	trigon.CloseButton.Size = UDim2.new(0.0428571, 0, 0.6, 0)
	trigon.CloseButton.Position = UDim2.new(0.985714, 0, 0.5, 0)
	trigon.CloseButton.TextColor3 = Color3.fromRGB(220, 220, 220)
	trigon.CloseButton.Text = "X"
	trigon.CloseButton.BackgroundTransparency = 0.99
	trigon.CloseButton.Parent = trigon.TitleBar

	trigon.UICorner_2.CornerRadius = UDim.new(0, 6)
	trigon.UICorner_2.Parent = trigon.CloseButton

	trigon.UITextSizeConstraint.MaxTextSize = 16
	trigon.UITextSizeConstraint.Parent = trigon.CloseButton

	trigon.ContentContainer.Size = UDim2.new(0.971429, 0, 0.844444, 0)
	trigon.ContentContainer.Name = "ContentContainer"
	trigon.ContentContainer.Position = UDim2.new(0.0142857, 0, 0.133333, 0)
	trigon.ContentContainer.BackgroundTransparency = 1
	trigon.ContentContainer.Parent = trigon.MainWindow

	trigon.LeftPanel.BorderSizePixel = 0
	trigon.LeftPanel.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
	trigon.LeftPanel.Size = UDim2.new(0.492647, 0, 1.01579, 0)
	trigon.LeftPanel.Name = "LeftPanel"
	trigon.LeftPanel.Position = UDim2.new(0, 0, -0.0157895, 0)
	trigon.LeftPanel.Parent = trigon.ContentContainer

	trigon.UICorner_3.Parent = trigon.LeftPanel

	trigon.UIStroke_1.Color = Color3.fromRGB(50, 60, 80)
	trigon.UIStroke_1.Parent = trigon.LeftPanel

	trigon.HeaderContainer.Size = UDim2.new(0.910448, 0, 0.0777202, 0)
	trigon.HeaderContainer.Name = "HeaderContainer"
	trigon.HeaderContainer.Position = UDim2.new(0.0447761, 0, 0.0310881, 0)
	trigon.HeaderContainer.BackgroundTransparency = 1
	trigon.HeaderContainer.Parent = trigon.LeftPanel

	trigon.StatusIcon.BorderSizePixel = 0
	trigon.StatusIcon.BackgroundColor3 = Color3.fromRGB(255, 200, 100)
	trigon.StatusIcon.AnchorPoint = Vector2.new(0, 0.5)
	trigon.StatusIcon.Size = UDim2.new(0.0262295, 0, 0.266667, 0)
	trigon.StatusIcon.Name = "StatusIcon"
	trigon.StatusIcon.Position = UDim2.new(0, 0, 0.5, 0)
	trigon.StatusIcon.Parent = trigon.HeaderContainer

	trigon.UICorner_4.CornerRadius = UDim.new(1, 0)
	trigon.UICorner_4.Parent = trigon.StatusIcon

	trigon.Title.TextWrapped = true
	trigon.Title.TextScaled = true
	trigon.Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.Title.Name = "Title"
	trigon.Title.Position = UDim2.new(0.0590164, 0, 0, 0)
	trigon.Title.TextSize = 16
	trigon.Title.Size = UDim2.new(0.940984, 0, 1, 0)
	trigon.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	trigon.Title.Text = "Whitelist Status"
	trigon.Title.BackgroundTransparency = 1
	trigon.Title.TextXAlignment = Enum.TextXAlignment.Left
	trigon.Title.Parent = trigon.HeaderContainer

	trigon.UITextSizeConstraint_1.MaxTextSize = 16
	trigon.UITextSizeConstraint_1.Parent = trigon.Title

	trigon.StatusIndicator.BorderSizePixel = 0
	trigon.StatusIndicator.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
	trigon.StatusIndicator.Size = UDim2.new(0.910448, 0, 0.157867, 0)
	trigon.StatusIndicator.Name = "StatusIndicator"
	trigon.StatusIndicator.Position = UDim2.new(0.0447761, 0, 0.129534, 0)
	trigon.StatusIndicator.Parent = trigon.LeftPanel

	trigon.UICorner_5.CornerRadius = UDim.new(0, 6)
	trigon.UICorner_5.Parent = trigon.StatusIndicator

	trigon.StatusText.TextWrapped = true
	trigon.StatusText.TextScaled = true
	trigon.StatusText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.StatusText.Name = "StatusText"
	trigon.StatusText.Position = UDim2.new(0.0327869, 0, 0.131283, 0)
	trigon.StatusText.TextSize = 14
	trigon.StatusText.Size = UDim2.new(0.934426, 0, 0.410261, 0)
	trigon.StatusText.TextColor3 = Color3.fromRGB(255, 200, 100)
	trigon.StatusText.Text = "Checking..."
	trigon.StatusText.BackgroundTransparency = 1
	trigon.StatusText.TextXAlignment = Enum.TextXAlignment.Left
	trigon.StatusText.Parent = trigon.StatusIndicator

	trigon.UITextSizeConstraint_2.MaxTextSize = 14
	trigon.UITextSizeConstraint_2.Parent = trigon.StatusText

	trigon.StatusDetails.TextWrapped = true
	trigon.StatusDetails.TextScaled = true
	trigon.StatusDetails.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	trigon.StatusDetails.Name = "StatusDetails"
	trigon.StatusDetails.Position = UDim2.new(0.0327869, 0, 0.541544, 0)
	trigon.StatusDetails.TextSize = 11
	trigon.StatusDetails.Size = UDim2.new(0.934426, 0, 0.328209, 0)
	trigon.StatusDetails.TextColor3 = Color3.fromRGB(180, 180, 180)
	trigon.StatusDetails.Text = "Initializing..."
	trigon.StatusDetails.BackgroundTransparency = 1
	trigon.StatusDetails.TextXAlignment = Enum.TextXAlignment.Left
	trigon.StatusDetails.Parent = trigon.StatusIndicator

	trigon.UITextSizeConstraint_3.MaxTextSize = 11
	trigon.UITextSizeConstraint_3.Parent = trigon.StatusDetails

	trigon.KeyLabel.TextWrapped = true
	trigon.KeyLabel.TextScaled = true
	trigon.KeyLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.KeyLabel.Name = "HwidLabel"
	trigon.KeyLabel.Position = UDim2.new(0.0447761, 0, 0.313471, 0)
	trigon.KeyLabel.TextSize = 11
	trigon.KeyLabel.Size = UDim2.new(0.910448, 0, 0.0466321, 0)
	trigon.KeyLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
	trigon.KeyLabel.Text = "License Key"
	trigon.KeyLabel.BackgroundTransparency = 1
	trigon.KeyLabel.TextXAlignment = Enum.TextXAlignment.Left
	trigon.KeyLabel.Parent = trigon.LeftPanel

	trigon.UITextSizeConstraint_4.MaxTextSize = 11
	trigon.UITextSizeConstraint_4.Parent = trigon.KeyLabel

	trigon.KeyInput.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
	trigon.KeyInput.Position = UDim2.new(0.0447761, 0, 0.365285, 0)
	trigon.KeyInput.Size = UDim2.new(0.75, 0, 0.0829016, 0)
	trigon.KeyInput.Name = "HwidContainer"
	trigon.KeyInput.Parent = trigon.LeftPanel

	trigon.UICorner_6.CornerRadius = UDim.new(0, 6)
	trigon.UICorner_6.Parent = trigon.KeyInput

	trigon.UIStroke_2.Color = Color3.fromRGB(50, 60, 80)
	trigon.UIStroke_2.Parent = trigon.KeyInput

	-- The actual TextBox that user types in
	local KeyRealInput = Instance.new("TextBox")
	KeyRealInput.Name = "HwidDisplay"
	KeyRealInput.BackgroundTransparency = 1
	KeyRealInput.Size = UDim2.new(1, -12, 1, 0)
	KeyRealInput.Position = UDim2.new(0, 6, 0, 0)
	KeyRealInput.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	KeyRealInput.TextSize = 10
	KeyRealInput.TextColor3 = Color3.fromRGB(200, 200, 200)
	KeyRealInput.Text = savedKey
	KeyRealInput.PlaceholderText = " "
	KeyRealInput.TextEditable = true
	KeyRealInput.ClearTextOnFocus = false
	KeyRealInput.TextXAlignment = Enum.TextXAlignment.Left
	KeyRealInput.TextWrapped = true
	KeyRealInput.TextScaled = true
	KeyRealInput.Parent = trigon.KeyInput

	-- Replace internal references from the frame to the actual text input box
	trigon.KeyInputInner = KeyRealInput

	-- Paste Button Wrapper
	trigon.PasteButton.Name = "PasteButton"
	trigon.PasteButton.Position = UDim2.new(0.81, 0, 0.365285, 0)
	trigon.PasteButton.Size = UDim2.new(0.145, 0, 0.0829016, 0)
	trigon.PasteButton.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
	trigon.PasteButton.Parent = trigon.LeftPanel

	trigon.PasteCorner.CornerRadius = UDim.new(0, 6)
	trigon.PasteCorner.Parent = trigon.PasteButton

	trigon.PasteStroke.Color = Color3.fromRGB(50, 60, 80)
	trigon.PasteStroke.Parent = trigon.PasteButton

	-- Paste Button Icon (matching console size)
	local pasteIcon = Instance.new("ImageLabel")
	pasteIcon.Name = "icon"
	pasteIcon.BorderSizePixel = 0
	pasteIcon.BackgroundTransparency = 1
	pasteIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	pasteIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
	pasteIcon.Size = UDim2.new(0, 16, 0, 16)
	pasteIcon.Image = "rbxassetid://13846942895"
	pasteIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)
	pasteIcon.ScaleType = Enum.ScaleType.Fit
	pasteIcon.Parent = trigon.PasteButton

	trigon.ConnectionInfoContainer.BorderSizePixel = 0
	trigon.ConnectionInfoContainer.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
	trigon.ConnectionInfoContainer.Size = UDim2.new(0.910448, 0, 0.184183, 0)
	trigon.ConnectionInfoContainer.Name = "ConnectionInfoContainer"
	trigon.ConnectionInfoContainer.Position = UDim2.new(0.0447761, 0, 0.481865, 0)
	trigon.ConnectionInfoContainer.Parent = trigon.LeftPanel

	trigon.UICorner_7.CornerRadius = UDim.new(0, 6)
	trigon.UICorner_7.Parent = trigon.ConnectionInfoContainer

	trigon.UIStroke_3.Color = Color3.fromRGB(50, 60, 80)
	trigon.UIStroke_3.Parent = trigon.ConnectionInfoContainer

	trigon.ConnectionTitle.TextWrapped = true
	trigon.ConnectionTitle.TextScaled = true
	trigon.ConnectionTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	trigon.ConnectionTitle.Name = "ConnectionTitle"
	trigon.ConnectionTitle.Position = UDim2.new(0.0327869, 0, 0.0703287, 0)
	trigon.ConnectionTitle.TextSize = 10
	trigon.ConnectionTitle.Size = UDim2.new(0.934426, 0, 0.210986, 0)
	trigon.ConnectionTitle.TextColor3 = Color3.fromRGB(130, 130, 130)
	trigon.ConnectionTitle.Text = "Server Status"
	trigon.ConnectionTitle.BackgroundTransparency = 1
	trigon.ConnectionTitle.TextXAlignment = Enum.TextXAlignment.Left
	trigon.ConnectionTitle.Parent = trigon.ConnectionInfoContainer

	trigon.UITextSizeConstraint_6.MaxTextSize = 10
	trigon.UITextSizeConstraint_6.Parent = trigon.ConnectionTitle

	trigon.ApiLabel.TextWrapped = true
	trigon.ApiLabel.TextScaled = true
	trigon.ApiLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	trigon.ApiLabel.Name = "PrimaryLabel"
	trigon.ApiLabel.Position = UDim2.new(0.0327869, 0, 0.323512, 0)
	trigon.ApiLabel.TextSize = 9
	trigon.ApiLabel.Size = UDim2.new(0.467213, 0, 0.168789, 0)
	trigon.ApiLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
	trigon.ApiLabel.Text = "Status:"
	trigon.ApiLabel.BackgroundTransparency = 1
	trigon.ApiLabel.TextXAlignment = Enum.TextXAlignment.Left
	trigon.ApiLabel.Parent = trigon.ConnectionInfoContainer

	trigon.UITextSizeConstraint_7.MaxTextSize = 9
	trigon.UITextSizeConstraint_7.Parent = trigon.PrimaryLabel

	trigon.ApiStatus.TextWrapped = true
	trigon.ApiStatus.TextScaled = true
	trigon.ApiStatus.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.ApiStatus.Name = "PrimaryStatus"
	trigon.ApiStatus.Position = UDim2.new(0.5, 0, 0.323512, 0)
	trigon.ApiStatus.TextSize = 9
	trigon.ApiStatus.Size = UDim2.new(0.467213, 0, 0.168789, 0)
	trigon.ApiStatus.TextColor3 = Color3.fromRGB(255, 200, 100)
	trigon.ApiStatus.Text = "Checking..."
	trigon.ApiStatus.BackgroundTransparency = 1
	trigon.ApiStatus.TextXAlignment = Enum.TextXAlignment.Right
	trigon.ApiStatus.Parent = trigon.ConnectionInfoContainer

	trigon.UITextSizeConstraint_8.MaxTextSize = 9
	trigon.UITextSizeConstraint_8.Parent = trigon.PrimaryStatus

	trigon.FallbackLabel.TextWrapped = true
	trigon.FallbackLabel.TextScaled = true
	trigon.FallbackLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	trigon.FallbackLabel.Name = "FallbackLabel"
	trigon.FallbackLabel.Position = UDim2.new(0.0327869, 0, 0.520432, 0)
	trigon.FallbackLabel.TextSize = 9
	trigon.FallbackLabel.Size = UDim2.new(0.467213, 0, 0.168789, 0)
	trigon.FallbackLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
	trigon.FallbackLabel.Visible = false
	trigon.FallbackLabel.BackgroundTransparency = 1
	trigon.FallbackLabel.TextXAlignment = Enum.TextXAlignment.Left
	trigon.FallbackLabel.Parent = trigon.ConnectionInfoContainer

	trigon.UITextSizeConstraint_9.MaxTextSize = 9
	trigon.UITextSizeConstraint_9.Parent = trigon.FallbackLabel

	trigon.FallbackStatus.TextWrapped = true
	trigon.FallbackStatus.TextScaled = true
	trigon.FallbackStatus.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.FallbackStatus.Name = "FallbackStatus"
	trigon.FallbackStatus.Position = UDim2.new(0.5, 0, 0.520432, 0)
	trigon.FallbackStatus.TextSize = 9
	trigon.FallbackStatus.Size = UDim2.new(0.467213, 0, 0.168789, 0)
	trigon.FallbackStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
	trigon.FallbackStatus.Visible = false
	trigon.FallbackStatus.BackgroundTransparency = 1
	trigon.FallbackStatus.TextXAlignment = Enum.TextXAlignment.Right
	trigon.FallbackStatus.Parent = trigon.ConnectionInfoContainer

	trigon.UITextSizeConstraint_10.MaxTextSize = 9
	trigon.UITextSizeConstraint_10.Parent = trigon.FallbackStatus

	trigon.LastCheckLabel.TextWrapped = true
	trigon.LastCheckLabel.TextScaled = true
	trigon.LastCheckLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	trigon.LastCheckLabel.Name = "LastCheckLabel"
	trigon.LastCheckLabel.Position = UDim2.new(0.0327869, 0, 0.717353, 0)
	trigon.LastCheckLabel.TextSize = 9
	trigon.LastCheckLabel.Size = UDim2.new(0.467213, 0, 0.168789, 0)
	trigon.LastCheckLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
	trigon.LastCheckLabel.Text = "Last Check:"
	trigon.LastCheckLabel.BackgroundTransparency = 1
	trigon.LastCheckLabel.TextXAlignment = Enum.TextXAlignment.Left
	trigon.LastCheckLabel.Parent = trigon.ConnectionInfoContainer

	trigon.UITextSizeConstraint_11.MaxTextSize = 9
	trigon.UITextSizeConstraint_11.Parent = trigon.LastCheckLabel

	trigon.LastCheckTime.TextWrapped = true
	trigon.LastCheckTime.TextScaled = true
	trigon.LastCheckTime.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.LastCheckTime.Name = "LastCheckTime"
	trigon.LastCheckTime.Position = UDim2.new(0.5, 0, 0.717353, 0)
	trigon.LastCheckTime.TextSize = 9
	trigon.LastCheckTime.Size = UDim2.new(0.467213, 0, 0.168789, 0)
	trigon.LastCheckTime.TextColor3 = Color3.fromRGB(200, 200, 200)
	trigon.LastCheckTime.Text = "23:57:42"
	trigon.LastCheckTime.BackgroundTransparency = 1
	trigon.LastCheckTime.TextXAlignment = Enum.TextXAlignment.Right
	trigon.LastCheckTime.Parent = trigon.ConnectionInfoContainer

	trigon.UITextSizeConstraint_12.MaxTextSize = 9
	trigon.UITextSizeConstraint_12.Parent = trigon.LastCheckTime

	trigon.ButtonsContainer.Size = UDim2.new(0.910448, 0, 0.0906736, 0)
	trigon.ButtonsContainer.Name = "ButtonsContainer"
	trigon.ButtonsContainer.Position = UDim2.new(0.0447761, 0, 0.888601, 0)
	trigon.ButtonsContainer.BackgroundTransparency = 1
	trigon.ButtonsContainer.Parent = trigon.LeftPanel

	trigon.CopyButton.TextWrapped = true
	trigon.CopyButton.TextScaled = true
	trigon.CopyButton.BackgroundColor3 = Color3.fromRGB(80, 90, 120)
	trigon.CopyButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.CopyButton.Name = "CopyButton"
	trigon.CopyButton.TextSize = 12
	trigon.CopyButton.Size = UDim2.new(0.48, 0, 1, 0)
	trigon.CopyButton.Position = UDim2.new(0, 0, -0.2, 0)
	trigon.CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	trigon.CopyButton.Text = "Copy Link"
	trigon.CopyButton.BackgroundTransparency = 0.7
	trigon.CopyButton.Parent = trigon.ButtonsContainer

	trigon.UICorner_8.CornerRadius = UDim.new(0, 6)
	trigon.UICorner_8.Parent = trigon.CopyButton

	trigon.UIStroke_4.Color = Color3.fromRGB(100, 110, 140)
	trigon.UIStroke_4.Transparency = 0.7
	trigon.UIStroke_4.Parent = trigon.CopyButton

	trigon.UITextSizeConstraint_13.MaxTextSize = 12
	trigon.UITextSizeConstraint_13.Parent = trigon.CopyButton

	trigon.VerifyButton.TextWrapped = true
	trigon.VerifyButton.TextScaled = true
	trigon.VerifyButton.BackgroundColor3 = Color3.fromRGB(60, 150, 100)
	trigon.VerifyButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.VerifyButton.Name = "VerifyButton"
	trigon.VerifyButton.TextSize = 12
	trigon.VerifyButton.Size = UDim2.new(0.48, 0, 1, 0)
	trigon.VerifyButton.Position = UDim2.new(0.52, 0, -0.2, 0)
	trigon.VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	trigon.VerifyButton.Text = "Verify Status"
	trigon.VerifyButton.BackgroundTransparency = 0.7
	trigon.VerifyButton.Parent = trigon.ButtonsContainer

	trigon.UICorner_9.CornerRadius = UDim.new(0, 6)
	trigon.UICorner_9.Parent = trigon.VerifyButton

	trigon.UIStroke_5.Color = Color3.fromRGB(80, 170, 120)
	trigon.UIStroke_5.Transparency = 0.7
	trigon.UIStroke_5.Parent = trigon.VerifyButton

	trigon.UITextSizeConstraint_14.MaxTextSize = 12
	trigon.UITextSizeConstraint_14.Parent = trigon.VerifyButton

	trigon.RightPanel.BorderSizePixel = 0
	trigon.RightPanel.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
	trigon.RightPanel.Size = UDim2.new(0.492647, 0, 1.01579, 0)
	trigon.RightPanel.Name = "RightPanel"
	trigon.RightPanel.Position = UDim2.new(0.507353, 0, -0.0157895, 0)
	trigon.RightPanel.Parent = trigon.ContentContainer

	trigon.UICorner_10.Parent = trigon.RightPanel

	trigon.UIStroke_6.Color = Color3.fromRGB(50, 60, 80)
	trigon.UIStroke_6.Parent = trigon.RightPanel

	trigon.ConsoleContainer.BorderSizePixel = 0
	trigon.ConsoleContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
	trigon.ConsoleContainer.Position = UDim2.new(0.0447761, 0, 0.0388601, 0)
	trigon.ConsoleContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
	trigon.ConsoleContainer.Size = UDim2.new(0.910448, 0, 0.923712, 0)
	trigon.ConsoleContainer.ScrollBarThickness = 4
	trigon.ConsoleContainer.BackgroundColor3 = Color3.fromRGB(15, 18, 25)
	trigon.ConsoleContainer.Name = "ConsoleContainer"
	trigon.ConsoleContainer.Parent = trigon.RightPanel

	trigon.UICorner_11.CornerRadius = UDim.new(0, 6)
	trigon.UICorner_11.Parent = trigon.ConsoleContainer

	trigon.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	trigon.UIListLayout.Padding = UDim.new(0, 2)
	trigon.UIListLayout.Parent = trigon.ConsoleContainer

	trigon.UIPadding.PaddingBottom = UDim.new(0, 8)
	trigon.UIPadding.PaddingTop = UDim.new(0, 8)
	trigon.UIPadding.PaddingLeft = UDim.new(0, 8)
	trigon.UIPadding.PaddingRight = UDim.new(0, 8)
	trigon.UIPadding.Parent = trigon.ConsoleContainer

	local consoleContainer = trigon.ConsoleContainer

	local consoleLineCount = 0
	local function addConsoleLog(message, color)
		consoleLineCount = consoleLineCount + 1

		local logLine = Instance.new("TextLabel")
		logLine.Name = "Log_" .. consoleLineCount
		logLine.Size = UDim2.new(1, 0, 0, 0)
		logLine.AutomaticSize = Enum.AutomaticSize.Y
		logLine.BackgroundTransparency = 1
		logLine.Text = "[" .. os.date("%H:%M:%S") .. "] " .. message
		logLine.TextColor3 = color or Color3.fromRGB(200, 200, 200)
		logLine.Font = Enum.Font.Code
		logLine.TextSize = 11
		logLine.TextXAlignment = Enum.TextXAlignment.Left
		logLine.TextYAlignment = Enum.TextYAlignment.Top
		logLine.TextWrapped = true
		logLine.RichText = false
		logLine.Parent = consoleContainer

		consoleContainer.CanvasPosition = Vector2.new(0, consoleContainer.AbsoluteCanvasSize.Y)
	end


		local function updateStatus(result)
		trigon.LastCheckTime.Text = os.date("%H:%M:%S")

		if result.code == "CONNECTION_FAILED" then
			trigon.ApiStatus.Text = "Offline"
			trigon.ApiStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
		else
			trigon.ApiStatus.Text = "Online"
			trigon.ApiStatus.TextColor3 = Color3.fromRGB(100, 255, 150)
		end

		if result.success then
			trigon.StatusText.Text = result.message
			trigon.StatusText.TextColor3 = Color3.fromRGB(100, 255, 150)
			trigon.StatusDetails.Text = result.details
			trigon.StatusIndicator.BackgroundColor3 = Color3.fromRGB(20, 60, 40)
			trigon.StatusIcon.BackgroundColor3 = Color3.fromRGB(100, 255, 150)
			addConsoleLog("✓ Key verified successfully!", Color3.fromRGB(100, 255, 150))
			addConsoleLog("  " .. result.details, Color3.fromRGB(150, 150, 150))
		else
			trigon.StatusText.Text = result.message
			trigon.StatusText.TextColor3 = Color3.fromRGB(255, 100, 100)
			trigon.StatusDetails.Text = result.details
			trigon.StatusIndicator.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
			trigon.StatusIcon.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
			addConsoleLog("✗ Check failed: " .. result.message, Color3.fromRGB(255, 100, 100))
			addConsoleLog("  Reason: " .. result.details, Color3.fromRGB(180, 180, 180))
			if result.code then
				addConsoleLog("  Error code: " .. result.code, Color3.fromRGB(150, 150, 150))
			end
		end
	end

	trigon.CopyButton.Activated:Connect(function()
		local link = getKeylink()
		setclipboard(link)
		addConsoleLog("[>] Whitelist link copied to clipboard", Color3.fromRGB(100, 200, 255))

		local originalText = trigon.CopyButton.Text
		trigon.CopyButton.Text = "Copied!"
		task.wait(1.5)
		trigon.CopyButton.Text = originalText
	end)


	local isChecking = false
	trigon.VerifyButton.Activated:Connect(function()
		if isChecking then return end

		local currentKey = trigon.KeyInputInner.Text:gsub("%s+", "")
		
		if currentKey == "" then
			addConsoleLog("✗ Please enter a key first!", Color3.fromRGB(255, 100, 100))
			return
		end

		isChecking = true
		trigon.VerifyButton.Text = "Checking..."
		addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		addConsoleLog("⟳ Manual key check initiated", Color3.fromRGB(100, 200, 255))

		local result = checkWhitelist(currentKey, addConsoleLog)
		updateStatus(result)

		if result.success then
			saveKey(currentKey)
			addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
			addConsoleLog("✓ Access granted! Closing in 2 seconds...", Color3.fromRGB(100, 255, 150))
			task.wait(2)
			
			if not hasLoaded then
				hasLoaded = true
				loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()
			end

			trigon.TrigonWhitelist:Destroy()
		else
			addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		end

		trigon.VerifyButton.Text = "Verify Status"
		isChecking = false
	end)

	trigon.CloseButton.Activated:Connect(function()
		addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		addConsoleLog("⊗ Closing whitelist window...", Color3.fromRGB(255, 200, 100))
		task.wait(0.3)
		trigon.TrigonWhitelist:Destroy()
	end)

	-- Initial log
	addConsoleLog("[*] Trigon Whitelist System v1.0", Color3.fromRGB(150, 150, 255))
	addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
	addConsoleLog("[#] HWID: " .. tostring(hwid or "UNKNOWN"), Color3.fromRGB(150, 150, 150))
	addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
	
	if savedKey ~= "" then
		addConsoleLog("⟳ Performing initial key check...", Color3.fromRGB(200, 200, 100))
		addConsoleLog("→ Key: " .. savedKey:sub(1, 4) .. "***", Color3.fromRGB(150, 150, 150))
		addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		updateStatus(initialCheck)
	else
		addConsoleLog("⚠ No saved key found. Please enter your key.", Color3.fromRGB(255, 200, 100))
		addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		updateStatus({success=false, message="Not Whitelisted", details="Please enter a valid key.", code="NO_KEY"})
	end

	if initialCheck.success then
		if not hasLoaded then
			hasLoaded = true
			loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()
		end
		trigon.TrigonWhitelist:Destroy()
	end

	trigon.PasteButton.Activated:Connect(function()
		local success, clipText = pcall(function()
			return (getclipboard and getclipboard()) or (toclipboard and "") or ""
		end)
		
		if success and clipText and clipText ~= "" then
			trigon.KeyInputInner.Text = clipText
		else
			addConsoleLog("⚠ Could not read clipboard", Color3.fromRGB(255, 200, 100))
		end
	end)

    task.spawn(function()
	while trigon.TrigonWhitelist and trigon.TrigonWhitelist.Parent do
		task.wait(10)
		
        if not isChecking then
            local currentKey = trigon.KeyInputInner.Text:gsub("%s+", "")
            if currentKey ~= "" then
                addConsoleLog("⟳ Auto-check: Verifying key status...", Color3.fromRGB(100, 150, 200))		
                local result = checkWhitelist(currentKey, addConsoleLog)
                updateStatus(result)
                
                if result.success then
                    saveKey(currentKey)
                    addConsoleLog("✓ Auto-check: Key verified! Loading script...", Color3.fromRGB(100, 255, 150))
                    task.wait(1)
                    if not hasLoaded then
                        hasLoaded = true
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()
                    end
                    trigon.TrigonWhitelist:Destroy()
                    break
                else
                    addConsoleLog("○ Auto-check: Invalid key", Color3.fromRGB(200, 150, 100))
                end
            end
		end
	end
end)
end
