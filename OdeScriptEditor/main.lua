local Lexer = loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/OdeScriptEditor/lexer.lua",true))()
local LuaTable = loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/OdeScriptEditor/LuaTable.lua",true))() 
local SignalModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/OdeScriptEditor/SignalModule.lua",true))() 
local GetTextBoxScrolling = loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/OdeScriptEditor/GetTextBoxScrolling.lua",true))() 


local Storage = Instance.new("Folder")
local LineNumber = Instance.new("TextLabel")
local RichOverlayLabel = Instance.new("TextLabel")

Storage.Name = "Storage"
Storage.Parent = game:GetService("ReplicatedStorage")

LineNumber.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
LineNumber.Name = "LineNumber"
LineNumber.AutomaticSize = Enum.AutomaticSize.XY
LineNumber.TextSize = 14
LineNumber.Size = UDim2.new(1, -6, 0, 0)
LineNumber.ZIndex = 5
LineNumber.TextColor3 = Color3.fromRGB(204, 204, 204)
LineNumber.BorderColor3 = Color3.fromRGB(27, 42, 53)
LineNumber.BackgroundTransparency = 1
LineNumber.TextXAlignment = Enum.TextXAlignment.Right
LineNumber.Parent = Storage

RichOverlayLabel.RichText = true
RichOverlayLabel.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
RichOverlayLabel.Name = "RichOverlayLabel"
RichOverlayLabel.AutomaticSize = Enum.AutomaticSize.XY
RichOverlayLabel.TextSize = 14
RichOverlayLabel.Size = UDim2.new(1, 0, 0, 0)
RichOverlayLabel.ZIndex = 5
RichOverlayLabel.TextColor3 = Color3.fromRGB(204, 204, 204)
RichOverlayLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
RichOverlayLabel.BackgroundTransparency = 1
RichOverlayLabel.TextXAlignment = Enum.TextXAlignment.Left
RichOverlayLabel.Parent = Storage




local OSEBackground = Instance.new("Frame")
local LineNumberBackground = Instance.new("Frame")
local LineNumberContainer = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local RichOverlayContainer = Instance.new("Frame")
local ShiftContainer = Instance.new("Frame")
local UIListLayout_1 = Instance.new("UIListLayout")
local CodeField = Instance.new("TextBox")

OSEBackground.BorderSizePixel = 0
OSEBackground.BackgroundColor3 = Color3.fromRGB(38.25, 38.25, 38.25)
OSEBackground.Size = UDim2.new(1, 0, 1, 0)
OSEBackground.BorderColor3 = Color3.fromRGB(27, 42, 53)
OSEBackground.BackgroundTransparency = 1
OSEBackground.Name = "OSEBackground"
OSEBackground.Parent = game:GetService("ReplicatedStorage")

LineNumberBackground.BorderSizePixel = 0
LineNumberBackground.BackgroundColor3 = Color3.fromRGB(216, 228, 255)
LineNumberBackground.Size = UDim2.new(0, 16, 1, 0)
LineNumberBackground.BorderColor3 = Color3.fromRGB(27, 42, 53)
LineNumberBackground.BackgroundTransparency = 0.96
LineNumberBackground.Name = "LineNumberBackground"
LineNumberBackground.Parent = OSEBackground

LineNumberContainer.Size = UDim2.new(0, 16, 1, -10)
LineNumberContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
LineNumberContainer.BackgroundTransparency = 1
LineNumberContainer.Name = "LineNumberContainer"
LineNumberContainer.Position = UDim2.new(0, 0, 0, 5)
LineNumberContainer.ZIndex = 2
LineNumberContainer.Parent = OSEBackground

UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = LineNumberContainer

RichOverlayContainer.Active = true
RichOverlayContainer.Size = UDim2.new(1, -30, 1, -10)
RichOverlayContainer.ClipsDescendants = true
RichOverlayContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
RichOverlayContainer.BackgroundTransparency = 1
RichOverlayContainer.Name = "RichOverlayContainer"
RichOverlayContainer.Position = UDim2.new(0, 25, 0, 5)
RichOverlayContainer.Parent = OSEBackground

ShiftContainer.Active = true
ShiftContainer.Size = UDim2.new(3, 0, 1, 0)
ShiftContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
ShiftContainer.BackgroundTransparency = 1
ShiftContainer.Name = "ShiftContainer"
ShiftContainer.Parent = RichOverlayContainer

UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_1.Parent = ShiftContainer

CodeField.Position = UDim2.new(0, 25, 0, 5)
CodeField.BackgroundTransparency = 1
CodeField.MultiLine = true
CodeField.TextYAlignment = Enum.TextYAlignment.Top
CodeField.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
CodeField.TextTransparency = 0.5
CodeField.ClipsDescendants = true
CodeField.TextSize = 14
CodeField.Size = UDim2.new(1, -30, 1, -10)
CodeField.TextColor3 = Color3.fromRGB(204, 204, 204)
CodeField.BorderColor3 = Color3.fromRGB(27, 42, 53)
CodeField.Text = ""
CodeField.Name = "CodeField"
CodeField.TextXAlignment = Enum.TextXAlignment.Left
CodeField.ClearTextOnFocus = false
CodeField.Parent = OSEBackground


local OdeScriptEditor = {}
OdeScriptEditor.__index = OdeScriptEditor

local OdeDefaultTheme = {
	background = Color3.fromRGB(37, 37, 37),

	sidebar = Color3.fromRGB(47, 47, 47),

	text = Color3.fromRGB(204, 204, 204),

	keyword = {
		color = Color3.fromRGB(248, 109, 124),
		isBold = true,
	},

	builtin = {
		color = Color3.fromRGB(132, 214, 247),
		isBold = true,
	},

	string = {
		color = Color3.fromRGB(173, 241, 149),
		isBold = false,
	},

	number = {
		color = Color3.fromRGB(255, 198, 0),
		isBold = false,
	},

	comment = {
		color = Color3.fromRGB(102, 102, 102),
		isBold = false,
	},


	lprop = {
		color = Color3.fromRGB(97, 161, 241),
		isBold = false,
	},

	lmethod = {
		color = Color3.fromRGB(253, 251, 172),
		isBold = false,
	},

	bool = {
		color = Color3.fromRGB(255, 198, 0),
		isBold = true,
	},


	operator = {
		color = Color3.fromRGB(204, 204, 204),
		isBold = false,
	},

	method = {
		color = Color3.fromRGB(253, 251, 172),
		isBold = false,
	},

	luau = {
		color = Color3.fromRGB(248, 109, 124),
		isBold = true,
	},

	["nil"] = {
		color = Color3.fromRGB(248, 109, 124),
		isBold = true,
	},

	["function"] = {
		color = Color3.fromRGB(248, 109, 124),
		isBold = true,
	},

	["local"] = {
		color = Color3.fromRGB(248, 109, 124),
		isBold = true,
	},

	["self"] = {
		color = Color3.fromRGB(248, 109, 124),
		isBold = true,
	},
}

local lib_methods = {
	bit32 = true,
	coroutine = true,
	debug = true,
	math = true,
	os = true,
	string = true,
	table = true,
	utf8 = true,

	task = true,
	buffer = true,

	Axes = 'builtin', BrickColor = 'builtin', CFrame = 'builtin', Color3 = 'builtin', ColorSequence = 'builtin', ColorSequenceKeypoint = 'builtin', DateTime = 'builtin', DockWidgetPluginGuiInfo = 'builtin',
	Faces = 'builtin', Instance = 'builtin', NumberRange = 'builtin', NumberSequence = 'builtin', NumberSequenceKeypoint = 'builtin', PathWaypoint = 'builtin', PhysicalProperties = 'builtin', Random = 'builtin',
	Ray = 'builtin', RaycastParams = 'builtin', Rect = 'builtin', Region3 = 'builtin', Region3int16 = 'builtin', TweenInfo = 'builtin', UDim = 'builtin', UDim2 = 'builtin', Vector2 = 'builtin',
	Vector2int16 = 'builtin', Vector3 = 'builtin', Vector3int16 = 'builtin',

	CatalogSearchParams = 'builtin', FloatCurveKey = 'builtin', Font = 'builtin', OverlapParams = 'builtin', SharedTable = 'builtin',
}

