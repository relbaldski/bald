function TrigonLoader()
    if gethui():FindFirstChild("TrigonLoader") then return end
    local TrigonLoader = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local KeySection = Instance.new("Frame")
    local ImageLabel = Instance.new("ImageLabel")
    local Buttons = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local zButton2 = Instance.new("ImageButton")
    local UICorner = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local Title = Instance.new("TextLabel")
    local zButton1 = Instance.new("ImageButton")
    local UICorner_2 = Instance.new("UICorner")
    local Title_2 = Instance.new("TextLabel")
    local UIGradient_2 = Instance.new("UIGradient")
    local aKeyContainer = Instance.new("Frame")
    local KeyBox = Instance.new("TextBox")
    local UICorner_3 = Instance.new("UICorner")
    local Frame = Instance.new("Frame")
    local SelectorFrame = Instance.new("Frame")
    local Buttons_2 = Instance.new("Frame")
    local OptionL = Instance.new("ImageButton")
    local UICorner_4 = Instance.new("UICorner")
    local ImageLabel_2 = Instance.new("ImageLabel")
    local TextLabel = Instance.new("TextLabel")
    local overlay = Instance.new("Frame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local OptionR = Instance.new("ImageButton")
    local ImageLabel_3 = Instance.new("ImageLabel")
    local TextLabel_2 = Instance.new("TextLabel")
    local UICorner_5 = Instance.new("UICorner")
    local OptionH = Instance.new("ImageButton")
    local UICorner_6 = Instance.new("UICorner")
    local ImageLabel_4 = Instance.new("ImageLabel")
    local TextLabel_3 = Instance.new("TextLabel")
    local overlay_2 = Instance.new("Frame")
    local Title_3 = Instance.new("TextLabel")
    local CloseBtn = Instance.new("ImageButton")
    local UICorner_7 = Instance.new("UICorner")
    local LoaderFrame = Instance.new("Frame")
    local ImageLabel_5 = Instance.new("ImageLabel")
    local list = Instance.new("Frame")
    local UIListLayout_3 = Instance.new("UIListLayout")
    local Frame_2 = Instance.new("Frame")
    local UICorner_8 = Instance.new("UICorner")
    local Bar = Instance.new("Frame")
    local UICorner_9 = Instance.new("UICorner")
    local Title_4 = Instance.new("TextLabel")

    --Properties:

    TrigonLoader.Name = "TrigonLoader"
    TrigonLoader.Parent = gethui()
    TrigonLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    TrigonLoader.DisplayOrder = 2

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = TrigonLoader
    MainFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.163982451, 0, 0.158854172, 0)
    MainFrame.Size = UDim2.new(0.671337187, 0, 0.680072486, 0)

    KeySection.Name = "KeySection"
    KeySection.Parent = MainFrame
    KeySection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    KeySection.BackgroundTransparency = 1.000
    KeySection.BorderColor3 = Color3.fromRGB(0, 0, 0)
    KeySection.BorderSizePixel = 0
    KeySection.Size = UDim2.new(1, 0, 1, 0)
    KeySection.Visible = false

    ImageLabel.Parent = KeySection
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Position = UDim2.new(3.32781127e-08, 0, 0.0618387796, 0)
    ImageLabel.Size = UDim2.new(0.99999994, 0, 0.23392272, 0)
    ImageLabel.Image = "rbxassetid://15844306310"
    ImageLabel.ScaleType = Enum.ScaleType.Fit

    Buttons.Name = "Buttons"
    Buttons.Parent = KeySection
    Buttons.AnchorPoint = Vector2.new(0.5, 0.5)
    Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Buttons.BackgroundTransparency = 1.000
    Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Buttons.BorderSizePixel = 0
    Buttons.Position = UDim2.new(0.499928266, 0, 0.782126546, 0)
    Buttons.Size = UDim2.new(0.856923223, 0, 0.435746968, 0)

    UIListLayout.Parent = Buttons
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.Padding = UDim.new(0.0700000003, 0)

    zButton2.Name = "zButton2"
    zButton2.Parent = Buttons
    zButton2.Active = false
    zButton2.AnchorPoint = Vector2.new(0.5, 0.5)
    zButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    zButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    zButton2.BorderSizePixel = 0
    zButton2.Position = UDim2.new(0.5, 0, 1.22562885, 0)
    zButton2.Selectable = false
    zButton2.Size = UDim2.new(0.599999964, 0, 0.248202071, 0)
    zButton2.ScaleType = Enum.ScaleType.Fit

    UICorner.CornerRadius = UDim.new(0.200000003, 0)
    UICorner.Parent = zButton2

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(57, 64, 85)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(80, 90, 120))}
    UIGradient.Rotation = -90
    UIGradient.Parent = zButton2

    Title.Name = "Title"
    Title.Parent = zButton2
    Title.AnchorPoint = Vector2.new(0.5, 0.5)
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.5, 0, 0.5, 0)
    Title.Size = UDim2.new(0.39337495, 0, 0.469879538, 0)
    Title.Font = Enum.Font.FredokaOne
    Title.Text = "COPY KEY LINK"
    Title.TextColor3 = Color3.fromRGB(113, 128, 170)
    Title.TextScaled = true
    Title.TextSize = 14.000
    Title.TextWrapped = true

    zButton1.Name = "zButton1"
    zButton1.Parent = Buttons
    zButton1.Active = false
    zButton1.AnchorPoint = Vector2.new(0.5, 0.5)
    zButton1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    zButton1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    zButton1.BorderSizePixel = 0
    zButton1.Position = UDim2.new(0.5, 0, 0.924008012, 0)
    zButton1.Selectable = false
    zButton1.Size = UDim2.new(0.599999964, 0, 0.24820213, 0)
    zButton1.ScaleType = Enum.ScaleType.Fit

    UICorner_2.CornerRadius = UDim.new(0.200000003, 0)
    UICorner_2.Parent = zButton1

    Title_2.Name = "Title"
    Title_2.Parent = zButton1
    Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_2.BackgroundTransparency = 1.000
    Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_2.BorderSizePixel = 0
    Title_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Title_2.Size = UDim2.new(0.39337492, 0, 0.469879538, 0)
    Title_2.Font = Enum.Font.FredokaOne
    Title_2.Text = "Verify"
    Title_2.TextColor3 = Color3.fromRGB(250, 250, 250)
    Title_2.TextScaled = true
    Title_2.TextSize = 14.000
    Title_2.TextWrapped = true

    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(80, 118, 218)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(104, 155, 247))}
    UIGradient_2.Rotation = -90
    UIGradient_2.Parent = zButton1

    aKeyContainer.Name = "aKeyContainer"
    aKeyContainer.Parent = Buttons
    aKeyContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    aKeyContainer.BackgroundColor3 = Color3.fromRGB(52, 57, 71)
    aKeyContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    aKeyContainer.BorderSizePixel = 0
    aKeyContainer.Position = UDim2.new(0.5, 0, 0.129985392, 0)
    aKeyContainer.Size = UDim2.new(0.85538435, 0, 0.259970784, 0)

    KeyBox.Name = "KeyBox"
    KeyBox.Parent = aKeyContainer
    KeyBox.BackgroundColor3 = Color3.fromRGB(49, 53, 66)
    KeyBox.BackgroundTransparency = 1.000
    KeyBox.BorderColor3 = Color3.fromRGB(49, 53, 66)
    KeyBox.BorderSizePixel = 0
    KeyBox.ClipsDescendants = true
    KeyBox.Position = UDim2.new(0.076153852, 0, 0.257900089, 0)
    KeyBox.Size = UDim2.new(0.856692493, 0, 0.515945673, 0)
    KeyBox.ClearTextOnFocus = false
    KeyBox.Font = Enum.Font.SpecialElite
    KeyBox.Text = "ygtMMDhgF0l0DAROIsBQwctpoinGnwJp"
    KeyBox.TextColor3 = Color3.fromRGB(203, 203, 203)
    KeyBox.TextScaled = true
    KeyBox.TextSize = 14.000
    KeyBox.TextWrapped = true

    UICorner_3.CornerRadius = UDim.new(0.150000006, 0)
    UICorner_3.Parent = aKeyContainer

    Frame.Parent = KeySection
    Frame.BackgroundColor3 = Color3.fromRGB(62, 68, 86)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.0556133501, 0, 0.530350983, 0)
    Frame.Size = UDim2.new(0.888722599, 0, 0.00191462436, 0)

    SelectorFrame.Name = "SelectorFrame"
    SelectorFrame.Parent = MainFrame
    SelectorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SelectorFrame.BackgroundTransparency = 1.000
    SelectorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SelectorFrame.BorderSizePixel = 0
    SelectorFrame.Size = UDim2.new(1, 0, 1, 0)
    SelectorFrame.Visible = false

    Buttons_2.Name = "Buttons"
    Buttons_2.Parent = SelectorFrame
    Buttons_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Buttons_2.BackgroundTransparency = 1.000
    Buttons_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Buttons_2.BorderSizePixel = 0
    Buttons_2.Position = UDim2.new(-0.0010904239, 0, 0.281449795, 0)
    Buttons_2.Size = UDim2.new(0.999999821, 0, 0.610765159, 0)
    Buttons_2.ZIndex = 4

    OptionL.Name = "OptionL"
    OptionL.Parent = Buttons_2
    OptionL.Active = false
    OptionL.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    OptionL.BorderColor3 = Color3.fromRGB(0, 0, 0)
    OptionL.BorderSizePixel = 5
    OptionL.Position = UDim2.new(0.043804653, 0, 0.112852663, 0)
    OptionL.Size = UDim2.new(0.269342959, 0, 0.774294674, 0)
    OptionL.AutoButtonColor = false
    OptionL.ScaleType = Enum.ScaleType.Fit

    UICorner_4.CornerRadius = UDim.new(0.0799999982, 0)
    UICorner_4.Parent = OptionL

    ImageLabel_2.Parent = OptionL
    ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_2.BackgroundTransparency = 1.000
    ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_2.BorderSizePixel = 0
    ImageLabel_2.Position = UDim2.new(0.185460895, 0, -0.018192431, 0)
    ImageLabel_2.Size = UDim2.new(0.696799278, 0, 0.66623646, 0)
    ImageLabel_2.Image = "rbxassetid://15865854441"
    ImageLabel_2.ScaleType = Enum.ScaleType.Fit

    TextLabel.Parent = OptionL
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.182497606, 0, 0.680463791, 0)
    TextLabel.Size = UDim2.new(0.686339021, 0, 0.253387213, 0)
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.Text = "Low End"
    TextLabel.TextColor3 = Color3.fromRGB(207, 204, 204)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true

    overlay.Name = "overlay"
    overlay.Parent = OptionL
    overlay.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    overlay.BackgroundTransparency = 0.200
    overlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BorderSizePixel = 0
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.ZIndex = 99

    UIListLayout_2.Parent = Buttons_2
    UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout_2.Padding = UDim.new(0.0500000007, 0)

    OptionR.Name = "OptionR"
    OptionR.Parent = Buttons_2
    OptionR.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    OptionR.BorderColor3 = Color3.fromRGB(0, 0, 0)
    OptionR.BorderSizePixel = 5
    OptionR.Position = UDim2.new(0.043804653, 0, 0.112852663, 0)
    OptionR.Size = UDim2.new(0.269342959, 0, 0.774294674, 0)
    OptionR.AutoButtonColor = false
    OptionR.ScaleType = Enum.ScaleType.Fit

    ImageLabel_3.Parent = OptionR
    ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_3.BackgroundTransparency = 1.000
    ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_3.BorderSizePixel = 0
    ImageLabel_3.Position = UDim2.new(0.158357829, 0, 0.0656846985, 0)
    ImageLabel_3.Size = UDim2.new(0.726200044, 0, 0.664153278, 0)
    ImageLabel_3.Image = "rbxassetid://15865857319"
    ImageLabel_3.ScaleType = Enum.ScaleType.Fit

    TextLabel_2.Parent = OptionR
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.Position = UDim2.new(0.182497606, 0, 0.680463791, 0)
    TextLabel_2.Size = UDim2.new(0.658551991, 0, 0.243128613, 0)
    TextLabel_2.Font = Enum.Font.FredokaOne
    TextLabel_2.Text = "Normal"
    TextLabel_2.TextColor3 = Color3.fromRGB(207, 204, 204)
    TextLabel_2.TextScaled = true
    TextLabel_2.TextSize = 14.000
    TextLabel_2.TextWrapped = true

    UICorner_5.CornerRadius = UDim.new(0.100000001, 0)
    UICorner_5.Parent = OptionR

    OptionH.Name = "OptionH"
    OptionH.Parent = Buttons_2
    OptionH.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    OptionH.BorderColor3 = Color3.fromRGB(0, 0, 0)
    OptionH.BorderSizePixel = 5
    OptionH.Position = UDim2.new(0.043804653, 0, 0.112852663, 0)
    OptionH.Size = UDim2.new(0.269342959, 0, 0.774294674, 0)
    OptionH.AutoButtonColor = false
    OptionH.ScaleType = Enum.ScaleType.Fit

    UICorner_6.CornerRadius = UDim.new(0.100000001, 0)
    UICorner_6.Parent = OptionH

    ImageLabel_4.Parent = OptionH
    ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_4.BackgroundTransparency = 1.000
    ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_4.BorderSizePixel = 0
    ImageLabel_4.Position = UDim2.new(0.143942162, 0, 0.0473592058, 0)
    ImageLabel_4.Size = UDim2.new(0.726200044, 0, 0.633104622, 0)
    ImageLabel_4.Image = "rbxassetid://15865858307"
    ImageLabel_4.ScaleType = Enum.ScaleType.Fit

    TextLabel_3.Parent = OptionH
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 1.000
    TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_3.BorderSizePixel = 0
    TextLabel_3.Position = UDim2.new(0.182497606, 0, 0.680463791, 0)
    TextLabel_3.Size = UDim2.new(0.631889999, 0, 0.233285353, 0)
    TextLabel_3.Font = Enum.Font.FredokaOne
    TextLabel_3.Text = "Emulator"
    TextLabel_3.TextColor3 = Color3.fromRGB(207, 204, 204)
    TextLabel_3.TextScaled = true
    TextLabel_3.TextSize = 14.000
    TextLabel_3.TextWrapped = true

    overlay_2.Name = "overlay"
    overlay_2.Parent = OptionH
    overlay_2.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    overlay_2.BackgroundTransparency = 0.200
    overlay_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    overlay_2.BorderSizePixel = 0
    overlay_2.Size = UDim2.new(1, 0, 1, 0)
    overlay_2.ZIndex = 99

    Title_3.Name = "Title"
    Title_3.Parent = SelectorFrame
    Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_3.BackgroundTransparency = 1.000
    Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_3.BorderSizePixel = 0
    Title_3.Position = UDim2.new(0.00218094769, 0, 0.11679209, 0)
    Title_3.Size = UDim2.new(0.998909473, 0, 0.139767587, 0)
    Title_3.Font = Enum.Font.FredokaOne
    Title_3.Text = "Select an option"
    Title_3.TextColor3 = Color3.fromRGB(180, 193, 216)
    Title_3.TextScaled = true
    Title_3.TextSize = 14.000
    Title_3.TextWrapped = true

    CloseBtn.Name = "CloseBtn"
    CloseBtn.Parent = SelectorFrame
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.BackgroundTransparency = 1.000
    CloseBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Position = UDim2.new(0.92143631, 0, 0.017231619, 0)
    CloseBtn.Size = UDim2.new(0.0711809099, 0, 0.124450587, 0)
    CloseBtn.Image = "rbxassetid://15866029769"
    CloseBtn.ImageColor3 = Color3.fromRGB(165, 182, 230)
    CloseBtn.ImageTransparency = 0.510
    CloseBtn.ScaleType = Enum.ScaleType.Fit

    UICorner_7.CornerRadius = UDim.new(0.0299999993, 0)
    UICorner_7.Parent = SelectorFrame

    LoaderFrame.Name = "LoaderFrame"
    LoaderFrame.Parent = MainFrame
    LoaderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LoaderFrame.BackgroundTransparency = 1.000
    LoaderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LoaderFrame.BorderSizePixel = 0
    LoaderFrame.Size = UDim2.new(1, 0, 1, 0)

    ImageLabel_5.Parent = LoaderFrame
    ImageLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_5.BackgroundTransparency = 1.000
    ImageLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel_5.BorderSizePixel = 0
    ImageLabel_5.Position = UDim2.new(9.98343381e-08, 0, 0.0905581489, 0)
    ImageLabel_5.Size = UDim2.new(0.999999821, 0, 0.38709268, 0)
    ImageLabel_5.Image = "rbxassetid://15844306310"
    ImageLabel_5.ScaleType = Enum.ScaleType.Fit

    list.Name = "list"
    list.Parent = LoaderFrame
    list.AnchorPoint = Vector2.new(0.5, 0.5)
    list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    list.BackgroundTransparency = 1.000
    list.BorderColor3 = Color3.fromRGB(0, 0, 0)
    list.BorderSizePixel = 0
    list.Position = UDim2.new(0.499928266, 0, 0.782126546, 0)
    list.Size = UDim2.new(0.856923223, 0, 0.435746968, 0)

    UIListLayout_3.Parent = list
    UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_3.Padding = UDim.new(0.0700000003, 0)

    Frame_2.Parent = list
    Frame_2.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame_2.BorderSizePixel = 0
    Frame_2.Position = UDim2.new(0.035182815, 0, 0, 0)
    Frame_2.Size = UDim2.new(0.929634392, 0, 0.188937292, 0)

    UICorner_8.CornerRadius = UDim.new(0.200000003, 0)
    UICorner_8.Parent = Frame_2

    Bar.Name = "Bar"
    Bar.Parent = Frame_2
    Bar.BackgroundColor3 = Color3.fromRGB(74, 82, 103)
    Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Bar.BorderSizePixel = 0
    Bar.Position = UDim2.new(0.00723916572, 0, 0.0930242613, 0)
    Bar.Size = UDim2.new(0.985533774, 0, 0.793589056, 0)

    UICorner_9.CornerRadius = UDim.new(0.200000003, 0)
    UICorner_9.Parent = Bar

    Title_4.Name = "Title"
    Title_4.Parent = list
    Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_4.BackgroundTransparency = 1.000
    Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_4.BorderSizePixel = 0
    Title_4.Position = UDim2.new(0.000545284827, 0, 0.258937299, 0)
    Title_4.Size = UDim2.new(0.998909414, 0, 0.149593651, 0)
    Title_4.Font = Enum.Font.FredokaOne
    Title_4.Text = "Status: "
    Title_4.TextColor3 = Color3.fromRGB(180, 193, 216)
    Title_4.TextScaled = true
    Title_4.TextSize = 14.000
    Title_4.TextWrapped = true

    -- Scripts:

    local function LMNXDEN_fake_script() -- OptionR.LocalScript 
        local script = Instance.new('LocalScript', OptionR)

        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local Loader = Player:WaitForChild("PlayerGui"):WaitForChild("TrigonLoader")
        local MainUI = Player:WaitForChild("PlayerGui"):WaitForChild("TrigonMain")

        repeat
            task.wait() 
        until Loader and MainUI

        script.Parent.Activated:Connect(function()
            Loader.Enabled = false
            MainUI.Enabled = true
            print(MainUI.Enabled)
        end)

    end
    coroutine.wrap(LMNXDEN_fake_script)()
    local function YIQGXG_fake_script() -- Frame_2.LocalScript 
        local script = Instance.new('LocalScript', Frame_2)

        local TweenService = game:GetService("TweenService")
        local CurrentValue = 1
        local bar = script.Parent.Bar
        local MaxValue = 100
        local Status = script.Parent.Parent.Title

        local function ProgressBar(value, statusText, duration)
            CurrentValue = CurrentValue + value
            if CurrentValue > MaxValue then
                CurrentValue = MaxValue
            elseif CurrentValue < 0 then
                CurrentValue = 0
            end

            local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
            local tween = TweenService:Create(bar, tweenInfo, {Size = UDim2.new(CurrentValue / MaxValue, 0, 0.8, 0)})
            tween:Play()

            Status.Text = "Status: " .. (statusText or "")
        end

        bar.Size = UDim2.new(0, 0, 0.8, 0)

        ProgressBar(0, "Waiting for LocalPlayer...", 0.5)
        repeat task.wait() until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character
        local playerName = game.Players.LocalPlayer.Name
        ProgressBar(20, playerName .. " is loaded!", 1)
        wait(1)
        ProgressBar(10, "Verifying player...", 1)
        wait(1)
        ProgressBar(20, "Loading libraries...", 1)
        wait(1)
        ProgressBar(20, "Finalizing everything...", 1)
        local PlayerGui = game.Players.LocalPlayer.PlayerGui
        local MainUi = PlayerGui:WaitForChild("TrigonMain")
        local TopBar = PlayerGui:WaitForChild("TrigonTopBar")
        wait(1)
        ProgressBar(30, "Setup Complete!", 1)
        wait(0.5)

        script.Parent.Parent.Parent.Parent.Parent.Enabled = false
        MainUi.Enabled = not MainUi.Enabled
        TopBar.Enabled = not TopBar.Enabled

    end
    coroutine.wrap(YIQGXG_fake_script)()
