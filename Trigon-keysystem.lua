local cloneref = cloneref or function(o) return o end
local HttpService = cloneref(game:GetService("HttpService"))
local gethui = gethui or function() return cloneref(game:GetService("CoreGui")) end

local function getHwid()
	local hwid = gethwid()
	return tostring(hwid)
end

local function getKeylink()
	return "https://auth.trigonevo.com/whitelist?hwid=" .. getHwid() .. "&os=android"
end

local function checkWhitelist(logFunc)
	logFunc = logFunc or function() end 

	local hwid = getHwid()
	local primaryUrl = "https://auth.trigonevo.com/api/verify?hwid=" .. hwid
	local fallbackUrl = "https://yxxcattrqpkpztxbasae.supabase.co/functions/v1/trigon-database?hwid=" .. hwid

	--primary API
	local success, response = pcall(function()
		return request({
			Url = primaryUrl,
			Method = "GET"
		})
	end)

	local shouldTryFallback = false
	local primaryError = ""

	-- Check fallback
	if not success then
		-- Primary request failed
		shouldTryFallback = true
		primaryError = tostring(response)
		logFunc("✗ Primary API connection failed", Color3.fromRGB(255, 100, 100))
		logFunc("  Error: " .. primaryError, Color3.fromRGB(180, 180, 180))
	elseif not response or not response.Body or response.Body == "" then
		-- Primary returned empty
		shouldTryFallback = true
		primaryError = "Empty response from primary server"
		logFunc("⚠ Primary API returned empty response", Color3.fromRGB(255, 200, 100))
	else
		-- Primary parse body
		local parseSuccess, data = pcall(function()
			return HttpService:JSONDecode(response.Body)
		end)

		if not parseSuccess then
			-- Primary unparseable JSON
			shouldTryFallback = true
			primaryError = tostring(data)
			logFunc("⚠ Primary API returned invalid JSON", Color3.fromRGB(255, 200, 100))
			logFunc("  Error: " .. primaryError, Color3.fromRGB(180, 180, 180))
		else
			-- valid JSON
			logFunc("✓ Primary API responded successfully", Color3.fromRGB(100, 255, 150))
			shouldTryFallback = false
		end
	end

	-- Try fallback API
	if shouldTryFallback then
		logFunc("→ Switching to fallback API...", Color3.fromRGB(100, 200, 255))

		success, response = pcall(function()
			return request({
				Url = fallbackUrl,
				Method = "GET",
				Headers = {
					["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl4eGNhdHRycXBrcHp0eGJhc2FlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjEyNjU0MjgsImV4cCI6MjA3Njg0MTQyOH0.lx7mwjkzCjJxw_ee3wk-0PwQ43OPmxpUDu3ZO8VgbiQ",
					["Content-Type"] = "application/json"
				}
			})
		end)

		if not success then
			-- Both APIs failed
			local errorMsg = tostring(response)
			logFunc("✗ Fallback API also failed", Color3.fromRGB(255, 100, 100))
			logFunc("  Error: " .. errorMsg, Color3.fromRGB(180, 180, 180))
			return {
				success = false,
				message = "Connection Error",
				details = "Both primary and fallback APIs are unreachable. Primary: " .. primaryError .. " | Fallback: " .. errorMsg,
				code = "CONNECTION_FAILED",
				usedFallback = false
			}
		end

		-- Fallback succeeded
		logFunc("✓ Fallback API connected successfully", Color3.fromRGB(100, 255, 150))
	end

	-- Check if response is valid
	if not response or not response.Body or response.Body == "" then
		return {
			success = false,
			message = "Empty Response",
			details = "Server returned an empty response",
			code = "EMPTY_RESPONSE",
			usedFallback = shouldTryFallback
		}
	end

	-- Try to parse JSON
	local parseSuccess, data = pcall(function()
		return HttpService:JSONDecode(response.Body)
	end)

	if not parseSuccess then
		local parseError = tostring(data)
		return {
			success = false,
			message = "Parse Error",
			details = parseError,
			code = "PARSE_ERROR",
			usedFallback = shouldTryFallback
		}
	end

	-- all API responses
	if data.success == true and data.valid == true then
		-- sec 1: Valid
		return {
			success = true,
			message = "HWID Verified",
			details = "Expires: " .. tostring(data.expires_at) .. " | " .. string.format("%.1f", data.remaining_hours) .. " hours remaining",
			licenseKey = data.license_key,
			expiresAt = data.expires_at,
			remainingHours = data.remaining_hours,
			os = data.os,
			createdAt = data.created_at,
			data = data,
			usedFallback = shouldTryFallback
		}
	elseif data.success == false and data.valid == false then
		-- sec 2: Invalid / active license (first time user)
		local errorMsg = data.error or "No active license found"
		local errorCode = data.code or "NO_LICENSE_FOUND"

		return {
			success = false,
			message = "Not Whitelisted",
			details = errorMsg,
			code = errorCode,
			hwid = data.hwid,
			data = data,
			usedFallback = shouldTryFallback
		}
	elseif data.success == false and data.code then
		-- sec 3: Invalid format or other errors
		local errorMsg = data.error or "Invalid request"
		local errorCode = data.code or "UNKNOWN_ERROR"

		return {
			success = false,
			message = "Request Error",
			details = errorMsg,
			code = errorCode,
			data = data,
			usedFallback = shouldTryFallback
		}
	else
		-- Unexpected response
		return {
			success = false,
			message = "Unexpected Response",
			details = "Server returned an unexpected response format",
			code = "UNEXPECTED_FORMAT",
			data = data,
			usedFallback = shouldTryFallback
		}
	end
end

local initialCheck = checkWhitelist()

if initialCheck.success then
	-- verified
	loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()
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
		HwidLabel = Instance.new("TextLabel"),
		UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint"),
		HwidDisplay = Instance.new("TextBox"),
		UICorner_6 = Instance.new("UICorner"),
		UIStroke_2 = Instance.new("UIStroke"),
		UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint"),
		ConnectionInfoContainer = Instance.new("Frame"),
		UICorner_7 = Instance.new("UICorner"),
		UIStroke_3 = Instance.new("UIStroke"),
		ConnectionTitle = Instance.new("TextLabel"),
		UITextSizeConstraint_6 = Instance.new("UITextSizeConstraint"),
		PrimaryLabel = Instance.new("TextLabel"),
		UITextSizeConstraint_7 = Instance.new("UITextSizeConstraint"),
		PrimaryStatus = Instance.new("TextLabel"),
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

	trigon.HwidLabel.TextWrapped = true
	trigon.HwidLabel.TextScaled = true
	trigon.HwidLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.HwidLabel.Name = "HwidLabel"
	trigon.HwidLabel.Position = UDim2.new(0.0447761, 0, 0.313471, 0)
	trigon.HwidLabel.TextSize = 11
	trigon.HwidLabel.Size = UDim2.new(0.910448, 0, 0.0466321, 0)
	trigon.HwidLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
	trigon.HwidLabel.Text = "Hardware ID"
	trigon.HwidLabel.BackgroundTransparency = 1
	trigon.HwidLabel.TextXAlignment = Enum.TextXAlignment.Left
	trigon.HwidLabel.Parent = trigon.LeftPanel

	trigon.UITextSizeConstraint_4.MaxTextSize = 11
	trigon.UITextSizeConstraint_4.Parent = trigon.HwidLabel

	trigon.HwidDisplay.TextWrapped = true
	trigon.HwidDisplay.TextEditable = false
	trigon.HwidDisplay.Position = UDim2.new(0.0447761, 0, 0.365285, 0)
	trigon.HwidDisplay.CursorPosition = -1
	trigon.HwidDisplay.TextScaled = true
	trigon.HwidDisplay.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
	trigon.HwidDisplay.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	trigon.HwidDisplay.TextSize = 10
	trigon.HwidDisplay.Size = UDim2.new(0.910448, 0, 0.0829016, 0)
	trigon.HwidDisplay.TextColor3 = Color3.fromRGB(200, 200, 200)
	trigon.HwidDisplay.Text = getHwid() or "HWID Not found!"
	trigon.HwidDisplay.Name = "HwidDisplay"
	trigon.HwidDisplay.ClearTextOnFocus = false
	trigon.HwidDisplay.Parent = trigon.LeftPanel

	trigon.UICorner_6.CornerRadius = UDim.new(0, 6)
	trigon.UICorner_6.Parent = trigon.HwidDisplay

	trigon.UIStroke_2.Color = Color3.fromRGB(50, 60, 80)
	trigon.UIStroke_2.Parent = trigon.HwidDisplay

	trigon.UITextSizeConstraint_5.MaxTextSize = 10
	trigon.UITextSizeConstraint_5.Parent = trigon.HwidDisplay

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

	trigon.PrimaryLabel.TextWrapped = true
	trigon.PrimaryLabel.TextScaled = true
	trigon.PrimaryLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	trigon.PrimaryLabel.Name = "PrimaryLabel"
	trigon.PrimaryLabel.Position = UDim2.new(0.0327869, 0, 0.323512, 0)
	trigon.PrimaryLabel.TextSize = 9
	trigon.PrimaryLabel.Size = UDim2.new(0.467213, 0, 0.168789, 0)
	trigon.PrimaryLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
	trigon.PrimaryLabel.Text = "Primary:"
	trigon.PrimaryLabel.BackgroundTransparency = 1
	trigon.PrimaryLabel.TextXAlignment = Enum.TextXAlignment.Left
	trigon.PrimaryLabel.Parent = trigon.ConnectionInfoContainer

	trigon.UITextSizeConstraint_7.MaxTextSize = 9
	trigon.UITextSizeConstraint_7.Parent = trigon.PrimaryLabel

	trigon.PrimaryStatus.TextWrapped = true
	trigon.PrimaryStatus.TextScaled = true
	trigon.PrimaryStatus.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	trigon.PrimaryStatus.Name = "PrimaryStatus"
	trigon.PrimaryStatus.Position = UDim2.new(0.5, 0, 0.323512, 0)
	trigon.PrimaryStatus.TextSize = 9
	trigon.PrimaryStatus.Size = UDim2.new(0.467213, 0, 0.168789, 0)
	trigon.PrimaryStatus.TextColor3 = Color3.fromRGB(255, 200, 100)
	trigon.PrimaryStatus.Text = "Checking..."
	trigon.PrimaryStatus.BackgroundTransparency = 1
	trigon.PrimaryStatus.TextXAlignment = Enum.TextXAlignment.Right
	trigon.PrimaryStatus.Parent = trigon.ConnectionInfoContainer

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
	trigon.FallbackLabel.Text = "Fallback:"
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
	trigon.FallbackStatus.Text = "Standby"
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
		-- Update last check time
		
		trigon.LastCheckTime.Text = os.date("%H:%M:%S")

		-- server status 
		if result.usedFallback then
			-- fallback 
			trigon.PrimaryStatus.Text = "Failed"
			trigon.PrimaryStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
			trigon.FallbackStatus.Text = "Active"
			trigon.FallbackStatus.TextColor3 = Color3.fromRGB(100, 255, 150)
		elseif result.code == "CONNECTION_FAILED" then
			-- Both failed
			trigon.PrimaryStatus.Text = "Offline"
			trigon.PrimaryStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
			trigon.FallbackStatus.Text = "Offline"
			trigon.FallbackStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
		else
			-- Primary work
			trigon.PrimaryStatus.Text = "Online"
			trigon.PrimaryStatus.TextColor3 = Color3.fromRGB(100, 255, 150)
			trigon.FallbackStatus.Text = "Standby"
			trigon.FallbackStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
		end

		if result.success then
			trigon.StatusText.Text = result.message
			trigon.StatusText.TextColor3 = Color3.fromRGB(100, 255, 150)
			trigon.StatusDetails.Text = result.details
			trigon.StatusIndicator.BackgroundColor3 = Color3.fromRGB(20, 60, 40)
			trigon.StatusIcon.BackgroundColor3 = Color3.fromRGB(100, 255, 150)
			addConsoleLog("✓ Whitelist verified successfully!", Color3.fromRGB(100, 255, 150))
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

		isChecking = true
		trigon.VerifyButton.Text = "Checking..."
		addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		addConsoleLog("⟳ Manual whitelist check initiated", Color3.fromRGB(100, 200, 255))

		local result = checkWhitelist(addConsoleLog)
		updateStatus(result)

		if result.success then
			addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
			addConsoleLog("✓ Access granted! Closing in 2 seconds...", Color3.fromRGB(100, 255, 150))
			task.wait(2)
			
			loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()

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
	addConsoleLog("[#] HWID: " .. getHwid(), Color3.fromRGB(150, 150, 150))
	addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
	addConsoleLog("⟳ Performing initial whitelist check...", Color3.fromRGB(200, 200, 100))
	addConsoleLog("→ Primary endpoint: Default gateway", Color3.fromRGB(150, 150, 150))
	addConsoleLog("→ Fallback endpoint: Alternate gateway", Color3.fromRGB(150, 150, 150))
	addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))

	updateStatus(initialCheck)

	if initialCheck.success then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()
		trigon.TrigonWhitelist:Destroy()
	end

    task.spawn(function()
	while trigon.TrigonWhitelist and trigon.TrigonWhitelist.Parent do
		task.wait(10)
		
		if not isChecking then
			addConsoleLog("⟳ Auto-check: Verifying whitelist status...", Color3.fromRGB(100, 150, 200))
			
			local result = checkWhitelist(addConsoleLog)
			updateStatus(result)
			
			if result.success then
				addConsoleLog("✓ Auto-check: Whitelist verified! Loading script...", Color3.fromRGB(100, 255, 150))
				task.wait(1)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()
				trigon.TrigonWhitelist:Destroy()
				break
			else
				addConsoleLog("○ Auto-check: Still not whitelisted", Color3.fromRGB(200, 150, 100))
			end
		end
	end
end)
end