local odeHighlightColorsInfo = {
	keyword = {"Keyword Color", true},
	builtin = {"Built-in Function Color", true},
	string = {"String Color", false},
	number = {"Number Color", false},
	comment = {"Comment Color", false},

	lprop = {"Property Color", false},
	lmethod = {"Method Color", false},
	method = {"Function Name Color", false},
	bool = {"Bool Color", true},

	operator = {"Operator Color", false},
	luau = {"Luau Keyword Color", true},
	["nil"] = {"\"nil\" Color", true},
	["function"] = {"\"function\" Color", true},
	["local"] = {"\"local\" Color", true},
	["self"] = {"\"self\" Color", true},
}

local tokenNameTypes = {
	["local"] = "local",
	["function"] = "function",
	["self"] = "self",
	["nil"] = "nil",
	["true"] = "bool",
	["false"] = "bool",

	["type"] = "luau",
	["typeof"] = "luau",
	["export"] = "luau",
	["continue"] = "luau",
}

local function replace(str, s, e, replacementString)
	local before = string.sub(str, 1, s - 1)
	local after = string.sub(str, e + 1, str:len())

	return before .. replacementString .. after
end

local function rawWrapString(str, substr, Start, End, color, isBold)
	local r, g, b = math.ceil(color.R*255), math.ceil(color.G*255), math.ceil(color.B*255)
	local colorStrStart = '<font color="' .. 'rgb(' .. r .. ',' .. g .. ',' .. b .. ')">'
	local bold = ''
	local afterbold = ''

	if isBold then
		bold = '<b>'
		afterbold = '</b>'
	end

	return replace(str, Start, End, colorStrStart .. bold .. substr .. afterbold .. '</font>')
end

local function iterateThruAndReplace(str, pattern, replacement)
	local cleanStr, replacements = string.gsub(str, pattern, replacement)
	return cleanStr
end

--https://stackoverflow.com/questions/51181222/lua-trailing-space-removal
local function trimWhitespace(str)
	return string.gsub(str, '^%s*(.-)%s*$', '%1')
end

local function getTrueTokenData(i, tokenData, scanData)
	local prevTokenData = scanData[i - 1]
	local nextTokenData = scanData[i + 1]

	local token = tokenData.token

	if token == "iden" then
		local prevIndexData = scanData[i - 2]

		if prevTokenData and prevTokenData.src == "." then
			token = "lprop"
		end

		if nextTokenData and (nextTokenData.src:match("^%(") or nextTokenData.src:match("^{") or nextTokenData.src:match("^\"") or nextTokenData.src:match("^\'") or nextTokenData.src:match("%[%[")) then
			if prevTokenData and prevTokenData.src == "." then
				token = "lmethod"
			else
				token = "method"
			end
		end
	end

	local tokenText = trimWhitespace(tokenData.src)
	local trueToken = tokenNameTypes[tokenText]

	if trueToken then
		token = trueToken
	end

	return token
end

local function escapeRich(code)
	local cleanCode = iterateThruAndReplace(code, "&", "&amp;")

	cleanCode = iterateThruAndReplace(cleanCode, "<", "&lt;")
	cleanCode = iterateThruAndReplace(cleanCode, ">", "&gt;")

	cleanCode = iterateThruAndReplace(cleanCode, "\"", "&quot;")
	cleanCode = iterateThruAndReplace(cleanCode, "\'", "&apos;")

	return cleanCode
end

local function tabsToSpaces(code)
	return iterateThruAndReplace(code, "\9", "    ")
end

local function spacesToTabs(code)
	return iterateThruAndReplace(code, "    ", "\9")
end

local function colorify(code, theme)
	theme = theme or OdeDefaultTheme

	local highlight = code

	local size = code:len()
	local increase = 0

	local scanData = Lexer.run(code)

	for i, tokenData in scanData do
		local token = tokenData.token
		token = getTrueTokenData(i, tokenData, scanData)

		local colorData = theme[token]

		if colorData then
			local trim = tokenData.trim
			local src = tokenData.src

			local End = trim - 1 + increase
			local Start = trim - src:len() + increase

			local color = colorData.color
			local isBold = colorData.isBold

			local escapedToken = escapeRich(src)

			highlight = rawWrapString(highlight, escapedToken, Start, End, color, isBold)--wrapstring(highlight, Start, End, color, isBold)
			increase = math.abs(highlight:len() - size)
		end
	end
	--trim, token, src

	return highlight
end

local registerEditEvent = true

local function rawEditCodeField(scriptEditor, text)
	registerEditEvent = false
	scriptEditor.Background.CodeField.Text = text

	task.defer(function()
		registerEditEvent = true
	end)
end