end

function TrigonMain()
    if gethui():FindFirstChild("TrigonMain") then return end
    local TrigonMain = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local BottomMenuFrame = Instance.new("Frame")
    local LeftFrame = Instance.new("Frame")
    local ExitBtn = Instance.new("ImageButton")
    local Icon = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")
    local RightFrame = Instance.new("Frame")
    local Button = Instance.new("ImageButton")
    local UIGradient = Instance.new("UIGradient")
    local Icon_2 = Instance.new("ImageLabel")
    local MenuList = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local UIGridLayout = Instance.new("UIGridLayout")
    local ExecBtn = Instance.new("ImageButton")
    local Icon_3 = Instance.new("ImageLabel")
    local UICorner_3 = Instance.new("UICorner")
    local UIGradient_2 = Instance.new("UIGradient")
    local CloudBtn = Instance.new("ImageButton")
    local UIGradient_3 = Instance.new("UIGradient")
    local Icon_4 = Instance.new("ImageLabel")
    local UICorner_4 = Instance.new("UICorner")
    local LSBtn = Instance.new("ImageButton")
    local UIGradient_4 = Instance.new("UIGradient")
    local Icon_5 = Instance.new("ImageLabel")
    local UICorner_5 = Instance.new("UICorner")
    local SettingsBtn = Instance.new("ImageButton")
    local UIGradient_5 = Instance.new("UIGradient")
    local Icon_6 = Instance.new("ImageLabel")
    local UICorner_6 = Instance.new("UICorner")
    local UICorner_7 = Instance.new("UICorner")
    local ExecFrame = Instance.new("Frame")
    local Buttons = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Button1 = Instance.new("ImageButton")
    local Title = Instance.new("TextLabel")
    local UICorner_8 = Instance.new("UICorner")
    local Button4 = Instance.new("ImageButton")
    local Title_2 = Instance.new("TextLabel")
    local UICorner_9 = Instance.new("UICorner")
    local Button3 = Instance.new("ImageButton")
    local Title_3 = Instance.new("TextLabel")
    local UICorner_10 = Instance.new("UICorner")
    local Button2 = Instance.new("ImageButton")
    local Title_4 = Instance.new("TextLabel")
    local UICorner_11 = Instance.new("UICorner")
    local UICorner_12 = Instance.new("UICorner")
    local ScrollingFrame = Instance.new("ScrollingFrame")
    local ScriptBox = Instance.new("TextBox")
    local UICorner_13 = Instance.new("UICorner")
    local CloudFrame = Instance.new("Frame")
    local UICorner_14 = Instance.new("UICorner")
    local TextLabel = Instance.new("TextLabel")
    local LocalScriptFrame = Instance.new("Frame")
    local UICorner_15 = Instance.new("UICorner")
    local TextLabel_2 = Instance.new("TextLabel")
    local SettingsFrame = Instance.new("Frame")
    local UICorner_16 = Instance.new("UICorner")
    local TextLabel_3 = Instance.new("TextLabel")

    --Properties:

    TrigonMain.Name = "TrigonMain"
    TrigonMain.Enabled = false  
    TrigonMain.Parent = gethui()
    TrigonMain.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = TrigonMain
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BackgroundTransparency = 0.350
    MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.Size = UDim2.new(1.00049734, 0, 1, 0)

    BottomMenuFrame.Name = "BottomMenuFrame"
    BottomMenuFrame.Parent = MainFrame
    BottomMenuFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    BottomMenuFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BottomMenuFrame.BorderSizePixel = 0
    BottomMenuFrame.ClipsDescendants = true
    BottomMenuFrame.Position = UDim2.new(0.0244645439, 0, 0.755852818, 0)
    BottomMenuFrame.Size = UDim2.new(0.950071335, 0, 0.195094764, 0)

    LeftFrame.Name = "LeftFrame"
    LeftFrame.Parent = BottomMenuFrame
    LeftFrame.BackgroundColor3 = Color3.fromRGB(47, 52, 66)
    LeftFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LeftFrame.BorderSizePixel = 0
    LeftFrame.Position = UDim2.new(-0.000541320129, 0, 0, 0)
    LeftFrame.Size = UDim2.new(0.162271246, 0, 1, 0)

    ExitBtn.Name = "ExitBtn"
    ExitBtn.Parent = LeftFrame
    ExitBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    ExitBtn.BackgroundColor3 = Color3.fromRGB(47, 52, 66)
    ExitBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ExitBtn.BorderSizePixel = 0
    ExitBtn.Position = UDim2.new(0.508862793, 0, 0.500000477, 0)
    ExitBtn.Selectable = false
    ExitBtn.Size = UDim2.new(0.891644657, 0, 0.893437624, 0)
    ExitBtn.ZIndex = 2
    ExitBtn.AutoButtonColor = false
    ExitBtn.ScaleType = Enum.ScaleType.Fit

    Icon.Name = "Icon"
    Icon.Parent = ExitBtn
    Icon.AnchorPoint = Vector2.new(0.5, 0.5)
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.BackgroundTransparency = 1.000
    Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Icon.BorderSizePixel = 0
    Icon.Position = UDim2.new(0.494743079, 0, 0.490654498, 0)
    Icon.Size = UDim2.new(0.834217608, 0, 1.20501292, 0)
    Icon.SizeConstraint = Enum.SizeConstraint.RelativeXX
    Icon.Image = "rbxassetid://15879382339"
    Icon.ImageColor3 = Color3.fromRGB(201, 205, 210)
    Icon.ScaleType = Enum.ScaleType.Fit

    UICorner.CornerRadius = UDim.new(0.0799999982, 0)
    UICorner.Parent = LeftFrame

    RightFrame.Name = "RightFrame"
    RightFrame.Parent = BottomMenuFrame
    RightFrame.BackgroundColor3 = Color3.fromRGB(47, 52, 65)
    RightFrame.BackgroundTransparency = 1.000
    RightFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    RightFrame.BorderSizePixel = 0
    RightFrame.Position = UDim2.new(0.887643456, 0, 0, 0)
    RightFrame.Size = UDim2.new(0.11186187, 0, 1, 0)

    Button.Name = "Button"
    Button.Parent = RightFrame
    Button.Active = false
    Button.AnchorPoint = Vector2.new(0.5, 0.5)
    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundTransparency = 1.000
    Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Button.BorderSizePixel = 0
    Button.Position = UDim2.new(0.490287572, 0, 0.5, 0)
    Button.Selectable = false
    Button.Size = UDim2.new(0.834246397, 0, 0.800000012, 0)
    Button.AutoButtonColor = false
    Button.ScaleType = Enum.ScaleType.Fit

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(75, 82, 107))}
    UIGradient.Rotation = -90
    UIGradient.Parent = Button

    Icon_2.Name = "Icon"
    Icon_2.Parent = Button
    Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon_2.BackgroundTransparency = 1.000
    Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Icon_2.BorderSizePixel = 0
    Icon_2.Position = UDim2.new(0.370799065, 0, 0.475195169, 0)
    Icon_2.Size = UDim2.new(0.896822095, 0, 0.783258617, 0)
    Icon_2.SizeConstraint = Enum.SizeConstraint.RelativeYY
    Icon_2.Image = "rbxassetid://15844306310"
    Icon_2.ScaleType = Enum.ScaleType.Fit

    MenuList.Name = "MenuList"
    MenuList.Parent = BottomMenuFrame
    MenuList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MenuList.BackgroundTransparency = 1.000
    MenuList.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MenuList.BorderSizePixel = 0
    MenuList.Position = UDim2.new(0.116366319, 0, 0, 0)
    MenuList.Size = UDim2.new(0.777777791, 0, 1, 0)

    UICorner_2.CornerRadius = UDim.new(0.150000006, 0)
    UICorner_2.Parent = MenuList

    UIGridLayout.Parent = MenuList
    UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIGridLayout.CellPadding = UDim2.new(0.0199999996, 0, 1, 0)
    UIGridLayout.CellSize = UDim2.new(0.119999997, 0, 0.800000012, 0)

    ExecBtn.Name = "ExecBtn"
    ExecBtn.Parent = MenuList
    ExecBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    ExecBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ExecBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ExecBtn.BorderSizePixel = 3
    ExecBtn.Position = UDim2.new(0.406853259, 0, 0.500000179, 0)
    ExecBtn.Size = UDim2.new(0.119999997, 0, 0.800000012, 0)
    ExecBtn.ScaleType = Enum.ScaleType.Fit

    Icon_3.Name = "Icon"
    Icon_3.Parent = ExecBtn
    Icon_3.AnchorPoint = Vector2.new(0.5, 0.5)
    Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon_3.BackgroundTransparency = 1.000
    Icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Icon_3.BorderSizePixel = 0
    Icon_3.Position = UDim2.new(0.5, 0, 0.5, 0)
    Icon_3.Size = UDim2.new(0.72274524, 0, 0.746919215, 0)
    Icon_3.SizeConstraint = Enum.SizeConstraint.RelativeXX
    Icon_3.Image = "rbxassetid://15845222401"
    Icon_3.ImageColor3 = Color3.fromRGB(201, 205, 210)
    Icon_3.ScaleType = Enum.ScaleType.Fit

    UICorner_3.CornerRadius = UDim.new(0.140000001, 0)
    UICorner_3.Parent = ExecBtn

    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(75, 82, 107))}
    UIGradient_2.Rotation = -90
    UIGradient_2.Parent = ExecBtn

    CloudBtn.Name = "CloudBtn"
    CloudBtn.Parent = MenuList
    CloudBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    CloudBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloudBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloudBtn.BorderSizePixel = 3
    CloudBtn.Position = UDim2.new(0.406853259, 0, 0.500000179, 0)
    CloudBtn.Selectable = false
    CloudBtn.Size = UDim2.new(0.119999997, 0, 0.800000012, 0)
    CloudBtn.ScaleType = Enum.ScaleType.Fit

    UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(75, 82, 107))}
    UIGradient_3.Rotation = -90
    UIGradient_3.Parent = CloudBtn

    Icon_4.Name = "Icon"
    Icon_4.Parent = CloudBtn
    Icon_4.AnchorPoint = Vector2.new(0.5, 0.5)
    Icon_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon_4.BackgroundTransparency = 1.000
    Icon_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Icon_4.BorderSizePixel = 0
    Icon_4.Position = UDim2.new(0.5, 0, 0.5, 0)
    Icon_4.Size = UDim2.new(0.72274524, 0, 0.769572437, 0)
    Icon_4.SizeConstraint = Enum.SizeConstraint.RelativeXX
    Icon_4.Image = "rbxassetid://15845228987"
    Icon_4.ImageColor3 = Color3.fromRGB(201, 205, 210)
    Icon_4.ScaleType = Enum.ScaleType.Fit

    UICorner_4.CornerRadius = UDim.new(0.140000001, 0)
    UICorner_4.Parent = CloudBtn

    LSBtn.Name = "LSBtn"
    LSBtn.Parent = MenuList
    LSBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    LSBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LSBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LSBtn.BorderSizePixel = 3
    LSBtn.Position = UDim2.new(0.406853259, 0, 0.500000179, 0)
    LSBtn.Selectable = false
    LSBtn.Size = UDim2.new(0.119999997, 0, 0.800000012, 0)
    LSBtn.ScaleType = Enum.ScaleType.Fit

    UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(75, 82, 107))}
    UIGradient_4.Rotation = -90
    UIGradient_4.Parent = LSBtn

    Icon_5.Name = "Icon"
    Icon_5.Parent = LSBtn
    Icon_5.AnchorPoint = Vector2.new(0.5, 0.5)
    Icon_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon_5.BackgroundTransparency = 1.000
    Icon_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Icon_5.BorderSizePixel = 0
    Icon_5.Position = UDim2.new(0.5, 0, 0.5, 0)
    Icon_5.Size = UDim2.new(0.72274524, 0, 0.801656306, 0)
    Icon_5.SizeConstraint = Enum.SizeConstraint.RelativeXX
    Icon_5.Image = "rbxassetid://15845249767"
    Icon_5.ImageColor3 = Color3.fromRGB(201, 205, 210)
    Icon_5.ScaleType = Enum.ScaleType.Fit

    UICorner_5.CornerRadius = UDim.new(0.140000001, 0)
    UICorner_5.Parent = LSBtn

    SettingsBtn.Name = "SettingsBtn"
    SettingsBtn.Parent = MenuList
    SettingsBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    SettingsBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SettingsBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SettingsBtn.BorderSizePixel = 3
    SettingsBtn.Position = UDim2.new(0.406853259, 0, 0.500000179, 0)
    SettingsBtn.Selectable = false
    SettingsBtn.Size = UDim2.new(0.119999997, 0, 0.800000012, 0)
    SettingsBtn.ScaleType = Enum.ScaleType.Fit

    UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(75, 82, 107))}
    UIGradient_5.Rotation = -90
    UIGradient_5.Parent = SettingsBtn

    Icon_6.Name = "Icon"
    Icon_6.Parent = SettingsBtn
    Icon_6.AnchorPoint = Vector2.new(0.5, 0.5)
    Icon_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon_6.BackgroundTransparency = 1.000
    Icon_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Icon_6.BorderSizePixel = 0
    Icon_6.Position = UDim2.new(0.5, 0, 0.5, 0)
    Icon_6.Size = UDim2.new(0.72274524, 0, 0.835077763, 0)
    Icon_6.SizeConstraint = Enum.SizeConstraint.RelativeXX
    Icon_6.Image = "rbxassetid://15845262087"
    Icon_6.ImageColor3 = Color3.fromRGB(201, 205, 210)
    Icon_6.ScaleType = Enum.ScaleType.Fit

    UICorner_6.CornerRadius = UDim.new(0.140000001, 0)
    UICorner_6.Parent = SettingsBtn

    UICorner_7.CornerRadius = UDim.new(0.0799999982, 0)
    UICorner_7.Parent = BottomMenuFrame

    ExecFrame.Name = "ExecFrame"
    ExecFrame.Parent = MainFrame
    ExecFrame.Active = true
    ExecFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    ExecFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ExecFrame.BorderSizePixel = 0
    ExecFrame.Position = UDim2.new(0.0244644508, 0, 0.1444446, 0)
    ExecFrame.Size = UDim2.new(0.949745357, 0, 0.594444156, 0)

    Buttons.Name = "Buttons"
    Buttons.Parent = ExecFrame
    Buttons.Active = true
    Buttons.BackgroundColor3 = Color3.fromRGB(31, 34, 43)
    Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Buttons.BorderSizePixel = 0
    Buttons.Position = UDim2.new(0, 0, 0.700394928, 0)
    Buttons.Size = UDim2.new(0.999999881, 0, 0.298580825, 0)

    UIListLayout.Parent = Buttons
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.Padding = UDim.new(0.00999999978, 0)

    Button1.Name = "Button1"
    Button1.Parent = Buttons
    Button1.AnchorPoint = Vector2.new(0.5, 0.5)
    Button1.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    Button1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Button1.BorderSizePixel = 3
    Button1.Position = UDim2.new(0.174999967, 0, 0.314999998, 0)
    Button1.Selectable = false
    Button1.Size = UDim2.new(0.226347432, 0, 0.629999995, 0)
    Button1.AutoButtonColor = false
    Button1.ScaleType = Enum.ScaleType.Fit

    Title.Name = "Title"
    Title.Parent = Button1
    Title.AnchorPoint = Vector2.new(0.5, 0.5)
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.497776806, 0, 0.499999881, 0)
    Title.Size = UDim2.new(0.418754429, 0, 0.378112197, 0)
    Title.Font = Enum.Font.FredokaOne
    Title.Text = "Execute"
    Title.TextColor3 = Color3.fromRGB(250, 250, 250)
    Title.TextScaled = true
    Title.TextSize = 100.000
    Title.TextWrapped = true

    UICorner_8.CornerRadius = UDim.new(0.0799999982, 0)
    UICorner_8.Parent = Button1

    Button4.Name = "Button4"
    Button4.Parent = Buttons
    Button4.AnchorPoint = Vector2.new(0.5, 0.5)
    Button4.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    Button4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Button4.BorderSizePixel = 3
    Button4.Position = UDim2.new(0.174999967, 0, 0.314999998, 0)
    Button4.Selectable = false
    Button4.Size = UDim2.new(0.226347432, 0, 0.629999995, 0)
    Button4.AutoButtonColor = false
    Button4.ScaleType = Enum.ScaleType.Fit

    Title_2.Name = "Title"
    Title_2.Parent = Button4
    Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_2.BackgroundTransparency = 1.000
    Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_2.BorderSizePixel = 0
    Title_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Title_2.Size = UDim2.new(0.377471834, 0, 0.406514436, 0)
    Title_2.Font = Enum.Font.FredokaOne
    Title_2.Text = "Clear"
    Title_2.TextColor3 = Color3.fromRGB(250, 250, 250)
    Title_2.TextScaled = true
    Title_2.TextSize = 14.000
    Title_2.TextWrapped = true

    UICorner_9.CornerRadius = UDim.new(0.0799999982, 0)
    UICorner_9.Parent = Button4

    Button3.Name = "Button3"
    Button3.Parent = Buttons
    Button3.AnchorPoint = Vector2.new(0.5, 0.5)
    Button3.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    Button3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Button3.BorderSizePixel = 3
    Button3.Position = UDim2.new(0.174999967, 0, 0.314999998, 0)
    Button3.Selectable = false
    Button3.Size = UDim2.new(0.226347432, 0, 0.629999995, 0)
    Button3.AutoButtonColor = false
    Button3.ScaleType = Enum.ScaleType.Fit

    Title_3.Name = "Title"
    Title_3.Parent = Button3
    Title_3.AnchorPoint = Vector2.new(0.5, 0.5)
    Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_3.BackgroundTransparency = 1.000
    Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_3.BorderSizePixel = 0
    Title_3.Position = UDim2.new(0.492158651, 0, 0.49999994, 0)
    Title_3.Size = UDim2.new(0.874164224, 0, 0.406514436, 0)
    Title_3.Font = Enum.Font.FredokaOne
    Title_3.Text = "Paste from Clipboard"
    Title_3.TextColor3 = Color3.fromRGB(250, 250, 250)
    Title_3.TextScaled = true
    Title_3.TextSize = 14.000
    Title_3.TextWrapped = true

    UICorner_10.CornerRadius = UDim.new(0.0799999982, 0)
    UICorner_10.Parent = Button3

    Button2.Name = "Button2"
    Button2.Parent = Buttons
    Button2.AnchorPoint = Vector2.new(0.5, 0.5)
    Button2.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    Button2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Button2.BorderSizePixel = 3
    Button2.Position = UDim2.new(0.174999967, 0, 0.314999998, 0)
    Button2.Selectable = false
    Button2.Size = UDim2.new(0.226347432, 0, 0.629999995, 0)
    Button2.AutoButtonColor = false
    Button2.ScaleType = Enum.ScaleType.Fit

    Title_4.Name = "Title"
    Title_4.Parent = Button2
    Title_4.AnchorPoint = Vector2.new(0.5, 0.5)
    Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_4.BackgroundTransparency = 1.000
    Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_4.BorderSizePixel = 0
    Title_4.Position = UDim2.new(0.502743363, 0, 0.49999994, 0)
    Title_4.Size = UDim2.new(0.879184842, 0, 0.406514347, 0)
    Title_4.Font = Enum.Font.FredokaOne
    Title_4.Text = "Execute from Clipboard"
    Title_4.TextColor3 = Color3.fromRGB(250, 250, 250)
    Title_4.TextScaled = true
    Title_4.TextSize = 14.000
    Title_4.TextWrapped = true

    UICorner_11.CornerRadius = UDim.new(0.0799999982, 0)
    UICorner_11.Parent = Button2

    UICorner_12.CornerRadius = UDim.new(0.100000001, 0)
    UICorner_12.Parent = Buttons

    ScrollingFrame.Parent = ExecFrame
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame.BackgroundTransparency = 1.000
    ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.Position = UDim2.new(0.0167858321, 0, 0.0257617198, 0)
    ScrollingFrame.Size = UDim2.new(0.975214124, 0, 0.675238311, 0)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
    ScrollingFrame.ScrollBarThickness = 18

    ScriptBox.Name = "ScriptBox"
    ScriptBox.Parent = ScrollingFrame
    ScriptBox.BackgroundColor3 = Color3.fromRGB(75, 0, 0)
    ScriptBox.BackgroundTransparency = 1.000
    ScriptBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScriptBox.BorderSizePixel = 0
    ScriptBox.ClipsDescendants = true
    ScriptBox.Size = UDim2.new(1, 0, 1, 0)
    ScriptBox.ClearTextOnFocus = false
    ScriptBox.Font = Enum.Font.Nunito
    ScriptBox.MultiLine = true
    ScriptBox.Text = "--- Welcome to Trigon Mobile v0.1 {Beta}\n--- We Recommend Only uisng Loadstrings (Roblox editor doesnt support long scripts)\n"
    ScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    ScriptBox.TextSize = 30.000
    ScriptBox.TextWrapped = true
    ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
    ScriptBox.TextYAlignment = Enum.TextYAlignment.Top

    UICorner_13.CornerRadius = UDim.new(0.0199999996, 0)
    UICorner_13.Parent = ExecFrame

    CloudFrame.Name = "CloudFrame"
    CloudFrame.Parent = MainFrame
    CloudFrame.Active = true
    CloudFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    CloudFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloudFrame.BorderSizePixel = 0
    CloudFrame.Position = UDim2.new(0.0244644508, 0, 0.1444446, 0)
    CloudFrame.Size = UDim2.new(0.949745357, 0, 0.594444156, 0)
    CloudFrame.Visible = false

    UICorner_14.CornerRadius = UDim.new(0.0199999996, 0)
    UICorner_14.Parent = CloudFrame

    TextLabel.Parent = CloudFrame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.290447444, 0, 0.444655627, 0)
    TextLabel.Size = UDim2.new(0.419877589, 0, 0.109521084, 0)
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.Text = "Under Development"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true

    LocalScriptFrame.Name = "LocalScriptFrame"
    LocalScriptFrame.Parent = MainFrame
    LocalScriptFrame.Active = true
    LocalScriptFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    LocalScriptFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LocalScriptFrame.BorderSizePixel = 0
    LocalScriptFrame.Position = UDim2.new(0.0244644508, 0, 0.1444446, 0)
    LocalScriptFrame.Size = UDim2.new(0.949745357, 0, 0.594444156, 0)
    LocalScriptFrame.Visible = false

    UICorner_15.CornerRadius = UDim.new(0.0199999996, 0)
    UICorner_15.Parent = LocalScriptFrame

    TextLabel_2.Parent = LocalScriptFrame
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.Position = UDim2.new(0.290447444, 0, 0.444655627, 0)
    TextLabel_2.Size = UDim2.new(0.419877589, 0, 0.109521084, 0)
    TextLabel_2.Font = Enum.Font.FredokaOne
    TextLabel_2.Text = "Under Development"
    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.TextScaled = true
    TextLabel_2.TextSize = 14.000
    TextLabel_2.TextWrapped = true

    SettingsFrame.Name = "SettingsFrame"
    SettingsFrame.Parent = MainFrame
    SettingsFrame.Active = true
    SettingsFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    SettingsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SettingsFrame.BorderSizePixel = 0
    SettingsFrame.Position = UDim2.new(0.0244644508, 0, 0.1444446, 0)
    SettingsFrame.Size = UDim2.new(0.949745357, 0, 0.594444156, 0)
    SettingsFrame.Visible = false

    UICorner_16.CornerRadius = UDim.new(0.0199999996, 0)
    UICorner_16.Parent = SettingsFrame

    TextLabel_3.Parent = SettingsFrame
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 1.000
    TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_3.BorderSizePixel = 0
    TextLabel_3.Position = UDim2.new(0.290447444, 0, 0.444655627, 0)
    TextLabel_3.Size = UDim2.new(0.419877589, 0, 0.109521084, 0)
    TextLabel_3.Font = Enum.Font.FredokaOne
    TextLabel_3.Text = "Under Development"
    TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.TextScaled = true
    TextLabel_3.TextSize = 14.000
    TextLabel_3.TextWrapped = true


    --local Highlighter = require(game.ReplicatedStorage.Highlighter)
    --local myTextLabel = ScriptBox

    --Highlighter.highlight({
    --    textObject = myTextLabel,
    --})

    local execBtn = MenuList:WaitForChild("ExecBtn")
    local cloudBtn = MenuList:WaitForChild("CloudBtn")
    local lsBtn = MenuList:WaitForChild("LSBtn")
    local settingsBtn = MenuList:WaitForChild("SettingsBtn")

    local execFrame = MainFrame:WaitForChild("ExecFrame")
    local cloudFrame = MainFrame:WaitForChild("CloudFrame")
    local localScriptFrame = MainFrame:WaitForChild("LocalScriptFrame")
    local settingsFrame = MainFrame:WaitForChild("SettingsFrame")

    local excbtn = Button1
    local execlipbtn = Button2
    local pastebtn = Button3
    local clearbtn = Button4

    local function hideAllFrames()
        execFrame.Visible = false
        cloudFrame.Visible = false
        localScriptFrame.Visible = false
        settingsFrame.Visible = false    
    end

    local function showFrame(frame, btn)
        hideAllFrames()
        frame.Visible = true
        --btn.UIStroke.Enabled = true
    end

    execBtn.Activated:Connect(function()
        showFrame(execFrame, execBtn)
    end)

    cloudBtn.Activated:Connect(function()
        showFrame(cloudFrame, cloudBtn)
    end)

    lsBtn.Activated:Connect(function()
        showFrame(localScriptFrame, lsBtn)
    end)

    settingsBtn.Activated:Connect(function()
        showFrame(settingsFrame, settingsBtn)
    end)

    hideAllFrames()


    excbtn.Activated:Connect(function()
        --excbtn.UIStroke.Enabled = true
        print("executed")
        --executecode(ScriptBox.Text)
        wait(0.1)
        --excbtn.UIStroke.Enabled = false
    end) 

    execlipbtn.Activated:Connect(function()
        --execlipbtn.UIStroke.Enabled = true
        print("executed clipboard")
        wait(0.1)
        --execlipbtn.UIStroke.Enabled = false
    end)  

    pastebtn.Activated:Connect(function()
        --pastebtn.UIStroke.Enabled = true
        --ScriptBox.Text = getclipboard()
        wait(0.1)
        --pastebtn.UIStroke.Enabled = false
    end) 

    clearbtn.Activated:Connect(function()
        --clearbtn.UIStroke.Enabled = true
        ScriptBox.Text = ""
        wait(0.1)
        --clearbtn.UIStroke.Enabled = false
    end)  


    ExitBtn.Activated:Connect(function()
        TrigonMain.Enabled = not TrigonMain.Enabled
    end)
