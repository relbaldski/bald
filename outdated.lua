

local _trigon =
{
	Trigon_Outdated = Instance.new("ScreenGui"),
	Canvas = Instance.new("Frame"),
	copyLink = Instance.new("ImageButton"),
	Main = Instance.new("Frame"),
	TextLabel = Instance.new("TextLabel"),
	UIPadding = Instance.new("UIPadding"),
	Icon = Instance.new("ImageLabel"),
	UICorner = Instance.new("UICorner"),
	ImageLabel = Instance.new("ImageLabel"),
	Title = Instance.new("TextLabel"),
	UITextSizeConstraint = Instance.new("UITextSizeConstraint"),
	visit = Instance.new("TextLabel"),
	UITextSizeConstraint_1 = Instance.new("UITextSizeConstraint"),
	Changelog = Instance.new("Frame"),
	Title_1 = Instance.new("TextLabel"),
	UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint"),
	UICorner_1 = Instance.new("UICorner"),
	ScrollingFrame = Instance.new("ScrollingFrame"),
	UIListLayout = Instance.new("UIListLayout"),
	UIPadding_1 = Instance.new("UIPadding"),
	item_template = Instance.new("Frame"),
	UICorner_2 = Instance.new("UICorner"),
	UIStroke = Instance.new("UIStroke"),
	Title_2 = Instance.new("TextLabel"),
	UIGradient = Instance.new("UIGradient"),
	Title_3 = Instance.new("TextLabel"),
	UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
}

_trigon.Trigon_Outdated.IgnoreGuiInset = true
_trigon.Trigon_Outdated.Name = "Trigon_Outdated"
_trigon.Trigon_Outdated.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
_trigon.Trigon_Outdated.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_trigon.Trigon_Outdated.Parent = gethui()

_trigon.Canvas.BorderSizePixel = 0
_trigon.Canvas.BackgroundColor3 = Color3.fromRGB(39, 41, 46)
_trigon.Canvas.AnchorPoint = Vector2.new(0.5, 0.5)
_trigon.Canvas.Size = UDim2.new(1, 0, 1, 0)
_trigon.Canvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
_trigon.Canvas.Name = "Canvas"
_trigon.Canvas.Position = UDim2.new(0.5, 0, 0.5, 0)
_trigon.Canvas.Parent = _trigon.Trigon_Outdated