local function fixCodeFieldLines(scriptEditor, originalSize)
	local codeField = scriptEditor.Background.CodeField
	local newCode = codeField.Text

	if scriptEditor.VisibleLines > originalSize then
		for i = originalSize + 1, scriptEditor.VisibleLines do
			local line = scriptEditor.SourceData.Code[scriptEditor.LineFocused + i - 1]

			if i > scriptEditor.SourceData.Size then
				break
			end

			if not line then
				break
			end

			newCode ..= "\n" .. line
		end
	elseif scriptEditor.VisibleLines < originalSize then
		local lines = string.split(newCode, "\n")
		local replacementText = lines[1] or ""

		for i = 2, scriptEditor.VisibleLines do
			if i + scriptEditor.LineFocused - 1 > scriptEditor.SourceData.Size then
				break
			end

			replacementText = replacementText .. "\n" .. (lines[i] or "")
		end

		newCode = replacementText
	end

	return newCode
end

local function declareCurrentTextSize(scriptEditor, textWidth)
	local codeField = scriptEditor.Background.CodeField
	local richOverlayContainer = scriptEditor.Background.RichOverlayContainer

	local textHeight = textWidth*2

	local genericSize = codeField.Size
	local currentWidth = codeField.AbsoluteSize.X
	local currentHeight = codeField.AbsoluteSize.Y

	local newSize = UDim2.new(1, genericSize.X.Offset - currentWidth%textWidth + 1, 1, -10 - currentHeight%textHeight)

	codeField.Size = newSize
	richOverlayContainer.Size = newSize

	local originalSize = scriptEditor.VisibleLines

	recountVisibleLines(scriptEditor)
	codeField.Text = fixCodeFieldLines(scriptEditor, originalSize)
end

local function moveShiftContainer(scriptEditor)
	local background = scriptEditor.Background
	local codeField = background.CodeField
	local shiftContainer = background.RichOverlayContainer.ShiftContainer

	scriptEditor.ScrollingShift = GetTextBoxScrolling.UpdateShift(codeField, codeField.CursorPosition, scriptEditor.ScrollingShift)
	shiftContainer.Position = UDim2.new(0, -scriptEditor.ScrollingShift, 0, 0)
end

local function updateLines(scriptEditor)
	local lineNumbers = {}

	local visibleCodeLines = {}
	table.move(scriptEditor.SourceData.Code, scriptEditor.LineFocused, scriptEditor.LineFocused + scriptEditor.VisibleLines, 1, visibleCodeLines)

	for i = 1, scriptEditor.VisibleLines + 1 do
		local line = scriptEditor.SourceData.Code[scriptEditor.LineFocused + i - 1]--lines[i]

		if not line then
			break
		end

		table.insert(lineNumbers, i + scriptEditor.LineFocused - 1)
	end

	local visibleCodeSegment = table.concat(visibleCodeLines, "\n")

	scriptEditor.Background.LineNumberContainer.LineNumber.Text = table.concat(lineNumbers, "\n")
	scriptEditor.Background.RichOverlayContainer.ShiftContainer.RichOverlayLabel.Text = colorify(tabsToSpaces(visibleCodeSegment), scriptEditor.Theme)
end

local function getSortedHookModules()
    local AutoIndent = loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/OdeScriptEditor/AutoIndent.lua",true))() 
    local AutoWrap = loadstring(game:HttpGet("https://raw.githubusercontent.com/relbaldski/bald/main/OdeScriptEditor/AutoWrap.lua",true))() 

	local hookModules = {AutoIndent, AutoWrap}

	table.sort(hookModules, function(a, b)
		return a.RunOrder < b.RunOrder
	end)

	return hookModules
end


