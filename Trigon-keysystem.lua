local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

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
	local primaryUrl = "https://auth.trigonevo.com/api/verify?hwid=C" .. hwid
	local fallbackUrl = "https://yxxcattrqpkpztxbasae.supabase.co/functions/v1/trigon-database?hwid=C" .. hwid

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
	--UI
	local gui = Instance.new("ScreenGui")
	gui.Name = "TrigonWhitelist"
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	gui.Parent = gethui()

	local overlay = Instance.new("Frame")
	overlay.Name = "Overlay"
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 0.3
	overlay.BorderSizePixel = 0
	overlay.Parent = gui

	local mainWindow = Instance.new("Frame")
	mainWindow.Name = "MainWindow"
	mainWindow.AnchorPoint = Vector2.new(0.5, 0.5)
	mainWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainWindow.Size = UDim2.new(0, 700, 0, 450)
	mainWindow.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
	mainWindow.BorderSizePixel = 0
	mainWindow.Parent = gui

	local mainCorner = Instance.new("UICorner")
	mainCorner.CornerRadius = UDim.new(0, 12)
	mainCorner.Parent = mainWindow

	local mainStroke = Instance.new("UIStroke")
	mainStroke.Color = Color3.fromRGB(60, 70, 90)
	mainStroke.Thickness = 1
	mainStroke.Parent = mainWindow

	local sizeConstraint = Instance.new("UISizeConstraint")
	sizeConstraint.MaxSize = Vector2.new(700, 450)
	sizeConstraint.MinSize = Vector2.new(400, 300)
	sizeConstraint.Parent = mainWindow

	local titleBar = Instance.new("Frame")
	titleBar.Name = "TitleBar"
	titleBar.Size = UDim2.new(1, 0, 0, 50)
	titleBar.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
	titleBar.BorderSizePixel = 0
	titleBar.Parent = mainWindow

	local titleCorner = Instance.new("UICorner")
	titleCorner.CornerRadius = UDim.new(0, 12)
	titleCorner.Parent = titleBar

	local logo = Instance.new("ImageLabel")
	logo.Name = "Logo"
	logo.Position = UDim2.new(0, -13, 0, 10)
	logo.AnchorPoint = Vector2.new(0, 0)
	logo.Size = UDim2.new(0, 100, 0, 30)
	logo.BackgroundTransparency = 1
	logo.Image = "rbxassetid://82500352718600"
	logo.ScaleType = Enum.ScaleType.Fit
	logo.Parent = titleBar

	local closeBtn = Instance.new("TextButton")
	closeBtn.Name = "CloseButton"
	closeBtn.AnchorPoint = Vector2.new(1, 0.5)
	closeBtn.Position = UDim2.new(1, -10, 0.5, 0)
	closeBtn.Size = UDim2.new(0, 30, 0, 30)
	closeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	closeBtn.BackgroundTransparency = 0.99
	closeBtn.Text = "X"
	closeBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 16
	closeBtn.Parent = titleBar

	local closeBtnCorner = Instance.new("UICorner")
	closeBtnCorner.CornerRadius = UDim.new(0, 6)
	closeBtnCorner.Parent = closeBtn

	local contentContainer = Instance.new("Frame")
	contentContainer.Name = "ContentContainer"
	contentContainer.Position = UDim2.new(0, 10, 0, 60)
	contentContainer.Size = UDim2.new(1, -20, 1, -70)
	contentContainer.BackgroundTransparency = 1
	contentContainer.Parent = mainWindow

	local leftPanel = Instance.new("Frame")
	leftPanel.Name = "LeftPanel"
	leftPanel.Size = UDim2.new(0.5, -5, 1, 0)
	leftPanel.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
	leftPanel.BorderSizePixel = 0
	leftPanel.Parent = contentContainer

	local leftCorner = Instance.new("UICorner")
	leftCorner.CornerRadius = UDim.new(0, 8)
	leftCorner.Parent = leftPanel

	local leftStroke = Instance.new("UIStroke")
	leftStroke.Color = Color3.fromRGB(50, 60, 80)
	leftStroke.Thickness = 1
	leftStroke.Parent = leftPanel

	local headerContainer = Instance.new("Frame")
	headerContainer.Name = "HeaderContainer"
	headerContainer.Position = UDim2.new(0, 15, 0, 12)
	headerContainer.Size = UDim2.new(1, -30, 0, 30)
	headerContainer.BackgroundTransparency = 1
	headerContainer.Parent = leftPanel

	local statusIcon = Instance.new("Frame")
	statusIcon.Name = "StatusIcon"
	statusIcon.Position = UDim2.new(0, 0, 0.5, 0)
	statusIcon.AnchorPoint = Vector2.new(0, 0.5)
	statusIcon.Size = UDim2.new(0, 8, 0, 8)
	statusIcon.BackgroundColor3 = Color3.fromRGB(255, 200, 100)
	statusIcon.BorderSizePixel = 0
	statusIcon.Parent = headerContainer

	local iconCorner = Instance.new("UICorner")
	iconCorner.CornerRadius = UDim.new(1, 0)
	iconCorner.Parent = statusIcon

	local leftTitle = Instance.new("TextLabel")
	leftTitle.Name = "Title"
	leftTitle.Position = UDim2.new(0, 18, 0, 0)
	leftTitle.Size = UDim2.new(1, -18, 1, 0)
	leftTitle.BackgroundTransparency = 1
	leftTitle.Text = "Whitelist Status"
	leftTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	leftTitle.Font = Enum.Font.GothamBold
	leftTitle.TextSize = 16
	leftTitle.TextXAlignment = Enum.TextXAlignment.Left
	leftTitle.TextYAlignment = Enum.TextYAlignment.Center
	leftTitle.Parent = headerContainer

	local statusIndicator = Instance.new("Frame")
	statusIndicator.Name = "StatusIndicator"
	statusIndicator.Position = UDim2.new(0, 15, 0, 50)
	statusIndicator.Size = UDim2.new(1, -30, 0, 65)
	statusIndicator.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
	statusIndicator.BorderSizePixel = 0
	statusIndicator.Parent = leftPanel

	local statusCorner = Instance.new("UICorner")
	statusCorner.CornerRadius = UDim.new(0, 6)
	statusCorner.Parent = statusIndicator

	local statusAccent = Instance.new("Frame")
	statusAccent.Name = "StatusAccent"
	statusAccent.Size = UDim2.new(1, 0, 0, 3)
	statusAccent.Position = UDim2.new(0, 0, 0, 0)
	statusAccent.BackgroundColor3 = Color3.fromRGB(255, 200, 100)
	statusAccent.BorderSizePixel = 0
	statusAccent.Parent = statusIndicator

	local statusAccentCorner = Instance.new("UICorner")
	statusAccentCorner.CornerRadius = UDim.new(0, 6)
	statusAccentCorner.Parent = statusAccent

	local statusText = Instance.new("TextLabel")
	statusText.Name = "StatusText"
	statusText.Size = UDim2.new(1, -20, 0, 25)
	statusText.Position = UDim2.new(0, 10, 0, 8)
	statusText.BackgroundTransparency = 1
	statusText.Text = "Checking..."
	statusText.TextColor3 = Color3.fromRGB(255, 200, 100)
	statusText.Font = Enum.Font.GothamBold
	statusText.TextSize = 14
	statusText.TextXAlignment = Enum.TextXAlignment.Left
	statusText.Parent = statusIndicator

	local statusDetails = Instance.new("TextLabel")
	statusDetails.Name = "StatusDetails"
	statusDetails.Size = UDim2.new(1, -20, 0, 20)
	statusDetails.Position = UDim2.new(0, 10, 0, 33)
	statusDetails.BackgroundTransparency = 1
	statusDetails.Text = "Initializing..."
	statusDetails.TextColor3 = Color3.fromRGB(180, 180, 180)
	statusDetails.Font = Enum.Font.Gotham
	statusDetails.TextSize = 11
	statusDetails.TextXAlignment = Enum.TextXAlignment.Left
	statusDetails.TextWrapped = true
	statusDetails.Parent = statusIndicator

	local hwidLabel = Instance.new("TextLabel")
	hwidLabel.Name = "HwidLabel"
	hwidLabel.Position = UDim2.new(0, 15, 0, 125)
	hwidLabel.Size = UDim2.new(1, -30, 0, 18)
	hwidLabel.BackgroundTransparency = 1
	hwidLabel.Text = "Hardware ID"
	hwidLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
	hwidLabel.Font = Enum.Font.GothamBold
	hwidLabel.TextSize = 11
	hwidLabel.TextXAlignment = Enum.TextXAlignment.Left
	hwidLabel.Parent = leftPanel

	local hwidDisplay = Instance.new("TextBox")
	hwidDisplay.Name = "HwidDisplay"
	hwidDisplay.Position = UDim2.new(0, 15, 0, 145)
	hwidDisplay.Size = UDim2.new(1, -30, 0, 32)
	hwidDisplay.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
	hwidDisplay.Text = getHwid()
	hwidDisplay.TextColor3 = Color3.fromRGB(200, 200, 200)
	hwidDisplay.Font = Enum.Font.Code
	hwidDisplay.TextSize = 10
	hwidDisplay.TextEditable = false
	hwidDisplay.ClearTextOnFocus = false
	hwidDisplay.Parent = leftPanel

	local hwidCorner = Instance.new("UICorner")
	hwidCorner.CornerRadius = UDim.new(0, 6)
	hwidCorner.Parent = hwidDisplay

	local hwidStroke = Instance.new("UIStroke")
	hwidStroke.Color = Color3.fromRGB(50, 60, 80)
	hwidStroke.Thickness = 1
	hwidStroke.Parent = hwidDisplay

	local connectionInfoContainer = Instance.new("Frame")
	connectionInfoContainer.Name = "ConnectionInfoContainer"
	connectionInfoContainer.Position = UDim2.new(0, 15, 0, 187)
	connectionInfoContainer.Size = UDim2.new(1, -30, 0, 65)
	connectionInfoContainer.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
	connectionInfoContainer.BorderSizePixel = 0
	connectionInfoContainer.Parent = leftPanel

	local connectionInfoCorner = Instance.new("UICorner")
	connectionInfoCorner.CornerRadius = UDim.new(0, 6)
	connectionInfoCorner.Parent = connectionInfoContainer

	local connectionInfoStroke = Instance.new("UIStroke")
	connectionInfoStroke.Color = Color3.fromRGB(50, 60, 80)
	connectionInfoStroke.Thickness = 1
	connectionInfoStroke.Parent = connectionInfoContainer

	local connectionTitle = Instance.new("TextLabel")
	connectionTitle.Name = "ConnectionTitle"
	connectionTitle.Position = UDim2.new(0, 10, 0, 5)
	connectionTitle.Size = UDim2.new(1, -20, 0, 15)
	connectionTitle.BackgroundTransparency = 1
	connectionTitle.Text = "Server Status"
	connectionTitle.TextColor3 = Color3.fromRGB(130, 130, 130)
	connectionTitle.Font = Enum.Font.Gotham
	connectionTitle.TextSize = 10
	connectionTitle.TextXAlignment = Enum.TextXAlignment.Left
	connectionTitle.Parent = connectionInfoContainer

	local primaryLabel = Instance.new("TextLabel")
	primaryLabel.Name = "PrimaryLabel"
	primaryLabel.Position = UDim2.new(0, 10, 0, 23)
	primaryLabel.Size = UDim2.new(0.5, -10, 0, 12)
	primaryLabel.BackgroundTransparency = 1
	primaryLabel.Text = "Primary:"
	primaryLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
	primaryLabel.Font = Enum.Font.Gotham
	primaryLabel.TextSize = 9
	primaryLabel.TextXAlignment = Enum.TextXAlignment.Left
	primaryLabel.Parent = connectionInfoContainer

	local primaryStatus = Instance.new("TextLabel")
	primaryStatus.Name = "PrimaryStatus"
	primaryStatus.Position = UDim2.new(0.5, 0, 0, 23)
	primaryStatus.Size = UDim2.new(0.5, -10, 0, 12)
	primaryStatus.BackgroundTransparency = 1
	primaryStatus.Text = "Checking..."
	primaryStatus.TextColor3 = Color3.fromRGB(255, 200, 100)
	primaryStatus.Font = Enum.Font.GothamBold
	primaryStatus.TextSize = 9
	primaryStatus.TextXAlignment = Enum.TextXAlignment.Right
	primaryStatus.Parent = connectionInfoContainer

	local fallbackLabel = Instance.new("TextLabel")
	fallbackLabel.Name = "FallbackLabel"
	fallbackLabel.Position = UDim2.new(0, 10, 0, 37)
	fallbackLabel.Size = UDim2.new(0.5, -10, 0, 12)
	fallbackLabel.BackgroundTransparency = 1
	fallbackLabel.Text = "Fallback:"
	fallbackLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
	fallbackLabel.Font = Enum.Font.Gotham
	fallbackLabel.TextSize = 9
	fallbackLabel.TextXAlignment = Enum.TextXAlignment.Left
	fallbackLabel.Parent = connectionInfoContainer

	local fallbackStatus = Instance.new("TextLabel")
	fallbackStatus.Name = "FallbackStatus"
	fallbackStatus.Position = UDim2.new(0.5, 0, 0, 37)
	fallbackStatus.Size = UDim2.new(0.5, -10, 0, 12)
	fallbackStatus.BackgroundTransparency = 1
	fallbackStatus.Text = "Standby"
	fallbackStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
	fallbackStatus.Font = Enum.Font.GothamBold
	fallbackStatus.TextSize = 9
	fallbackStatus.TextXAlignment = Enum.TextXAlignment.Right
	fallbackStatus.Parent = connectionInfoContainer

	local lastCheckLabel = Instance.new("TextLabel")
	lastCheckLabel.Name = "LastCheckLabel"
	lastCheckLabel.Position = UDim2.new(0, 10, 0, 51)
	lastCheckLabel.Size = UDim2.new(0.5, -10, 0, 12)
	lastCheckLabel.BackgroundTransparency = 1
	lastCheckLabel.Text = "Last Check:"
	lastCheckLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
	lastCheckLabel.Font = Enum.Font.Gotham
	lastCheckLabel.TextSize = 9
	lastCheckLabel.TextXAlignment = Enum.TextXAlignment.Left
	lastCheckLabel.Parent = connectionInfoContainer

	local lastCheckTime = Instance.new("TextLabel")
	lastCheckTime.Name = "LastCheckTime"
	lastCheckTime.Position = UDim2.new(0.5, 0, 0, 51)
	lastCheckTime.Size = UDim2.new(0.5, -10, 0, 12)
	lastCheckTime.BackgroundTransparency = 1
	lastCheckTime.Text = os.date("%H:%M:%S")
	lastCheckTime.TextColor3 = Color3.fromRGB(200, 200, 200)
	lastCheckTime.Font = Enum.Font.GothamBold
	lastCheckTime.TextSize = 9
	lastCheckTime.TextXAlignment = Enum.TextXAlignment.Right
	lastCheckTime.Parent = connectionInfoContainer

	local gameInfoContainer = Instance.new("Frame")
	gameInfoContainer.Name = "GameInfoContainer"
	gameInfoContainer.Position = UDim2.new(0, 15, 0, 262)
	gameInfoContainer.Size = UDim2.new(1, -30, 0, 58)
	gameInfoContainer.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
	gameInfoContainer.BorderSizePixel = 0
	gameInfoContainer.Parent = leftPanel

	local gameInfoCorner = Instance.new("UICorner")
	gameInfoCorner.CornerRadius = UDim.new(0, 6)
	gameInfoCorner.Parent = gameInfoContainer

	local gameInfoStroke = Instance.new("UIStroke")
	gameInfoStroke.Color = Color3.fromRGB(50, 60, 80)
	gameInfoStroke.Thickness = 1
	gameInfoStroke.Parent = gameInfoContainer

	local gameNameLabel = Instance.new("TextLabel")
	gameNameLabel.Name = "GameNameLabel"
	gameNameLabel.Position = UDim2.new(0, 10, 0, 5)
	gameNameLabel.Size = UDim2.new(1, -20, 0, 15)
	gameNameLabel.BackgroundTransparency = 1
	gameNameLabel.Text = "Current Game:"
	gameNameLabel.TextColor3 = Color3.fromRGB(130, 130, 130)
	gameNameLabel.Font = Enum.Font.Gotham
	gameNameLabel.TextSize = 10
	gameNameLabel.TextXAlignment = Enum.TextXAlignment.Left
	gameNameLabel.Parent = gameInfoContainer

	local gameName = Instance.new("TextLabel")
	gameName.Name = "GameName"
	gameName.Position = UDim2.new(0, 10, 0, 20)
	gameName.Size = UDim2.new(1, -20, 0, 15)
	gameName.BackgroundTransparency = 1

	local gameNameText = "Loading..."
	pcall(function()
		local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
		gameNameText = gameInfo.Name
	end)

	gameName.Text = gameNameText
	gameName.TextColor3 = Color3.fromRGB(200, 200, 200)
	gameName.Font = Enum.Font.GothamBold
	gameName.TextSize = 11
	gameName.TextXAlignment = Enum.TextXAlignment.Left
	gameName.TextTruncate = Enum.TextTruncate.AtEnd
	gameName.Parent = gameInfoContainer

	local gameIdLabel = Instance.new("TextLabel")
	gameIdLabel.Name = "GameIdLabel"
	gameIdLabel.Position = UDim2.new(0, 10, 0, 37)
	gameIdLabel.Size = UDim2.new(0.5, -10, 0, 13)
	gameIdLabel.BackgroundTransparency = 1
	gameIdLabel.Text = "Place ID: " .. tostring(game.PlaceId)
	gameIdLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
	gameIdLabel.Font = Enum.Font.Code
	gameIdLabel.TextSize = 9
	gameIdLabel.TextXAlignment = Enum.TextXAlignment.Left
	gameIdLabel.Parent = gameInfoContainer

	local buttonsContainer = Instance.new("Frame")
	buttonsContainer.Name = "ButtonsContainer"
	buttonsContainer.Position = UDim2.new(0, 15, 1, -43)
	buttonsContainer.Size = UDim2.new(1, -30, 0, 35)
	buttonsContainer.BackgroundTransparency = 1
	buttonsContainer.Parent = leftPanel

	local copyButton = Instance.new("TextButton")
	copyButton.Name = "CopyButton"
	copyButton.Position = UDim2.new(0, 0, 0, 0)
	copyButton.Size = UDim2.new(0.48, 0, 1, 0)
	copyButton.BackgroundColor3 = Color3.fromRGB(80, 90, 120)
	copyButton.BackgroundTransparency = 0.7
	copyButton.Text = "Copy Link"
	copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	copyButton.Font = Enum.Font.GothamBold
	copyButton.TextSize = 12
	copyButton.Parent = buttonsContainer

	local copyCorner = Instance.new("UICorner")
	copyCorner.CornerRadius = UDim.new(0, 6)
	copyCorner.Parent = copyButton

	local copyStroke = Instance.new("UIStroke")
	copyStroke.Color = Color3.fromRGB(100, 110, 140)
	copyStroke.Transparency = 0.7
	copyStroke.Thickness = 1
	copyStroke.Parent = copyButton

	local verifyButton = Instance.new("TextButton")
	verifyButton.Name = "VerifyButton"
	verifyButton.Position = UDim2.new(0.52, 0, 0, 0)
	verifyButton.Size = UDim2.new(0.48, 0, 1, 0)
	verifyButton.BackgroundColor3 = Color3.fromRGB(60, 150, 100)
	verifyButton.Text = "Verify Status"
	verifyButton.BackgroundTransparency = 0.7
	verifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	verifyButton.Font = Enum.Font.GothamBold
	verifyButton.TextSize = 12
	verifyButton.Parent = buttonsContainer

	local verifyCorner = Instance.new("UICorner")
	verifyCorner.CornerRadius = UDim.new(0, 6)
	verifyCorner.Parent = verifyButton

	local verifyStroke = Instance.new("UIStroke")
	verifyStroke.Color = Color3.fromRGB(80, 170, 120)
	verifyStroke.Transparency = 0.7
	verifyStroke.Thickness = 1
	verifyStroke.Parent = verifyButton

	local rightPanel = Instance.new("Frame")
	rightPanel.Name = "RightPanel"
	rightPanel.Position = UDim2.new(0.5, 5, 0, 0)
	rightPanel.Size = UDim2.new(0.5, -5, 1, 0)
	rightPanel.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
	rightPanel.BorderSizePixel = 0
	rightPanel.Parent = contentContainer

	local rightCorner = Instance.new("UICorner")
	rightCorner.CornerRadius = UDim.new(0, 8)
	rightCorner.Parent = rightPanel

	local rightStroke = Instance.new("UIStroke")
	rightStroke.Color = Color3.fromRGB(50, 60, 80)
	rightStroke.Thickness = 1
	rightStroke.Parent = rightPanel

	local consoleTitle = Instance.new("TextLabel")
	consoleTitle.Name = "ConsoleTitle"
	consoleTitle.Position = UDim2.new(0, 15, 0, 15)
	consoleTitle.Size = UDim2.new(1, -30, 0, 25)
	consoleTitle.BackgroundTransparency = 1
	consoleTitle.Text = "Console Output"
	consoleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	consoleTitle.Font = Enum.Font.GothamBold
	consoleTitle.TextSize = 18
	consoleTitle.TextXAlignment = Enum.TextXAlignment.Left
	consoleTitle.Parent = rightPanel

	local consoleContainer = Instance.new("ScrollingFrame")
	consoleContainer.Name = "ConsoleContainer"
	consoleContainer.Position = UDim2.new(0, 15, 0, 50)
	consoleContainer.Size = UDim2.new(1, -30, 1, -65)
	consoleContainer.BackgroundColor3 = Color3.fromRGB(15, 18, 25)
	consoleContainer.BorderSizePixel = 0
	consoleContainer.ScrollBarThickness = 4
	consoleContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
	consoleContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
	consoleContainer.Parent = rightPanel

	local consoleCorner = Instance.new("UICorner")
	consoleCorner.CornerRadius = UDim.new(0, 6)
	consoleCorner.Parent = consoleContainer

	local consoleLayout = Instance.new("UIListLayout")
	consoleLayout.SortOrder = Enum.SortOrder.LayoutOrder
	consoleLayout.Padding = UDim.new(0, 2)
	consoleLayout.Parent = consoleContainer

	local consolePadding = Instance.new("UIPadding")
	consolePadding.PaddingLeft = UDim.new(0, 8)
	consolePadding.PaddingRight = UDim.new(0, 8)
	consolePadding.PaddingTop = UDim.new(0, 8)
	consolePadding.PaddingBottom = UDim.new(0, 8)
	consolePadding.Parent = consoleContainer

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
		lastCheckTime.Text = os.date("%H:%M:%S")

		-- server status 
		if result.usedFallback then
			-- fallback 
			primaryStatus.Text = "Failed"
			primaryStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
			fallbackStatus.Text = "Active"
			fallbackStatus.TextColor3 = Color3.fromRGB(100, 255, 150)
		elseif result.code == "CONNECTION_FAILED" then
			-- Both failed
			primaryStatus.Text = "Offline"
			primaryStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
			fallbackStatus.Text = "Offline"
			fallbackStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
		else
			-- Primary work
			primaryStatus.Text = "Online"
			primaryStatus.TextColor3 = Color3.fromRGB(100, 255, 150)
			fallbackStatus.Text = "Standby"
			fallbackStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
		end

		if result.success then
			statusText.Text = result.message
			statusText.TextColor3 = Color3.fromRGB(100, 255, 150)
			statusDetails.Text = result.details
			statusIndicator.BackgroundColor3 = Color3.fromRGB(20, 60, 40)
			statusAccent.BackgroundColor3 = Color3.fromRGB(100, 255, 150)
			statusIcon.BackgroundColor3 = Color3.fromRGB(100, 255, 150)
			addConsoleLog("✓ Whitelist verified successfully!", Color3.fromRGB(100, 255, 150))
			addConsoleLog("  " .. result.details, Color3.fromRGB(150, 150, 150))
		else
			statusText.Text = result.message
			statusText.TextColor3 = Color3.fromRGB(255, 100, 100)
			statusDetails.Text = result.details
			statusIndicator.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
			statusAccent.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
			statusIcon.BackgroundColor3 = Color3.fromRGB(255, 100, 100)

			addConsoleLog("✗ Check failed: " .. result.message, Color3.fromRGB(255, 100, 100))
			addConsoleLog("  Reason: " .. result.details, Color3.fromRGB(180, 180, 180))
			if result.code then
				addConsoleLog("  Error code: " .. result.code, Color3.fromRGB(150, 150, 150))
			end
		end
	end

	copyButton.Activated:Connect(function()
		local link = getKeylink()
		setclipboard(link)
		addConsoleLog("[>] Whitelist link copied to clipboard", Color3.fromRGB(100, 200, 255))

		local originalText = copyButton.Text
		copyButton.Text = "Copied!"
		task.wait(1.5)
		copyButton.Text = originalText
	end)

	local isChecking = false
	verifyButton.Activated:Connect(function()
		if isChecking then return end

		isChecking = true
		verifyButton.Text = "Checking..."
		addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		addConsoleLog("⟳ Manual whitelist check initiated", Color3.fromRGB(100, 200, 255))

		local result = checkWhitelist(addConsoleLog)
		updateStatus(result)

		if result.success then
			addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
			addConsoleLog("✓ Access granted! Closing in 2 seconds...", Color3.fromRGB(100, 255, 150))
			task.wait(2)
			
			loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()

			gui:Destroy()
		else
			addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		end

		verifyButton.Text = "Verify Status"
		isChecking = false
	end)

	closeBtn.Activated:Connect(function()
		addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		addConsoleLog("⊗ Closing whitelist window...", Color3.fromRGB(255, 200, 100))
		task.wait(0.3)
		gui:Destroy()
	end)

	local function updateWindowSize()
		local viewportSize = workspace.CurrentCamera.ViewportSize
		local aspectRatio = viewportSize.X / viewportSize.Y

		if viewportSize.X < 600 or viewportSize.Y < 400 then
			mainWindow.Size = UDim2.new(0.95, 0, 0.85, 0)
			sizeConstraint.MinSize = Vector2.new(300, 250)
		else
			mainWindow.Size = UDim2.new(0, 700, 0, 450)
		end
	end

	updateWindowSize()
	workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateWindowSize)

	-- Initial log
	addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
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
		-- addConsoleLog("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", Color3.fromRGB(80, 80, 80))
		-- addConsoleLog("✓ Already verified! Closing in 2 seconds...", Color3.fromRGB(100, 255, 150))
		-- task.wait(2)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/refs/heads/main/Trigon_Evo_Beta.lua",true))()

		gui:Destroy()
	end
end