_trigon.copyLink.BorderSizePixel = 0
_trigon.copyLink.Position = UDim2.new(0.5, 0, 0.9, 0)
_trigon.copyLink.BackgroundColor3 = Color3.fromRGB(221, 221, 245)
_trigon.copyLink.Name = "copyLink"
_trigon.copyLink.AnchorPoint = Vector2.new(0.5, 0.9)
_trigon.copyLink.Size = UDim2.new(0.190301, 0, 0.0700535, 0)
_trigon.copyLink.BorderColor3 = Color3.fromRGB(0, 0, 0)
_trigon.copyLink.BackgroundTransparency = 0.95
_trigon.copyLink.Parent = _trigon.Canvas

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
_trigon.TextLabel.FontFace = Font.new("rbxasset://fonts/families/Ubuntu.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
_trigon.TextLabel.Position = UDim2.new(0.57863, 0, 0.484556, 0)
_trigon.TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
_trigon.TextLabel.TextSize = 21
_trigon.TextLabel.Size = UDim2.new(0.736736, 0, 0.452381, 0)
_trigon.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
_trigon.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
_trigon.TextLabel.Text = "Copy Link To Clipboard"
_trigon.TextLabel.BackgroundTransparency = 1
_trigon.TextLabel.TextXAlignment = Enum.TextXAlignment.Left
_trigon.TextLabel.Parent = _trigon.Main

_trigon.UIPadding.Parent = _trigon.TextLabel

_trigon.Icon.ImageColor3 = Color3.fromRGB(255, 244, 158)
_trigon.Icon.BorderSizePixel = 0
_trigon.Icon.ScaleType = Enum.ScaleType.Fit
_trigon.Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.Icon.Position = UDim2.new(0.115661, 0, 0.484019, 0)
_trigon.Icon.Name = "Icon"
_trigon.Icon.AnchorPoint = Vector2.new(0.5, 0.5)
_trigon.Icon.Image = "rbxassetid://14906044812"
_trigon.Icon.Size = UDim2.new(0.108524, 0, 1.09524, 0)
_trigon.Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
_trigon.Icon.BackgroundTransparency = 1
_trigon.Icon.Parent = _trigon.Main

_trigon.UICorner.CornerRadius = UDim.new(0.08, 0)
_trigon.UICorner.Parent = _trigon.copyLink

_trigon.ImageLabel.BorderSizePixel = 0
_trigon.ImageLabel.ScaleType = Enum.ScaleType.Fit
_trigon.ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.ImageLabel.Position = UDim2.new(0.51, 0, 0.05, 0)
_trigon.ImageLabel.AnchorPoint = Vector2.new(0.51, 0.05)
_trigon.ImageLabel.Image = "rbxassetid://82500352718600"
_trigon.ImageLabel.Size = UDim2.new(0, 353, 0, 206)
_trigon.ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
_trigon.ImageLabel.BackgroundTransparency = 1
_trigon.ImageLabel.Parent = _trigon.Canvas

_trigon.Title.TextWrapped = true
_trigon.Title.TextScaled = true
_trigon.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
_trigon.Title.Position = UDim2.new(0.5, 0, 0.27104, 0)
_trigon.Title.Name = "Title"
_trigon.Title.AnchorPoint = Vector2.new(0.5, 0.25)
_trigon.Title.TextSize = 14
_trigon.Title.Size = UDim2.new(0.482036, 0, 0.0760031, 0)
_trigon.Title.TextColor3 = Color3.fromRGB(240, 240, 240)
_trigon.Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
_trigon.Title.Text = "Update Available For Trigon!"
_trigon.Title.BackgroundTransparency = 1
_trigon.Title.Parent = _trigon.Canvas

_trigon.UITextSizeConstraint.MaxTextSize = 55
_trigon.UITextSizeConstraint.Parent = _trigon.Title

_trigon.visit.TextWrapped = true
_trigon.visit.TextScaled = true
_trigon.visit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.visit.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
_trigon.visit.Position = UDim2.new(0.5, 0, 0.99535, 0)
_trigon.visit.Name = "visit"
_trigon.visit.AnchorPoint = Vector2.new(0.5, 0.95)
_trigon.visit.TextSize = 14
_trigon.visit.Size = UDim2.new(0.482036, 0, 0.0929948, 0)
_trigon.visit.TextColor3 = Color3.fromRGB(240, 240, 240)
_trigon.visit.BorderColor3 = Color3.fromRGB(27, 42, 53)
_trigon.visit.Text = "or visit: https://trigonevo.com"
_trigon.visit.BackgroundTransparency = 1
_trigon.visit.Parent = _trigon.Canvas

_trigon.UITextSizeConstraint_1.MaxTextSize = 22
_trigon.UITextSizeConstraint_1.Parent = _trigon.visit

_trigon.Changelog.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.Changelog.AnchorPoint = Vector2.new(0.5, 0.5)
_trigon.Changelog.Size = UDim2.new(0.344172, 0, 0.314708, 0)
_trigon.Changelog.BorderColor3 = Color3.fromRGB(27, 42, 53)
_trigon.Changelog.Name = "Changelog"
_trigon.Changelog.Position = UDim2.new(0.5, 0, 0.619537, 0)
_trigon.Changelog.Parent = _trigon.Canvas

_trigon.Title_1.TextWrapped = true
_trigon.Title_1.TextScaled = true
_trigon.Title_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.Title_1.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
_trigon.Title_1.Position = UDim2.new(0.0469997, 0, 0.0369999, 0)
_trigon.Title_1.Name = "Title"
_trigon.Title_1.TextSize = 14
_trigon.Title_1.Size = UDim2.new(0.893926, 0, 0.147619, 0)
_trigon.Title_1.TextColor3 = Color3.fromRGB(240, 240, 240)
_trigon.Title_1.BorderColor3 = Color3.fromRGB(27, 42, 53)
_trigon.Title_1.Text = "Changelog:"
_trigon.Title_1.BackgroundTransparency = 1
_trigon.Title_1.TextXAlignment = Enum.TextXAlignment.Left
_trigon.Title_1.Parent = _trigon.Changelog

_trigon.UITextSizeConstraint_2.MaxTextSize = 26
_trigon.UITextSizeConstraint_2.Parent = _trigon.Title_1

_trigon.UICorner_1.CornerRadius = UDim.new(0, 10)
_trigon.UICorner_1.Parent = _trigon.Changelog

_trigon.ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
_trigon.ScrollingFrame.BorderSizePixel = 0
_trigon.ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.ScrollingFrame.BackgroundTransparency = 1
_trigon.ScrollingFrame.Size = UDim2.new(0.949102, 0, 0.761723, 0)
_trigon.ScrollingFrame.Active = true
_trigon.ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
_trigon.ScrollingFrame.ScrollBarImageTransparency = 0.83
_trigon.ScrollingFrame.ScrollBarThickness = 6
_trigon.ScrollingFrame.Position = UDim2.new(0.0329341, 0, 0.210847, 0)
_trigon.ScrollingFrame.Parent = _trigon.Changelog

_trigon.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
_trigon.UIListLayout.Padding = UDim.new(0.01, 0)
_trigon.UIListLayout.Parent = _trigon.ScrollingFrame

_trigon.UIPadding_1.PaddingTop = UDim.new(0.005, 0)
_trigon.UIPadding_1.PaddingLeft = UDim.new(0.01, 0)
_trigon.UIPadding_1.Parent = _trigon.ScrollingFrame

_trigon.item_template.Active = true
_trigon.item_template.BorderSizePixel = 0
_trigon.item_template.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.item_template.Size = UDim2.new(0.956247, 0, 0.0593393, 0)
_trigon.item_template.LayoutOrder = 1
_trigon.item_template.BorderColor3 = Color3.fromRGB(47, 48, 53)
_trigon.item_template.BackgroundTransparency = 0.95
_trigon.item_template.Name = "item_template"
_trigon.item_template.Position = UDim2.new(-4.30065e-08, 0, 0.00816908, 0)
_trigon.item_template.ZIndex = 150
_trigon.item_template.Parent = _trigon.ScrollingFrame

_trigon.UICorner_2.CornerRadius = UDim.new(0.12, 0)
_trigon.UICorner_2.Parent = _trigon.item_template

_trigon.UIStroke.Color = Color3.fromRGB(211, 211, 211)
_trigon.UIStroke.Thickness = 1.2
_trigon.UIStroke.Transparency = 0.86
_trigon.UIStroke.Parent = _trigon.item_template

_trigon.Title_2.TextWrapped = true
_trigon.Title_2.Active = true
_trigon.Title_2.BorderSizePixel = 0
_trigon.Title_2.TextScaled = true
_trigon.Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.Title_2.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
_trigon.Title_2.Position = UDim2.new(0.5, 0, 0.5, 0)
_trigon.Title_2.Name = "Title"
_trigon.Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
_trigon.Title_2.TextSize = 16
_trigon.Title_2.Size = UDim2.new(0.959219, 0, 0.661736, 0)
_trigon.Title_2.ZIndex = 151
_trigon.Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
_trigon.Title_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
_trigon.Title_2.Text = "+ Infinite Yield"
_trigon.Title_2.BackgroundTransparency = 1
_trigon.Title_2.TextXAlignment = Enum.TextXAlignment.Left
_trigon.Title_2.Selectable = true
_trigon.Title_2.Parent = _trigon.item_template

_trigon.UIGradient.Offset = Vector2.new(0, -0.45)
_trigon.UIGradient.Transparency = NumberSequence.new{ NumberSequenceKeypoint.new(0, 0.65625), NumberSequenceKeypoint.new(1, 0) }
_trigon.UIGradient.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 35, 39)), ColorSequenceKeypoint.new(1, Color3.fromRGB(53, 54, 61)) }
_trigon.UIGradient.Rotation = -80
_trigon.UIGradient.Parent = _trigon.Changelog