end

function TrigonTopBar()
    if gethui():FindFirstChild("TrigonTopBar") then return end
    local TrigonTopBar = Instance.new("ScreenGui")
    local TopbarFrame = Instance.new("Frame")
    local Right = Instance.new("Frame")
    local Trigon = Instance.new("Frame")
    local IconButton = Instance.new("ImageButton")
    local IconImage = Instance.new("ImageLabel")
    local UIListLayout = Instance.new("UIListLayout")


    TrigonTopBar.ClipToDeviceSafeArea = true
    TrigonTopBar.SafeAreaCompatibility = Enum.SafeAreaCompatibility.FullscreenExtension
    TrigonTopBar.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    TrigonTopBar.Archivable = true
    TrigonTopBar.DisplayOrder = 1000000000
    TrigonTopBar.Enabled = true
    TrigonTopBar.IgnoreGuiInset = true
    TrigonTopBar.Name = "TrigonTopBar"
    TrigonTopBar.Enabled = false   
    TrigonTopBar.Parent = gethui()
    TrigonTopBar.ResetOnSpawn = false
    TrigonTopBar.ZIndexBehavior = Enum.ZIndexBehavior.Global
    TrigonTopBar.AutoLocalize = true


    TopbarFrame.Name = "TopbarFrame"
    TopbarFrame.Parent = TrigonTopBar
    TopbarFrame.BackgroundTransparency = 1.000
    TopbarFrame.BorderSizePixel = 0
    TopbarFrame.Size = UDim2.new(1, 0, 0, 36)
    TopbarFrame.ZIndex = 1000000000

    Right.Name = "Right"
    Right.Parent = TopbarFrame
    Right.AnchorPoint = Vector2.new(1, 0)
    Right.BackgroundTransparency = 1.000
    Right.BorderSizePixel = 0
    Right.Position = UDim2.new(1, -60, 0, 4)
    Right.Size = UDim2.new(0.850000024, 0, 0, 32)

    Trigon.Name = "Trigon"
    Trigon.Parent = Right
    Trigon.BackgroundTransparency = 1.000
    Trigon.BorderSizePixel = 0
    Trigon.Position = UDim2.new(0, 104, 0, 4)
    Trigon.Size = UDim2.new(0, 32, 0, 32)

    IconButton.Name = "IconButton"
    IconButton.Parent = Trigon
    IconButton.BackgroundTransparency = 1.000
    IconButton.Size = UDim2.new(1, 0, 1, 0)
    IconButton.ZIndex = 2
    IconButton.Image = "rbxasset://textures/ui/TopBar/iconBase.png"
    IconButton.ImageColor3 = Color3.fromRGB(170, 255, 127)
    IconButton.ScaleType = Enum.ScaleType.Slice
    IconButton.SliceCenter = Rect.new(10, 10, 10, 10)

    IconImage.Name = "IconImage"
    IconImage.Parent = IconButton
    IconImage.AnchorPoint = Vector2.new(0.5, 0.5)
    IconImage.BackgroundTransparency = 1.000
    IconImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    IconImage.Size = UDim2.new(1, -8, 0, 24)
    IconImage.ZIndex = 3
    IconImage.Image = "rbxassetid://15844306310"
    IconImage.ScaleType = Enum.ScaleType.Fit

    UIListLayout.Parent = Right
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 12)

    local PlayerGui = game.Players.LocalPlayer.PlayerGui
    local TrigonMain = PlayerGui:WaitForChild("TrigonMain")
    IconButton.Activated:Connect(function()
        warn(TrigonMain.Enabled)
        TrigonMain.Enabled = not TrigonMain.Enabled
        print(TrigonMain.Enabled)
    end)
end


coroutine.resume(coroutine.create(function()
    TrigonLoader()
end))

coroutine.resume(coroutine.create(function()
    TrigonTopBar()
end))  

coroutine.resume(coroutine.create(function()
    TrigonMain()
end))