local function onCodeFieldEdit(scriptEditor)
	if not registerEditEvent then
		registerEditEvent = true

		return
	end

	local background = scriptEditor.Background
	local codeField = background.CodeField

	local newText = codeField.Text
	local lines = string.split(newText, "\n")

	local finalRawCode = newText
	task.defer(function()
		local lineNumberWidth = 6*math.ceil(math.log10(#scriptEditor.SourceData.Code + .1))
		background.LineNumberContainer.Size = UDim2.new(0, lineNumberWidth + 3, 1, -10)
		background.LineNumberBackground.Size = UDim2.new(0, lineNumberWidth + 6, 1, 0)

		codeField.Position = UDim2.new(0, lineNumberWidth + 9, 0, 5)
		codeField.Size = UDim2.new(1, -(lineNumberWidth + 9 + 5), 1, -10)

		background.RichOverlayContainer.Position = UDim2.new(0, lineNumberWidth + 9, 0, 5)
		background.RichOverlayContainer.Size = UDim2.new(1, -(lineNumberWidth + 9 + 5), 1, -10)

		declareCurrentTextSize(scriptEditor, 7)
	end)
	
	local luaArray = string.split(newText--[[spacesToTabs(newText)]], "\n")
	scriptEditor.SourceData:Write(scriptEditor.LineFocused, scriptEditor.VisibleLines, luaArray)
	scriptEditor.RawSource = scriptEditor.SourceData:ToString()

	updateLines(scriptEditor)

	local originalSize = scriptEditor.VisibleLines
	finalRawCode = fixCodeFieldLines(scriptEditor, #lines)

	local hookModules = getSortedHookModules()

	local data = {
		Code = finalRawCode,
		Gain = finalRawCode:len() - scriptEditor.DisplayCode:len(),
		Cursor = 0,
		Selection = 0,
	}
	

    for _, hookModule in ipairs(getSortedHookModules()) do
    	local method = hookModule.OnScriptChange
    
    	if method then
			method(scriptEditor, data)
    	end
    end

	finalRawCode = data.Code

	if finalRawCode ~= newText then
		--temporarily moves selection to the beginning to make sure autoindent doesn't repeatedly fire and crash
		local prevPosition = codeField.CursorPosition
		codeField.CursorPosition = -1

		codeField.Text = finalRawCode
		codeField.CursorPosition = prevPosition + data.Cursor
	else
		scriptEditor.OnEdit:Fire(scriptEditor.RawSource)
	end

	scriptEditor.DisplayCode = finalRawCode
end

local function repack(t, separator)
	local str = t[1]

	for i = 2, #t do
		if not t[i] then
			--print(i)
		end

		str = str .. separator .. t[i]
	end

	return str
end

function recountVisibleLines(scriptEditor)
	local visibleLines = math.floor(scriptEditor.Background.CodeField.AbsoluteSize.Y/14)

	scriptEditor.VisibleLines = visibleLines
end

function getLastSelectedString(scriptEditor)
	local codeField = scriptEditor.Background.CodeField

	scriptEditor._LastCursorPosition = codeField.CursorPosition
	scriptEditor._LastSelectionStart = codeField.SelectionStart

	local start = math.min(scriptEditor._LastCursorPosition, scriptEditor._LastSelectionStart)
	local finish = math.max(scriptEditor._LastCursorPosition, scriptEditor._LastSelectionStart, 1) - 1

	if start == -1 then
		start = finish + 1
	end

	scriptEditor._LastSelectedString = string.sub(codeField.Text, start, finish)
	scriptEditor._LastPreviousChar = string.sub(codeField.Text, start - 1, start - 1)
end

function OdeScriptEditor:ApplyTheme(odeThemeData)
	odeThemeData = odeThemeData or self.Theme
	self.Theme = odeThemeData

	local background = self.Background

	if #background:GetChildren() == 0 then
		return
	end

	background.BackgroundColor3 = odeThemeData.background
	background.LineNumberBackground.BackgroundColor3 = odeThemeData.sidebar
	background.CodeField.TextColor3 = odeThemeData.text

	Storage.LineNumber.TextColor3 = odeThemeData.text
	Storage.RichOverlayLabel.TextColor3 = odeThemeData.text

	for _, lineLabel: Instance in pairs(background.LineNumberContainer:GetChildren()) do
		if lineLabel:IsA("TextLabel") then
			lineLabel.TextColor3 = odeThemeData.text
		end
	end

	for _, lineLabel: Instance in pairs(background.RichOverlayContainer.ShiftContainer:GetChildren()) do
		if lineLabel:IsA("TextLabel") then
			lineLabel.TextColor3 = odeThemeData.text
		end
	end

	self:JumpTo()
end

function OdeScriptEditor:ApplyStudioTheme(studio: Studio)
	local theme = {
		background = studio["Background Color"],
		text = studio["Text Color"],
		sidebar = studio["Script Editor Scrollbar Background Color"],
	}

	for odeThemePropertyName, highlightData in odeHighlightColorsInfo do
		theme[odeThemePropertyName] = {
			color = studio[highlightData[1]],
			isBold = highlightData[2]
		}
	end

	self:ApplyTheme(theme)
end

function OdeScriptEditor:JumpTo(lineNumber: number)
	lineNumber = lineNumber or self.LineFocused
	self.LineFocused = lineNumber

	local lines = string.split(self.RawSource, "\n")
	local displayCode = ""

	for i = lineNumber, lineNumber + self.VisibleLines - 1 do
		local line = lines[i]

		if line then
			displayCode = displayCode .. line .. "\n"
		end
	end

	displayCode = string.sub(displayCode, 1, displayCode:len() - 1)
	displayCode = displayCode--tabsToSpaces(displayCode)

	if self.Background.CodeField.Text == displayCode then
		onCodeFieldEdit(self)
	else
		self.Background.CodeField.Text = displayCode
	end
end

function OdeScriptEditor:LoadStringAsync(str: string, lineNumber: number)
	self.Background.CodeField.Visible = false
	self.Background.RichOverlayContainer.Visible = false
	self.Background.LineNumberContainer.Visible = false

	-- the delay is for the specific case where Ode is embedded to a disabled plugin widget
	task.delay(1/30, function()
		recountVisibleLines(self)
		self.RawSource = str
		self.SourceData = LuaTable.FromString(str)

		self.Background.CodeField.Visible = true
		self.Background.RichOverlayContainer.Visible = true
		self.Background.LineNumberContainer.Visible = true

		self:JumpTo(lineNumber or 1)
	end)
end

function OdeScriptEditor:LoadScriptAsync(scriptObject: LuaSourceContainer, lineNumber: number)
	self:LoadStringAsync(scriptObject.Source, lineNumber)
end

function OdeScriptEditor:Unload()
	self:LoadStringAsync("")
end

function OdeScriptEditor:ReadOnly(allowEditing: boolean?)
	self.Background.CodeField.TextEditable = allowEditing or false
end

function OdeScriptEditor.Embed(frame: GuiBase2d)
	local background = OSEBackground:Clone()
	background.Parent = frame


	local scriptEditor = {
		LineFocused = 1,
		RawSource = "",
		SourceData = LuaTable.FromString(""),
		DisplayCode = "",
		Background = background,
		VisibleLines = 1,
		OutputScript = nil,

		-- used by AutoWrap
		AutoWrapEnabled = false,
		ScrollingShift = 0,
		Destroyed = false,

		OnEdit = SignalModule.new(),

		Theme = OdeDefaultTheme,
	}


	Storage.LineNumber:Clone().Parent = background.LineNumberContainer
	Storage.RichOverlayLabel:Clone().Parent = background.RichOverlayContainer.ShiftContainer

	setmetatable(scriptEditor, OdeScriptEditor)

	local codeField = background.CodeField

	codeField:GetPropertyChangedSignal("Text"):Connect(function()
		onCodeFieldEdit(scriptEditor)
	end)

	codeField:GetPropertyChangedSignal("CursorPosition"):Connect(function()
		task.defer(moveShiftContainer, scriptEditor)
	end)
	background:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		local originalSize = scriptEditor.VisibleLines

		recountVisibleLines(scriptEditor)
		codeField.Text = fixCodeFieldLines(scriptEditor, originalSize)

		updateLines(scriptEditor)

		task.defer(moveShiftContainer, scriptEditor)
	end)
	codeField.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseWheel then
			local newLineFocused = math.clamp(scriptEditor.LineFocused - input.Position.Z*3, 1, #string.split(scriptEditor.RawSource, "\n"))

			codeField:ReleaseFocus()

			scriptEditor:JumpTo(newLineFocused)
		end
	end)

    for _, hookModule in ipairs(getSortedHookModules()) do
    	local method = hookModule.OnScriptEditorInstantiation
    
    	if method then
    		method(scriptEditor)
    	end
    end
	scriptEditor:LoadStringAsync("")

	return scriptEditor
end

function OdeScriptEditor:Relocate(newFrame: GuiBase2d)
	local background = self.Background
	background.Parent = newFrame
end

function OdeScriptEditor:Destroy()
	if self.Destroyed then
		return
	end

	self.Destroyed = true

	self.Background:Destroy()
	self.OnEdit:DisconnectAll()
end

return OdeScriptEditor