_trigon.Title_3.TextWrapped = true
_trigon.Title_3.TextScaled = true
_trigon.Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_trigon.Title_3.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
_trigon.Title_3.Position = UDim2.new(0.5, 0, 0.358405, 0)
_trigon.Title_3.Name = "Title"
_trigon.Title_3.AnchorPoint = Vector2.new(0.5, 0.25)
_trigon.Title_3.TextSize = 14
_trigon.Title_3.Size = UDim2.new(0.482036, 0, 0.12145, 0)
_trigon.Title_3.TextColor3 = Color3.fromRGB(240, 240, 240)
_trigon.Title_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
_trigon.Title_3.Text = "Please redownload Trigon from official website, or contact us via Discord if you have any issues!!"
_trigon.Title_3.BackgroundTransparency = 1
_trigon.Title_3.Parent = _trigon.Canvas

_trigon.UITextSizeConstraint_3.MaxTextSize = 28
_trigon.UITextSizeConstraint_3.Parent = _trigon.Title_3




_trigon.copyLink.Activated:Connect(function()
	setclipboard("https://trigonevo.com/")
end)


_trigon.item_template.Visible = false
local function addChangelogItem(text)
	local newItem = _trigon.item_template:Clone()
	newItem.Name = "ChangelogItem"
	newItem.Title.Text = text
	newItem.Parent = _trigon.ScrollingFrame
	newItem.Visible = true
end

addChangelogItem("+ Stability update")
addChangelogItem("* Bug fix: crashing upon joining game...")
