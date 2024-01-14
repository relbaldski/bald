--v0.02 fixed
function topbar(ButtonName,Image,Left)
    task.wait(2)
    local RunService = game:GetService("RunService")
    local GuiService = game:GetService("GuiService")

    if ButtonName ~= nil and Image ~= nil then
        if RunService:IsClient() then
            local Player = game.Players.LocalPlayer
            if Player ~= nil then 
                local PlrCheck = false
                for _,p in pairs(game.Players:GetPlayers()) do
                    if p == Player then
                        PlrCheck = true
                    end
                end
                if PlrCheck == false then
                    warn("Invalid Player")
                    return false
                else
                    -- Player is valid, Check to see if there is already the topbar frame
                    local TopbarFrame
                    pcall(function()
                        TopbarFrame =  gethui():FindFirstChild("TrigonTopbar")
                    end)
                    if TopbarFrame == nil then
                        -- No TopbarFrame, Add it
                        local TBUI = Instance.new("ScreenGui")
                        TBUI.Parent =  gethui()
                        TBUI.Name = "TrigonTopbar"
                        TBUI.DisplayOrder = 1000000000
                        TBUI.Enabled = true
                        TBUI.IgnoreGuiInset = true
                        TBUI.ResetOnSpawn = false

                        local TBFrame = Instance.new("Frame")
                        TBFrame.Parent = TBUI
                        TBFrame.BackgroundTransparency = 1
                        TBFrame.BorderSizePixel = 0
                        TBFrame.Name = "TopbarFrame"
                        TBFrame.Size = UDim2.new(1,0,0,36)
                        TBFrame.ZIndex = 1000000000

                        local TBL = Instance.new("Frame")
                        TBL.Parent = TBFrame
                        TBL.BackgroundTransparency = 1
                        TBL.BorderSizePixel = 0
                        TBL.Name = "Left"
                        TBL.Position = UDim2.new(0,104,0,4)
                        TBL.Size = UDim2.new(0.85,0,0,32)

                        local TBR = Instance.new("Frame")
                        TBR.Parent = TBFrame
                        TBR.BackgroundTransparency = 1
                        TBR.BorderSizePixel = 0
                        TBR.Name = "Right"
                        TBR.AnchorPoint = Vector2.new(1,0)
                        TBR.Position = UDim2.new(1,-60,0,4)
                        TBR.Size = UDim2.new(0.85,0,0,32)

                        local TBLUI = Instance.new("UIListLayout")
                        TBLUI.Parent = TBL
                        TBLUI.Padding = UDim.new(0,12)
                        TBLUI.FillDirection = Enum.FillDirection.Horizontal
                        TBLUI.HorizontalAlignment = Enum.HorizontalAlignment.Left
                        TBLUI.SortOrder = Enum.SortOrder.LayoutOrder
                        TBLUI.VerticalAlignment = Enum.VerticalAlignment.Top

                        local TBRUI = Instance.new("UIListLayout")
                        TBRUI.Parent = TBR
                        TBRUI.Padding = UDim.new(0,12)
                        TBRUI.FillDirection = Enum.FillDirection.Horizontal
                        TBRUI.HorizontalAlignment = Enum.HorizontalAlignment.Right
                        TBRUI.SortOrder = Enum.SortOrder.LayoutOrder
                        TBRUI.VerticalAlignment = Enum.VerticalAlignment.Top

                        RunService.RenderStepped:Connect(function()
                            if GuiService.MenuIsOpen == true then
                                TBFrame.Visible = false
                            else
                                TBFrame.Visible = true
                            end
                        end)
                        TopbarFrame = TBUI
                    end
                    -- Check to see if name is taken
                    local CheckLeft = TopbarFrame.TopbarFrame.Left:FindFirstChild(ButtonName)
                    local CheckRight = TopbarFrame.TopbarFrame.Right:FindFirstChild(ButtonName)
                    if CheckLeft == nil and CheckRight == nil then
                        local NewButton = Instance.new("Frame")
                        NewButton.Name = ButtonName
                        NewButton.BackgroundTransparency = 1
                        NewButton.BorderSizePixel = 0
                        NewButton.Position = UDim2.new(0,104,0,4)
                        NewButton.Size = UDim2.new(0,32,0,32)

                        local IconButton = Instance.new("ImageButton")
                        IconButton.Parent = NewButton
                        IconButton.BackgroundTransparency = 1
                        IconButton.Name = "IconButton"
                        IconButton.Size = UDim2.new(1,0,1,0)
                        IconButton.ZIndex = 2
                        IconButton.Image = "rbxasset://textures/ui/TopBar/iconBase.png"
                        IconButton.ScaleType = Enum.ScaleType.Slice
                        IconButton.SliceCenter = Rect.new(Vector2.new(10,10),Vector2.new(10,10))

                        local BadgeContainer = Instance.new("Frame")
                        BadgeContainer.Parent = IconButton
                        BadgeContainer.BackgroundTransparency = 1
                        BadgeContainer.Size = UDim2.new(1,0,1,0)
                        BadgeContainer.Name = "BadgeContainer"
                        BadgeContainer.ZIndex = 5
                        BadgeContainer.Visible = false

                        local Badge = Instance.new("Frame")
                        Badge.Parent = BadgeContainer
                        Badge.BackgroundTransparency = 1
                        Badge.Name = "Badge"
                        Badge.Position = UDim2.new(0,18,0,-2)
                        Badge.Size = UDim2.new(0,24,0,24)

                        local BadgeBG = Instance.new("ImageLabel")
                        BadgeBG.Parent = Badge
                        BadgeBG.BackgroundTransparency = 1
                        BadgeBG.Size = UDim2.new(1,0,1,0)
                        BadgeBG.Name = "Background"
                        BadgeBG.ZIndex = 2
                        BadgeBG.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_1.png"
                        BadgeBG.ImageColor3 = Color3.fromRGB(35, 37, 39)
                        BadgeBG.ImageRectOffset = Vector2.new(301, 484)
                        BadgeBG.ImageRectSize = Vector2.new(25,25)
                        BadgeBG.ScaleType = Enum.ScaleType.Slice
                        BadgeBG.SliceCenter = Rect.new(Vector2.new(14,14),Vector2.new(15,15))

                        local Inner = Instance.new("ImageLabel")
                        Inner.Parent = Badge
                        Inner.AnchorPoint = Vector2.new(0.5,0.5)
                        Inner.BackgroundTransparency = 1
                        Inner.Name = "Inner"
                        Inner.Position = UDim2.new(0.5,0,0.5,0)
                        Inner.Size = UDim2.new(1,-4,1,-4)
                        Inner.ZIndex = 3
                        Inner.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_1.png"
                        Inner.ImageRectOffset = Vector2.new(463,168)
                        Inner.ImageRectSize = Vector2.new(21,21)
                        Inner.ScaleType = Enum.ScaleType.Slice
                        Inner.SliceCenter = Rect.new(Vector2.new(14,14),Vector2.new(15,15))

                        local InnerTL = Instance.new("TextLabel")
                        InnerTL.Parent = Inner
                        InnerTL.BackgroundTransparency = 1
                        InnerTL.Name = "TextLabel"
                        InnerTL.Size = UDim2.new(1,0,1,0)
                        InnerTL.Font = Enum.Font.Gotham
                        InnerTL.Text = "0"
                        InnerTL.TextColor3 = Color3.fromRGB(57, 59, 61)
                        InnerTL.TextSize = 14

                        local IconImg = Instance.new("ImageLabel")
                        IconImg.Parent = IconButton
                        IconImg.AnchorPoint = Vector2.new(0.5,0.5)
                        IconImg.BackgroundTransparency = 1
                        IconImg.Name = "IconImage"
                        IconImg.Position = UDim2.new(0.5,0,0.5,0)
                        IconImg.Size = UDim2.new(1,-8,0,24)
                        IconImg.ZIndex = 3
                        IconImg.Image = "rbxasset://textures/ui/TopBar/coloredlogo.png"
                        IconImg.ScaleType = Enum.ScaleType.Fit

                        local DropDown = Instance.new("ImageLabel")
                        DropDown.Name = "Dropdown"
                        DropDown.Parent = NewButton
                        DropDown.AnchorPoint = Vector2.new(0.5,0)
                        DropDown.BackgroundTransparency = 1
                        DropDown.Position = UDim2.new(0.5,0,1,2)
                        DropDown.Size = UDim2.new(0,10,0,0)
                        DropDown.Image = "rbxasset://textures/ui/TopBar/iconBase.png"
                        DropDown.ScaleType = Enum.ScaleType.Slice
                        DropDown.SliceCenter =  Rect.new(Vector2.new(10,10),Vector2.new(10,10))
                        DropDown.Visible = false

                        IconButton.MouseButton2Up:Connect(function()
                            DropDown.Visible = not DropDown.Visible
                        end)

                        local DropList = Instance.new("UIListLayout")
                        DropList.Parent = DropDown
                        DropList.FillDirection = Enum.FillDirection.Vertical
                        DropList.HorizontalAlignment = Enum.HorizontalAlignment.Left
                        DropList.SortOrder = Enum.SortOrder.LayoutOrder
                        DropList.VerticalAlignment = Enum.VerticalAlignment.Top

                        pcall(function()
                            NewButton.IconButton.IconImage.Image = Image
                        end)
                        if Left == true or nil then
                            NewButton.Parent = TopbarFrame.TopbarFrame.Left
                        else
                            NewButton.Parent = TopbarFrame.TopbarFrame.Right
                        end

                        IconButton.Activated:Connect(function()
                            local TrigonMain =  gethui().TrigonMain
                            TrigonMain.Enabled = not TrigonMain.Enabled
                        end)

                        local tbl =
                            {
                                pulseimg = Instance.new("ImageLabel"),
                                pulsescript = Instance.new("LocalScript")
                            }

                        tbl.pulseimg.ImageColor3 = Color3.fromRGB(0, 0, 0)
                        tbl.pulseimg.SliceCenter = Rect.new(20, 20, 108, 108)
                        tbl.pulseimg.ScaleType = Enum.ScaleType.Fit
                        tbl.pulseimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        tbl.pulseimg.ImageTransparency = 0.2
                        tbl.pulseimg.Image = "rbxassetid://11953711609"
                        tbl.pulseimg.Size = UDim2.new(19.75, 0, 20.8125, 0)
                        tbl.pulseimg.Name = "pulseimg"
                        tbl.pulseimg.BackgroundTransparency = 1
                        tbl.pulseimg.Position = UDim2.new(-9.375, 0, -9.9375, 0)
                        tbl.pulseimg.Parent = IconButton

                        tbl.pulsescript.Name = "pulsescript"
                        tbl.pulsescript.Parent = tbl.pulseimg

                        task.spawn(function()
                            local script = tbl.pulsescript

                            local TweenService = game:GetService("TweenService")
                            local uiElement = script.Parent 

                            local normalSize = UDim2.new(19.75, 0, 20.813, 0)
                            local bigSize = UDim2.new(26.375, 0, 25.5, 0)
                            local normalPos = UDim2.new(-9.375, 0, -9.938, 0)
                            local bigPos = UDim2.new(-12.469, 0, -12.281, 0)

                            local tweenDuration = 0.5 
                            local pulseDuration = 4

                            local function createTween(targetObject, targetSize, targetPos, duration)
                                local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                                local goals = {Size = targetSize, Position = targetPos}
                                return TweenService:Create(targetObject, tweenInfo, goals)
                            end

                            local function startPulsing()
                                local startTime = tick()

                                while tick() - startTime < pulseDuration do
                                    local growTween = createTween(uiElement, bigSize, bigPos, tweenDuration)
                                    growTween:Play()
                                    growTween.Completed:Wait()

                                    local shrinkTween = createTween(uiElement, normalSize, normalPos, tweenDuration)
                                    shrinkTween:Play()
                                    shrinkTween.Completed:Wait()
                                end

                                uiElement.Visible = false
                            end

                            startPulsing()

                        end)



                        return NewButton.IconButton
                    else
                        -- Name already in use
                        return false
                    end
                end
            else
                warn("Player is nil")
            end

        else
            warn("Input is nil")
            return false
        end
    end
end

function loader() 
    local tbl =
        {
            TrigonLoader = Instance.new("ScreenGui"),
            MainFrame = Instance.new("Frame"),
            KeySection = Instance.new("Frame"),
            ImageLabel = Instance.new("ImageLabel"),
            Buttons = Instance.new("Frame"),
            UIListLayout = Instance.new("UIListLayout"),
            zButton2 = Instance.new("ImageButton"),
            UICorner = Instance.new("UICorner"),
            UIGradient = Instance.new("UIGradient"),
            Title = Instance.new("TextLabel"),
            zButton1 = Instance.new("ImageButton"),
            UICorner_1 = Instance.new("UICorner"),
            Title_1 = Instance.new("TextLabel"),
            UIGradient_1 = Instance.new("UIGradient"),
            aKeyContainer = Instance.new("Frame"),
            KeyBox = Instance.new("TextBox"),
            UICorner_2 = Instance.new("UICorner"),
            Frame = Instance.new("Frame"),
            SelectorFrame = Instance.new("Frame"),
            Buttons_1 = Instance.new("Frame"),
            OptionL = Instance.new("ImageButton"),
            UICorner_3 = Instance.new("UICorner"),
            UIStroke = Instance.new("UIStroke"),
            ImageLabel_1 = Instance.new("ImageLabel"),
            TextLabel = Instance.new("TextLabel"),
            overlay = Instance.new("Frame"),
            UIListLayout_1 = Instance.new("UIListLayout"),
            OptionR = Instance.new("ImageButton"),
            UIStroke_1 = Instance.new("UIStroke"),
            ImageLabel_2 = Instance.new("ImageLabel"),
            TextLabel_1 = Instance.new("TextLabel"),
            UICorner_4 = Instance.new("UICorner"),
            OptionH = Instance.new("ImageButton"),
            UICorner_5 = Instance.new("UICorner"),
            UIStroke_2 = Instance.new("UIStroke"),
            ImageLabel_3 = Instance.new("ImageLabel"),
            TextLabel_2 = Instance.new("TextLabel"),
            overlay_1 = Instance.new("Frame"),
            Title_2 = Instance.new("TextLabel"),
            CloseBtn = Instance.new("ImageButton"),
            UICorner_6 = Instance.new("UICorner"),
            LoaderFrame = Instance.new("Frame"),
            ImageLabel_4 = Instance.new("ImageLabel"),
            list = Instance.new("Frame"),
            UIListLayout_2 = Instance.new("UIListLayout"),
            Frame_1 = Instance.new("Frame"),
            UICorner_7 = Instance.new("UICorner"),
            Bar = Instance.new("Frame"),
            UICorner_8 = Instance.new("UICorner"),
            Title_3 = Instance.new("TextLabel"),
            CloseBtn_1 = Instance.new("ImageButton"),
            LocalScript = Instance.new("LocalScript"),
            TrigonLogo = Instance.new("ImageLabel")
        }

    tbl.TrigonLoader.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    tbl.TrigonLoader.IgnoreGuiInset = true
    tbl.TrigonLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    tbl.TrigonLoader.Name = "TrigonLoader"
    tbl.TrigonLoader.DisplayOrder = 2
    tbl.TrigonLoader.Parent =  gethui()

    tbl.MainFrame.BorderSizePixel = 0
    tbl.MainFrame.Size = UDim2.new(0.520158, 0, 0.551802, 0)
    tbl.MainFrame.Position = UDim2.new(0.239385, 0, 0.223958, 0)
    tbl.MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.MainFrame.Name = "MainFrame"
    tbl.MainFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.MainFrame.Parent = tbl.TrigonLoader

    tbl.KeySection.BorderSizePixel = 0
    tbl.KeySection.Size = UDim2.new(1, 0, 1, 0)
    tbl.KeySection.BackgroundTransparency = 1
    tbl.KeySection.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.KeySection.Visible = false
    tbl.KeySection.Name = "KeySection"
    tbl.KeySection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.KeySection.Parent = tbl.MainFrame

    tbl.ImageLabel.BorderSizePixel = 0
    tbl.ImageLabel.ScaleType = Enum.ScaleType.Fit
    tbl.ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.ImageLabel.Image = "rbxassetid://15844306310"
    tbl.ImageLabel.Size = UDim2.new(1, 0, 0.233923, 0)
    tbl.ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ImageLabel.BackgroundTransparency = 1
    tbl.ImageLabel.Position = UDim2.new(3.32781e-08, 0, 0.0618388, 0)
    tbl.ImageLabel.Parent = tbl.KeySection

    tbl.Buttons.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Buttons.BorderSizePixel = 0
    tbl.Buttons.Size = UDim2.new(0.856923, 0, 0.435747, 0)
    tbl.Buttons.Position = UDim2.new(0.499928, 0, 0.782127, 0)
    tbl.Buttons.BackgroundTransparency = 1
    tbl.Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Buttons.Name = "Buttons"
    tbl.Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Buttons.Parent = tbl.KeySection

    tbl.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tbl.UIListLayout.Padding = UDim.new(0.07, 0)
    tbl.UIListLayout.Parent = tbl.Buttons

    tbl.zButton2.Active = false
    tbl.zButton2.BorderSizePixel = 0
    tbl.zButton2.ScaleType = Enum.ScaleType.Fit
    tbl.zButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.zButton2.Selectable = false
    tbl.zButton2.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.zButton2.Size = UDim2.new(0.6, 0, 0.248202, 0)
    tbl.zButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.zButton2.Name = "zButton2"
    tbl.zButton2.Position = UDim2.new(0.5, 0, 1.22563, 0)
    tbl.zButton2.Parent = tbl.Buttons

    tbl.UICorner.CornerRadius = UDim.new(0.2, 0)
    tbl.UICorner.Parent = tbl.zButton2

    tbl.UIGradient.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 85)), ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 90, 120)) }
    tbl.UIGradient.Rotation = -90
    tbl.UIGradient.Parent = tbl.zButton2

    tbl.Title.TextWrapped = true
    tbl.Title.BorderSizePixel = 0
    tbl.Title.TextScaled = true
    tbl.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title.TextSize = 14
    tbl.Title.Name = "Title"
    tbl.Title.Size = UDim2.new(0.393375, 0, 0.46988, 0)
    tbl.Title.TextColor3 = Color3.fromRGB(113, 128, 170)
    tbl.Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title.Text = "COPY KEY LINK"
    tbl.Title.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Title.BackgroundTransparency = 1
    tbl.Title.Parent = tbl.zButton2

    tbl.zButton1.Active = false
    tbl.zButton1.BorderSizePixel = 0
    tbl.zButton1.ScaleType = Enum.ScaleType.Fit
    tbl.zButton1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.zButton1.Selectable = false
    tbl.zButton1.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.zButton1.Size = UDim2.new(0.6, 0, 0.248202, 0)
    tbl.zButton1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.zButton1.Name = "zButton1"
    tbl.zButton1.Position = UDim2.new(0.5, 0, 0.924008, 0)
    tbl.zButton1.Parent = tbl.Buttons

    tbl.UICorner_1.CornerRadius = UDim.new(0.2, 0)
    tbl.UICorner_1.Parent = tbl.zButton1

    tbl.Title_1.TextWrapped = true
    tbl.Title_1.BorderSizePixel = 0
    tbl.Title_1.TextScaled = true
    tbl.Title_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_1.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title_1.TextSize = 14
    tbl.Title_1.Name = "Title"
    tbl.Title_1.Size = UDim2.new(0.393375, 0, 0.46988, 0)
    tbl.Title_1.TextColor3 = Color3.fromRGB(250, 250, 250)
    tbl.Title_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_1.Text = "Verify"
    tbl.Title_1.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Title_1.BackgroundTransparency = 1
    tbl.Title_1.Parent = tbl.zButton1

    tbl.UIGradient_1.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 118, 218)), ColorSequenceKeypoint.new(1, Color3.fromRGB(104, 155, 247)) }
    tbl.UIGradient_1.Rotation = -90
    tbl.UIGradient_1.Parent = tbl.zButton1

    tbl.aKeyContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.aKeyContainer.BorderSizePixel = 0
    tbl.aKeyContainer.Size = UDim2.new(0.855384, 0, 0.259971, 0)
    tbl.aKeyContainer.Position = UDim2.new(0.5, 0, 0.129985, 0)
    tbl.aKeyContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.aKeyContainer.Name = "aKeyContainer"
    tbl.aKeyContainer.BackgroundColor3 = Color3.fromRGB(52, 57, 71)
    tbl.aKeyContainer.Parent = tbl.Buttons

    tbl.KeyBox.TextWrapped = true
    tbl.KeyBox.BorderSizePixel = 0
    tbl.KeyBox.TextScaled = true
    tbl.KeyBox.BackgroundColor3 = Color3.fromRGB(49, 53, 66)
    tbl.KeyBox.FontFace = Font.new("rbxasset://fonts/families/SpecialElite.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.KeyBox.Position = UDim2.new(0.0761539, 0, 0.2579, 0)
    tbl.KeyBox.BackgroundTransparency = 1
    tbl.KeyBox.TextSize = 14
    tbl.KeyBox.ClipsDescendants = true
    tbl.KeyBox.Size = UDim2.new(0.856692, 0, 0.515946, 0)
    tbl.KeyBox.TextColor3 = Color3.fromRGB(203, 203, 203)
    tbl.KeyBox.BorderColor3 = Color3.fromRGB(49, 53, 66)
    tbl.KeyBox.Text = "ygtMMDhgF0l0DAROIsBQwctpoinGnwJp"
    tbl.KeyBox.Name = "KeyBox"
    tbl.KeyBox.ClearTextOnFocus = false
    tbl.KeyBox.Parent = tbl.aKeyContainer

    tbl.UICorner_2.CornerRadius = UDim.new(0.15, 0)
    tbl.UICorner_2.Parent = tbl.aKeyContainer

    tbl.Frame.BorderSizePixel = 0
    tbl.Frame.Size = UDim2.new(0.888723, 0, 0.00191462, 0)
    tbl.Frame.Position = UDim2.new(0.0556134, 0, 0.530351, 0)
    tbl.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Frame.BackgroundColor3 = Color3.fromRGB(62, 68, 86)
    tbl.Frame.Parent = tbl.KeySection

    tbl.SelectorFrame.BorderSizePixel = 0
    tbl.SelectorFrame.Size = UDim2.new(1, 0, 1, 0)
    tbl.SelectorFrame.BackgroundTransparency = 1
    tbl.SelectorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.SelectorFrame.Visible = false
    tbl.SelectorFrame.Name = "SelectorFrame"
    tbl.SelectorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.SelectorFrame.Parent = tbl.MainFrame

    tbl.Buttons_1.ZIndex = 4
    tbl.Buttons_1.BorderSizePixel = 0
    tbl.Buttons_1.Size = UDim2.new(1, 0, 0.610765, 0)
    tbl.Buttons_1.Position = UDim2.new(-0.00109042, 0, 0.28145, 0)
    tbl.Buttons_1.BackgroundTransparency = 1
    tbl.Buttons_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Buttons_1.Name = "Buttons"
    tbl.Buttons_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Buttons_1.Parent = tbl.SelectorFrame

    tbl.OptionL.Active = false
    tbl.OptionL.BorderSizePixel = 5
    tbl.OptionL.ScaleType = Enum.ScaleType.Fit
    tbl.OptionL.AutoButtonColor = false
    tbl.OptionL.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    tbl.OptionL.BorderMode = Enum.BorderMode.Inset
    tbl.OptionL.Size = UDim2.new(0.269343, 0, 0.774295, 0)
    tbl.OptionL.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.OptionL.Name = "OptionL"
    tbl.OptionL.Position = UDim2.new(0.0438047, 0, 0.112853, 0)
    tbl.OptionL.Parent = tbl.Buttons_1

    tbl.UICorner_3.CornerRadius = UDim.new(0.08, 0)
    tbl.UICorner_3.Parent = tbl.OptionL

    tbl.UIStroke.LineJoinMode = Enum.LineJoinMode.Miter
    tbl.UIStroke.Thickness = 4
    tbl.UIStroke.Color = Color3.fromRGB(60, 66, 83)
    tbl.UIStroke.Parent = tbl.OptionL

    tbl.ImageLabel_1.BorderSizePixel = 0
    tbl.ImageLabel_1.ScaleType = Enum.ScaleType.Fit
    tbl.ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.ImageLabel_1.Image = "rbxassetid://15865854441"
    tbl.ImageLabel_1.Size = UDim2.new(0.769, 0, 0.691, 0)
    tbl.ImageLabel_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ImageLabel_1.BackgroundTransparency = 1
    tbl.ImageLabel_1.Position = UDim2.new(0.128502, 0, -0.00242697, 0)
    tbl.ImageLabel_1.Parent = tbl.OptionL

    tbl.TextLabel.TextWrapped = true
    tbl.TextLabel.BorderSizePixel = 0
    tbl.TextLabel.TextScaled = true
    tbl.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.TextLabel.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextLabel.TextSize = 14
    tbl.TextLabel.Size = UDim2.new(0.69, 0, 0.174, 0)
    tbl.TextLabel.TextColor3 = Color3.fromRGB(207, 204, 204)
    tbl.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextLabel.Text = "Low End"
    tbl.TextLabel.Position = UDim2.new(0.192, 0, 0.743, 0)
    tbl.TextLabel.BackgroundTransparency = 1
    tbl.TextLabel.Parent = tbl.OptionL

    tbl.overlay.ZIndex = 99
    tbl.overlay.BorderSizePixel = 0
    tbl.overlay.Size = UDim2.new(1, 0, 1, 0)
    tbl.overlay.BackgroundTransparency = 0.2
    tbl.overlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.overlay.Name = "overlay"
    tbl.overlay.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.overlay.Parent = tbl.OptionL

    tbl.UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
    tbl.UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tbl.UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center
    tbl.UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
    tbl.UIListLayout_1.Padding = UDim.new(0.05, 0)
    tbl.UIListLayout_1.Parent = tbl.Buttons_1

    tbl.OptionR.BorderSizePixel = 5
    tbl.OptionR.ScaleType = Enum.ScaleType.Fit
    tbl.OptionR.AutoButtonColor = false
    tbl.OptionR.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    tbl.OptionR.BorderMode = Enum.BorderMode.Inset
    tbl.OptionR.Size = UDim2.new(0.269343, 0, 0.774295, 0)
    tbl.OptionR.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.OptionR.Name = "OptionR"
    tbl.OptionR.Position = UDim2.new(0.382289, 0, 0.112853, 0)
    tbl.OptionR.Parent = tbl.Buttons_1

    tbl.UIStroke_1.LineJoinMode = Enum.LineJoinMode.Miter
    tbl.UIStroke_1.Thickness = 4
    tbl.UIStroke_1.Color = Color3.fromRGB(60, 66, 83)
    tbl.UIStroke_1.Parent = tbl.OptionR

    tbl.ImageLabel_2.BorderSizePixel = 0
    tbl.ImageLabel_2.ScaleType = Enum.ScaleType.Fit
    tbl.ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.ImageLabel_2.Image = "rbxassetid://15865857319"
    tbl.ImageLabel_2.Size = UDim2.new(0.768635, 0, 0.690602, 0)
    tbl.ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ImageLabel_2.BackgroundTransparency = 1
    tbl.ImageLabel_2.Position = UDim2.new(0.140513, 0, 0.0680589, 0)
    tbl.ImageLabel_2.Parent = tbl.OptionR

    tbl.TextLabel_1.TextWrapped = true
    tbl.TextLabel_1.BorderSizePixel = 0
    tbl.TextLabel_1.TextScaled = true
    tbl.TextLabel_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.TextLabel_1.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextLabel_1.TextSize = 14
    tbl.TextLabel_1.Size = UDim2.new(0.690137, 0, 0.17419, 0)
    tbl.TextLabel_1.TextColor3 = Color3.fromRGB(207, 204, 204)
    tbl.TextLabel_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextLabel_1.Text = "Normal"
    tbl.TextLabel_1.Position = UDim2.new(0.192185, 0, 0.743299, 0)
    tbl.TextLabel_1.BackgroundTransparency = 1
    tbl.TextLabel_1.Parent = tbl.OptionR

    tbl.UICorner_4.CornerRadius = UDim.new(0.1, 0)
    tbl.UICorner_4.Parent = tbl.OptionR

    tbl.OptionH.BorderSizePixel = 5
    tbl.OptionH.ScaleType = Enum.ScaleType.Fit
    tbl.OptionH.AutoButtonColor = false
    tbl.OptionH.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    tbl.OptionH.BorderMode = Enum.BorderMode.Inset
    tbl.OptionH.Size = UDim2.new(0.269343, 0, 0.774295, 0)
    tbl.OptionH.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.OptionH.Name = "OptionH"
    tbl.OptionH.Position = UDim2.new(0.0438047, 0, 0.112853, 0)
    tbl.OptionH.Parent = tbl.Buttons_1

    tbl.UICorner_5.CornerRadius = UDim.new(0.1, 0)
    tbl.UICorner_5.Parent = tbl.OptionH

    tbl.UIStroke_2.LineJoinMode = Enum.LineJoinMode.Miter
    tbl.UIStroke_2.Thickness = 4
    tbl.UIStroke_2.Color = Color3.fromRGB(60, 66, 83)
    tbl.UIStroke_2.Parent = tbl.OptionH

    tbl.ImageLabel_3.BorderSizePixel = 0
    tbl.ImageLabel_3.ScaleType = Enum.ScaleType.Fit
    tbl.ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.ImageLabel_3.Image = "rbxassetid://15865858307"
    tbl.ImageLabel_3.Size = UDim2.new(0.769, 0, 0.691, 0)
    tbl.ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ImageLabel_3.BackgroundTransparency = 1
    tbl.ImageLabel_3.Position = UDim2.new(0.141, 0, 0.068, 0)
    tbl.ImageLabel_3.Parent = tbl.OptionH

    tbl.TextLabel_2.TextWrapped = true
    tbl.TextLabel_2.BorderSizePixel = 0
    tbl.TextLabel_2.TextScaled = true
    tbl.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextLabel_2.TextSize = 14
    tbl.TextLabel_2.Size = UDim2.new(0.69, 0, 0.174, 0)
    tbl.TextLabel_2.TextColor3 = Color3.fromRGB(207, 204, 204)
    tbl.TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextLabel_2.Text = "Emulator"
    tbl.TextLabel_2.Position = UDim2.new(0.192, 0, 0.743, 0)
    tbl.TextLabel_2.BackgroundTransparency = 1
    tbl.TextLabel_2.Parent = tbl.OptionH

    tbl.overlay_1.ZIndex = 99
    tbl.overlay_1.BorderSizePixel = 0
    tbl.overlay_1.Size = UDim2.new(1, 0, 1, 0)
    tbl.overlay_1.BackgroundTransparency = 0.2
    tbl.overlay_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.overlay_1.Name = "overlay"
    tbl.overlay_1.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.overlay_1.Parent = tbl.OptionH

    tbl.Title_2.TextWrapped = true
    tbl.Title_2.BorderSizePixel = 0
    tbl.Title_2.TextScaled = true
    tbl.Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_2.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_2.TextSize = 14
    tbl.Title_2.Name = "Title"
    tbl.Title_2.Size = UDim2.new(0.998909, 0, 0.139768, 0)
    tbl.Title_2.TextColor3 = Color3.fromRGB(180, 193, 216)
    tbl.Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_2.Text = "Select an option"
    tbl.Title_2.Position = UDim2.new(0.00218095, 0, 0.116792, 0)
    tbl.Title_2.BackgroundTransparency = 1
    tbl.Title_2.Parent = tbl.SelectorFrame

    tbl.CloseBtn.ImageColor3 = Color3.fromRGB(165, 182, 230)
    tbl.CloseBtn.BorderSizePixel = 0
    tbl.CloseBtn.ScaleType = Enum.ScaleType.Fit
    tbl.CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.CloseBtn.Image = "rbxassetid://15866029769"
    tbl.CloseBtn.Size = UDim2.new(0.0711809, 0, 0.124451, 0)
    tbl.CloseBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.CloseBtn.Name = "CloseBtn"
    tbl.CloseBtn.BackgroundTransparency = 1
    tbl.CloseBtn.Position = UDim2.new(0.921436, 0, 0.0172316, 0)
    tbl.CloseBtn.ImageTransparency = 0.51
    tbl.CloseBtn.Parent = tbl.SelectorFrame

    tbl.UICorner_6.CornerRadius = UDim.new(0.03, 0)
    tbl.UICorner_6.Parent = tbl.SelectorFrame

    tbl.LoaderFrame.BorderSizePixel = 0
    tbl.LoaderFrame.Size = UDim2.new(1, 0, 1, 0)
    tbl.LoaderFrame.BackgroundTransparency = 1
    tbl.LoaderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.LoaderFrame.Name = "LoaderFrame"
    tbl.LoaderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.LoaderFrame.Parent = tbl.MainFrame

    tbl.ImageLabel_4.BorderSizePixel = 0
    tbl.ImageLabel_4.ScaleType = Enum.ScaleType.Fit
    tbl.ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.ImageLabel_4.Image = "rbxassetid://15844306310"
    tbl.ImageLabel_4.Size = UDim2.new(1, 0, 0.387093, 0)
    tbl.ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ImageLabel_4.BackgroundTransparency = 1
    tbl.ImageLabel_4.Position = UDim2.new(8.62644e-08, 0, 0.0929012, 0)
    tbl.ImageLabel_4.Parent = tbl.LoaderFrame

    tbl.list.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.list.BorderSizePixel = 0
    tbl.list.Size = UDim2.new(0.856923, 0, 0.435747, 0)
    tbl.list.Position = UDim2.new(0.499928, 0, 0.782127, 0)
    tbl.list.BackgroundTransparency = 1
    tbl.list.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.list.Name = "list"
    tbl.list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.list.Parent = tbl.LoaderFrame

    tbl.UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tbl.UIListLayout_2.Padding = UDim.new(0.07, 0)
    tbl.UIListLayout_2.Parent = tbl.list

    tbl.Frame_1.BorderSizePixel = 0
    tbl.Frame_1.Size = UDim2.new(0.929634, 0, 0.188937, 0)
    tbl.Frame_1.Position = UDim2.new(0.0351828, 0, 0, 0)
    tbl.Frame_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Frame_1.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    tbl.Frame_1.Parent = tbl.list

    tbl.UICorner_7.CornerRadius = UDim.new(0.2, 0)
    tbl.UICorner_7.Parent = tbl.Frame_1

    tbl.Bar.BorderSizePixel = 0
    tbl.Bar.Size = UDim2.new(0.985534, 0, 0.793589, 0)
    tbl.Bar.Position = UDim2.new(0.00723917, 0, 0.0930243, 0)
    tbl.Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Bar.Name = "Bar"
    tbl.Bar.BackgroundColor3 = Color3.fromRGB(74, 82, 103)
    tbl.Bar.Parent = tbl.Frame_1

    tbl.UICorner_8.CornerRadius = UDim.new(0.2, 0)
    tbl.UICorner_8.Parent = tbl.Bar

    tbl.Title_3.TextWrapped = true
    tbl.Title_3.BorderSizePixel = 0
    tbl.Title_3.TextScaled = true
    tbl.Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_3.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_3.TextSize = 14
    tbl.Title_3.Name = "Title"
    tbl.Title_3.Size = UDim2.new(0.998909, 0, 0.149594, 0)
    tbl.Title_3.TextColor3 = Color3.fromRGB(180, 193, 216)
    tbl.Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_3.Text = "Status: "
    tbl.Title_3.Position = UDim2.new(0.000545285, 0, 0.258937, 0)
    tbl.Title_3.BackgroundTransparency = 1
    tbl.Title_3.Parent = tbl.list

    tbl.CloseBtn_1.ImageColor3 = Color3.fromRGB(165, 182, 230)
    tbl.CloseBtn_1.BorderSizePixel = 0
    tbl.CloseBtn_1.ScaleType = Enum.ScaleType.Fit
    tbl.CloseBtn_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.CloseBtn_1.Image = "rbxassetid://15866029769"
    tbl.CloseBtn_1.Size = UDim2.new(0.0711809, 0, 0.124451, 0)
    tbl.CloseBtn_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.CloseBtn_1.Name = "CloseBtn"
    tbl.CloseBtn_1.BackgroundTransparency = 1
    tbl.CloseBtn_1.Position = UDim2.new(0.921436, 0, 0.0172316, 0)
    tbl.CloseBtn_1.ImageTransparency = 0.51
    tbl.CloseBtn_1.Parent = tbl.LoaderFrame

    tbl.LocalScript.Parent = tbl.MainFrame

    tbl.TrigonLogo.BorderSizePixel = 0
    tbl.TrigonLogo.ScaleType = Enum.ScaleType.Fit
    tbl.TrigonLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.TrigonLogo.Image = "rbxassetid://15844306310"
    tbl.TrigonLogo.Size = UDim2.new(0.5, 0, 0.747768, 0)
    tbl.TrigonLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TrigonLogo.Name = "TrigonLogo"
    tbl.TrigonLogo.BackgroundTransparency = 1
    tbl.TrigonLogo.Position = UDim2.new(0.249108, 0, 0.125064, 0)
    tbl.TrigonLogo.Visible = false
    tbl.TrigonLogo.Parent = tbl.MainFrame

    task.spawn(function()
        local script = tbl.LocalScript

        local TweenService = game:GetService("TweenService")
        local CurrentValue = 1
        local MainFrame = script.Parent
        local Bar = MainFrame.LoaderFrame.list.Frame.Bar
        local MaxValue = 100
        local Status = MainFrame.LoaderFrame.list.Title
        local TweenService = game:GetService("TweenService")


        local OptionR = MainFrame.SelectorFrame.Buttons.OptionR
        local Loader =  gethui():WaitForChild("TrigonLoader")
        local MainUI =  gethui():WaitForChild("TrigonMain")


        wait(1)


        local function ProgressBar(value, statusText, duration)
            CurrentValue = CurrentValue + value
            if CurrentValue > MaxValue then
                CurrentValue = MaxValue
            elseif CurrentValue < 0 then
                CurrentValue = 0
            end

            local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
            local tween = TweenService:Create(Bar, tweenInfo, {Size = UDim2.new(CurrentValue / MaxValue, 0, 0.8, 0)})
            tween:Play()

            Status.Text = "Status: " .. (statusText or "")
        end

        Bar.Size = UDim2.new(0, 0, 0.8, 0)

        ProgressBar(0, "Waiting for LocalPlayer...", 0.5)
        repeat task.wait() until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character
        local playerName = game.Players.LocalPlayer.Name
        ProgressBar(20, playerName .. " is loaded!", 1)
        wait(1)
        ProgressBar(10, "Verifying player...", 1)
        wait(1)
        ProgressBar(20, "Checking for game scripts...", 1)
        wait(1)
        ProgressBar(20, "Finalizing everything...", 1)
        wait(1)
        ProgressBar(30, "Setup Complete!", 1)
        wait(0.5)
        MainFrame.LoaderFrame.Visible = false
        --MainFrame.SelectorFrame.Visible = true

        local function  loadtrigon()
            local buttonx23 = topbar("Trigon", "rbxassetid://15844306310", true)
            Loader.Enabled = false
            MainUI.Enabled = true
            print(MainUI.Enabled)
        end

        repeat
            task.wait() 
        until Loader and MainUI

        OptionR.Activated:Connect(function()

        end)

        loadtrigon()
    end)    
end

function main() 

    local tbl =
        {
            TrigonMain = Instance.new("ScreenGui"),
            MainFrame = Instance.new("Frame"),
            BottomMenuFrame = Instance.new("Frame"),
            LeftFrame = Instance.new("Frame"),
            ExitBtn = Instance.new("ImageButton"),
            Icon = Instance.new("ImageLabel"),
            UICorner = Instance.new("UICorner"),
            RightFrame = Instance.new("Frame"),
            Button = Instance.new("ImageButton"),
            UIGradient = Instance.new("UIGradient"),
            Icon_1 = Instance.new("ImageLabel"),
            MenuList = Instance.new("Frame"),
            UICorner_1 = Instance.new("UICorner"),
            UIGridLayout = Instance.new("UIGridLayout"),
            HBtn = Instance.new("ImageButton"),
            UIGradient_1 = Instance.new("UIGradient"),
            Icon_2 = Instance.new("ImageLabel"),
            UIStroke = Instance.new("UIStroke"),
            UICorner_2 = Instance.new("UICorner"),
            ExecBtn = Instance.new("ImageButton"),
            Icon_3 = Instance.new("ImageLabel"),
            UIStroke_1 = Instance.new("UIStroke"),
            UICorner_3 = Instance.new("UICorner"),
            UIGradient_2 = Instance.new("UIGradient"),
            CloudBtn = Instance.new("ImageButton"),
            UIGradient_3 = Instance.new("UIGradient"),
            Icon_4 = Instance.new("ImageLabel"),
            UIStroke_2 = Instance.new("UIStroke"),
            UICorner_4 = Instance.new("UICorner"),
            SettingsBtn = Instance.new("ImageButton"),
            UIGradient_4 = Instance.new("UIGradient"),
            Icon_5 = Instance.new("ImageLabel"),
            UIStroke_3 = Instance.new("UIStroke"),
            UICorner_5 = Instance.new("UICorner"),
            UICorner_6 = Instance.new("UICorner"),
            logFrame = Instance.new("Frame"),
            UICorner_7 = Instance.new("UICorner"),
            logButtons = Instance.new("Frame"),
            logOutput = Instance.new("Frame"),
            Button_1 = Instance.new("ImageButton"),
            TextLabel = Instance.new("TextLabel"),
            UIListLayout = Instance.new("UIListLayout"),
            UIListLayout_1 = Instance.new("UIListLayout"),
            logWarning = Instance.new("Frame"),
            Button_2 = Instance.new("ImageButton"),
            TextLabel_1 = Instance.new("TextLabel"),
            UIListLayout_2 = Instance.new("UIListLayout"),
            logError = Instance.new("Frame"),
            Button_3 = Instance.new("ImageButton"),
            TextLabel_2 = Instance.new("TextLabel"),
            UIListLayout_3 = Instance.new("UIListLayout"),
            logInfo = Instance.new("Frame"),
            Button_4 = Instance.new("ImageButton"),
            TextLabel_3 = Instance.new("TextLabel"),
            UIListLayout_4 = Instance.new("UIListLayout"),
            cclrbtn = Instance.new("ImageButton"),
            Title = Instance.new("TextLabel"),
            UICorner_8 = Instance.new("UICorner"),
            UIStroke_4 = Instance.new("UIStroke"),
            TextLabel_4 = Instance.new("TextLabel"),
            consoleFrame = Instance.new("ScrollingFrame"),
            GlobalLog = Instance.new("LocalScript"),
            TextBox = Instance.new("TextLabel"),
            SettingsFrame = Instance.new("Frame"),
            UICorner_9 = Instance.new("UICorner"),
            sample = Instance.new("Frame"),
            UIListLayout_5 = Instance.new("UIListLayout"),
            UICorner_10 = Instance.new("UICorner"),
            Title_1 = Instance.new("TextLabel"),
            Title_2 = Instance.new("TextLabel"),
            Title_3 = Instance.new("TextLabel"),
            ImageLabel = Instance.new("ImageLabel"),
            homeFrame = Instance.new("Frame"),
            UICorner_11 = Instance.new("UICorner"),
            changelogFrame = Instance.new("ScrollingFrame"),
            ScriptBox = Instance.new("TextBox"),
            UICorner_12 = Instance.new("UICorner"),
            UIListLayout_6 = Instance.new("UIListLayout"),
            scriptsFrame = Instance.new("ScrollingFrame"),
            UICorner_13 = Instance.new("UICorner"),
            UIListLayout_7 = Instance.new("UIListLayout"),
            _GameHeader = Instance.new("Frame"),
            Title_4 = Instance.new("TextLabel"),
            UICorner_14 = Instance.new("UICorner"),
            TextButton = Instance.new("TextButton"),
            UICorner_15 = Instance.new("UICorner"),
            localplrFrame = Instance.new("Frame"),
            UIListLayout_8 = Instance.new("UIListLayout"),
            Header = Instance.new("Frame"),
            Title_5 = Instance.new("TextLabel"),
            UICorner_16 = Instance.new("UICorner"),
            walkspeed = Instance.new("Frame"),
            Slider = Instance.new("Frame"),
            Image = Instance.new("Frame"),
            Bar_Background = Instance.new("Frame"),
            UICorner_17 = Instance.new("UICorner"),
            Bar_Foreground = Instance.new("Frame"),
            UICorner_18 = Instance.new("UICorner"),
            Thumb = Instance.new("ImageLabel"),
            UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint"),
            Thumb_Pressed = Instance.new("ImageLabel"),
            Configuration = Instance.new("Configuration"),
            ObjectBarBackground = Instance.new("ObjectValue"),
            ObjectBarForeground = Instance.new("ObjectValue"),
            ObjectThumbNormal = Instance.new("ObjectValue"),
            ObjectThumbPressed = Instance.new("ObjectValue"),
            Title_6 = Instance.new("TextLabel"),
            jumspeed = Instance.new("Frame"),
            Slider_1 = Instance.new("Frame"),
            Image_1 = Instance.new("Frame"),
            Bar_Background_1 = Instance.new("Frame"),
            UICorner_19 = Instance.new("UICorner"),
            Bar_Foreground_1 = Instance.new("Frame"),
            UICorner_20 = Instance.new("UICorner"),
            Thumb_1 = Instance.new("ImageLabel"),
            UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint"),
            Thumb_Pressed_1 = Instance.new("ImageLabel"),
            Configuration_1 = Instance.new("Configuration"),
            ObjectBarBackground_1 = Instance.new("ObjectValue"),
            ObjectBarForeground_1 = Instance.new("ObjectValue"),
            ObjectThumbNormal_1 = Instance.new("ObjectValue"),
            ObjectThumbPressed_1 = Instance.new("ObjectValue"),
            Scripts = Instance.new("Folder"),
            FormSliderHorizontalLocalScript = Instance.new("LocalScript"),
            Title_7 = Instance.new("TextLabel"),
            LocalPlayerHandle = Instance.new("LocalScript"),
            FormSliderClass = Instance.new("ModuleScript"),
            ExtendDraggableClass = Instance.new("ModuleScript"),
            CurPos = Instance.new("TextLabel"),
            ExecFrame = Instance.new("Frame"),
            Buttons = Instance.new("Frame"),
            UIListLayout_9 = Instance.new("UIListLayout"),
            Button1 = Instance.new("ImageButton"),
            UIStroke_5 = Instance.new("UIStroke"),
            UICorner_21 = Instance.new("UICorner"),
            Title_8 = Instance.new("TextLabel"),
            Button4 = Instance.new("ImageButton"),
            Title_9 = Instance.new("TextLabel"),
            UICorner_22 = Instance.new("UICorner"),
            UIStroke_6 = Instance.new("UIStroke"),
            Button3 = Instance.new("ImageButton"),
            Title_10 = Instance.new("TextLabel"),
            UICorner_23 = Instance.new("UICorner"),
            UIStroke_7 = Instance.new("UIStroke"),
            Button2 = Instance.new("ImageButton"),
            Title_11 = Instance.new("TextLabel"),
            UICorner_24 = Instance.new("UICorner"),
            UIStroke_8 = Instance.new("UIStroke"),
            UICorner_25 = Instance.new("UICorner"),
            ScrollingFrame = Instance.new("ScrollingFrame"),
            LocalScript = Instance.new("LocalScript"),
            ScriptBox_1 = Instance.new("TextBox"),
            Highlighter = Instance.new("ModuleScript"),
            lexer = Instance.new("ModuleScript"),
            language = Instance.new("ModuleScript"),
            theme = Instance.new("ModuleScript"),
            types = Instance.new("ModuleScript"),
            utility = Instance.new("ModuleScript"),
            UICorner_26 = Instance.new("UICorner"),
            LocalScript_1 = Instance.new("LocalScript")
        }

    tbl.TrigonMain.Enabled = false
    tbl.TrigonMain.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    tbl.TrigonMain.IgnoreGuiInset = true
    tbl.TrigonMain.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    tbl.TrigonMain.Name = "TrigonMain"
    tbl.TrigonMain.Parent = gethui()

    tbl.MainFrame.BorderSizePixel = 0
    tbl.MainFrame.Size = UDim2.new(1.0005, 0, 1, 0)
    tbl.MainFrame.BackgroundTransparency = 0.35
    tbl.MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.MainFrame.Name = "MainFrame"
    tbl.MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    tbl.MainFrame.Parent = tbl.TrigonMain

    tbl.BottomMenuFrame.BorderSizePixel = 0
    tbl.BottomMenuFrame.Size = UDim2.new(0.950071, 0, 0.195095, 0)
    tbl.BottomMenuFrame.Position = UDim2.new(0.0244645, 0, 0.755853, 0)
    tbl.BottomMenuFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.BottomMenuFrame.ClipsDescendants = true
    tbl.BottomMenuFrame.Name = "BottomMenuFrame"
    tbl.BottomMenuFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.BottomMenuFrame.Parent = tbl.MainFrame

    tbl.LeftFrame.BorderSizePixel = 0
    tbl.LeftFrame.Size = UDim2.new(0.162271, 0, 1, 0)
    tbl.LeftFrame.Position = UDim2.new(-0.00054132, 0, 0, 0)
    tbl.LeftFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.LeftFrame.Name = "LeftFrame"
    tbl.LeftFrame.BackgroundColor3 = Color3.fromRGB(47, 52, 66)
    tbl.LeftFrame.Parent = tbl.BottomMenuFrame

    tbl.ExitBtn.ZIndex = 2
    tbl.ExitBtn.BorderSizePixel = 0
    tbl.ExitBtn.ScaleType = Enum.ScaleType.Fit
    tbl.ExitBtn.AutoButtonColor = false
    tbl.ExitBtn.BackgroundColor3 = Color3.fromRGB(47, 52, 66)
    tbl.ExitBtn.Selectable = false
    tbl.ExitBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.ExitBtn.Size = UDim2.new(0.891645, 0, 0.893438, 0)
    tbl.ExitBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ExitBtn.Name = "ExitBtn"
    tbl.ExitBtn.Position = UDim2.new(0.508863, 0, 0.5, 0)
    tbl.ExitBtn.Parent = tbl.LeftFrame

    tbl.Icon.ImageColor3 = Color3.fromRGB(201, 205, 210)
    tbl.Icon.SizeConstraint = Enum.SizeConstraint.RelativeXX
    tbl.Icon.BorderSizePixel = 0
    tbl.Icon.ScaleType = Enum.ScaleType.Fit
    tbl.Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Icon.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Icon.Image = "rbxassetid://15879382339"
    tbl.Icon.Size = UDim2.new(0.834218, 0, 12.9208, 0)
    tbl.Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Icon.Name = "Icon"
    tbl.Icon.BackgroundTransparency = 1
    tbl.Icon.Position = UDim2.new(0.494743, 0, 0.490654, 0)
    tbl.Icon.Parent = tbl.ExitBtn

    tbl.UICorner.CornerRadius = UDim.new(0.08, 0)
    tbl.UICorner.Parent = tbl.LeftFrame

    tbl.RightFrame.BorderSizePixel = 0
    tbl.RightFrame.Size = UDim2.new(0.111862, 0, 1, 0)
    tbl.RightFrame.Position = UDim2.new(0.887643, 0, 0, 0)
    tbl.RightFrame.BackgroundTransparency = 1
    tbl.RightFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.RightFrame.Name = "RightFrame"
    tbl.RightFrame.BackgroundColor3 = Color3.fromRGB(47, 52, 65)
    tbl.RightFrame.Parent = tbl.BottomMenuFrame

    tbl.Button.Active = false
    tbl.Button.BorderSizePixel = 0
    tbl.Button.ScaleType = Enum.ScaleType.Fit
    tbl.Button.AutoButtonColor = false
    tbl.Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Button.Selectable = false
    tbl.Button.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Button.Size = UDim2.new(0.834246, 0, 0.8, 0)
    tbl.Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Button.Name = "Button"
    tbl.Button.BackgroundTransparency = 1
    tbl.Button.Position = UDim2.new(0.490288, 0, 0.5, 0)
    tbl.Button.Parent = tbl.RightFrame

    tbl.UIGradient.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
    tbl.UIGradient.Rotation = -90
    tbl.UIGradient.Parent = tbl.Button

    tbl.Icon_1.SizeConstraint = Enum.SizeConstraint.RelativeYY
    tbl.Icon_1.BorderSizePixel = 0
    tbl.Icon_1.ScaleType = Enum.ScaleType.Fit
    tbl.Icon_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Icon_1.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Icon_1.Image = "rbxassetid://15844306310"
    tbl.Icon_1.Size = UDim2.new(0.83136, 0, 0.783259, 0)
    tbl.Icon_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Icon_1.Name = "Icon"
    tbl.Icon_1.BackgroundTransparency = 1
    tbl.Icon_1.Position = UDim2.new(0.370799, 0, 0.475195, 0)
    tbl.Icon_1.Parent = tbl.Button

    tbl.MenuList.BorderSizePixel = 0
    tbl.MenuList.Size = UDim2.new(0.777778, 0, 1, 0)
    tbl.MenuList.Position = UDim2.new(0.116366, 0, 0, 0)
    tbl.MenuList.BackgroundTransparency = 1
    tbl.MenuList.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.MenuList.Name = "MenuList"
    tbl.MenuList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.MenuList.Parent = tbl.BottomMenuFrame

    tbl.UICorner_1.CornerRadius = UDim.new(0.15, 0)
    tbl.UICorner_1.Parent = tbl.MenuList

    tbl.UIGridLayout.CellPadding = UDim2.new(0.02, 0, 1, 0)
    tbl.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    tbl.UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tbl.UIGridLayout.CellSize = UDim2.new(0.12, 0, 0.8, 0)
    tbl.UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tbl.UIGridLayout.Parent = tbl.MenuList

    tbl.HBtn.BorderSizePixel = 3
    tbl.HBtn.ScaleType = Enum.ScaleType.Fit
    tbl.HBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.HBtn.BorderMode = Enum.BorderMode.Inset
    tbl.HBtn.Selectable = false
    tbl.HBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.HBtn.Size = UDim2.new(0.12, 0, 0.8, 0)
    tbl.HBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.HBtn.Name = "HBtn"
    tbl.HBtn.Position = UDim2.new(0.406853, 0, 0.5, 0)
    tbl.HBtn.Parent = tbl.MenuList

    tbl.UIGradient_1.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
    tbl.UIGradient_1.Rotation = -90
    tbl.UIGradient_1.Parent = tbl.HBtn

    tbl.Icon_2.ImageColor3 = Color3.fromRGB(201, 205, 210)
    tbl.Icon_2.SizeConstraint = Enum.SizeConstraint.RelativeXX
    tbl.Icon_2.BorderSizePixel = 0
    tbl.Icon_2.ScaleType = Enum.ScaleType.Fit
    tbl.Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Icon_2.Image = "rbxassetid://15982534656"
    tbl.Icon_2.Size = UDim2.new(0.858703, 0, 0.887424, 0)
    tbl.Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Icon_2.Name = "Icon"
    tbl.Icon_2.BackgroundTransparency = 1
    tbl.Icon_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Icon_2.Parent = tbl.HBtn

    tbl.UIStroke.Thickness = 2
    tbl.UIStroke.Color = Color3.fromRGB(121, 133, 167)
    tbl.UIStroke.Parent = tbl.HBtn

    tbl.UICorner_2.CornerRadius = UDim.new(0.14, 0)
    tbl.UICorner_2.Parent = tbl.HBtn

    tbl.ExecBtn.BorderSizePixel = 3
    tbl.ExecBtn.ScaleType = Enum.ScaleType.Fit
    tbl.ExecBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.ExecBtn.BorderMode = Enum.BorderMode.Inset
    tbl.ExecBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.ExecBtn.Size = UDim2.new(0.12, 0, 0.8, 0)
    tbl.ExecBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ExecBtn.Name = "ExecBtn"
    tbl.ExecBtn.Position = UDim2.new(0.406853, 0, 0.5, 0)
    tbl.ExecBtn.Parent = tbl.MenuList

    tbl.Icon_3.ImageColor3 = Color3.fromRGB(201, 205, 210)
    tbl.Icon_3.SizeConstraint = Enum.SizeConstraint.RelativeXX
    tbl.Icon_3.BorderSizePixel = 0
    tbl.Icon_3.ScaleType = Enum.ScaleType.Fit
    tbl.Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Icon_3.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Icon_3.Image = "rbxassetid://15845222401"
    tbl.Icon_3.Size = UDim2.new(0.858703, 0, 0.887424, 0)
    tbl.Icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Icon_3.Name = "Icon"
    tbl.Icon_3.BackgroundTransparency = 1
    tbl.Icon_3.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Icon_3.Parent = tbl.ExecBtn

    tbl.UIStroke_1.Thickness = 2
    tbl.UIStroke_1.Color = Color3.fromRGB(121, 133, 167)
    tbl.UIStroke_1.Parent = tbl.ExecBtn

    tbl.UICorner_3.CornerRadius = UDim.new(0.14, 0)
    tbl.UICorner_3.Parent = tbl.ExecBtn

    tbl.UIGradient_2.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
    tbl.UIGradient_2.Rotation = -90
    tbl.UIGradient_2.Parent = tbl.ExecBtn

    tbl.CloudBtn.BorderSizePixel = 3
    tbl.CloudBtn.ScaleType = Enum.ScaleType.Fit
    tbl.CloudBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.CloudBtn.BorderMode = Enum.BorderMode.Inset
    tbl.CloudBtn.Selectable = false
    tbl.CloudBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.CloudBtn.Size = UDim2.new(0.12, 0, 0.8, 0)
    tbl.CloudBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.CloudBtn.Name = "CloudBtn"
    tbl.CloudBtn.Position = UDim2.new(0.406853, 0, 0.5, 0)
    tbl.CloudBtn.Parent = tbl.MenuList

    tbl.UIGradient_3.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
    tbl.UIGradient_3.Rotation = -90
    tbl.UIGradient_3.Parent = tbl.CloudBtn

    tbl.Icon_4.ImageColor3 = Color3.fromRGB(201, 205, 210)
    tbl.Icon_4.SizeConstraint = Enum.SizeConstraint.RelativeXX
    tbl.Icon_4.BorderSizePixel = 0
    tbl.Icon_4.ScaleType = Enum.ScaleType.Fit
    tbl.Icon_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Icon_4.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Icon_4.Image = "rbxassetid://15982538173"
    tbl.Icon_4.Size = UDim2.new(0.858703, 0, 0.887424, 0)
    tbl.Icon_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Icon_4.Name = "Icon"
    tbl.Icon_4.BackgroundTransparency = 1
    tbl.Icon_4.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Icon_4.Parent = tbl.CloudBtn

    tbl.UIStroke_2.Thickness = 2
    tbl.UIStroke_2.Color = Color3.fromRGB(121, 133, 167)
    tbl.UIStroke_2.Parent = tbl.CloudBtn

    tbl.UICorner_4.CornerRadius = UDim.new(0.14, 0)
    tbl.UICorner_4.Parent = tbl.CloudBtn

    tbl.SettingsBtn.BorderSizePixel = 3
    tbl.SettingsBtn.ScaleType = Enum.ScaleType.Fit
    tbl.SettingsBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.SettingsBtn.BorderMode = Enum.BorderMode.Inset
    tbl.SettingsBtn.Selectable = false
    tbl.SettingsBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.SettingsBtn.Size = UDim2.new(0.12, 0, 0.8, 0)
    tbl.SettingsBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.SettingsBtn.Name = "SettingsBtn"
    tbl.SettingsBtn.Position = UDim2.new(0.406853, 0, 0.5, 0)
    tbl.SettingsBtn.Parent = tbl.MenuList

    tbl.UIGradient_4.Color = ColorSequence.new{ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 64, 84)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 82, 107)) }
    tbl.UIGradient_4.Rotation = -90
    tbl.UIGradient_4.Parent = tbl.SettingsBtn

    tbl.Icon_5.ImageColor3 = Color3.fromRGB(201, 205, 210)
    tbl.Icon_5.SizeConstraint = Enum.SizeConstraint.RelativeXX
    tbl.Icon_5.BorderSizePixel = 0
    tbl.Icon_5.ScaleType = Enum.ScaleType.Fit
    tbl.Icon_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Icon_5.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Icon_5.Image = "rbxassetid://15845262087"
    tbl.Icon_5.Size = UDim2.new(0.858703, 0, 0.887424, 0)
    tbl.Icon_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Icon_5.Name = "Icon"
    tbl.Icon_5.BackgroundTransparency = 1
    tbl.Icon_5.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Icon_5.Parent = tbl.SettingsBtn

    tbl.UIStroke_3.Thickness = 2
    tbl.UIStroke_3.Color = Color3.fromRGB(121, 133, 167)
    tbl.UIStroke_3.Parent = tbl.SettingsBtn

    tbl.UICorner_5.CornerRadius = UDim.new(0.14, 0)
    tbl.UICorner_5.Parent = tbl.SettingsBtn

    tbl.UICorner_6.CornerRadius = UDim.new(0.08, 0)
    tbl.UICorner_6.Parent = tbl.BottomMenuFrame

    tbl.logFrame.Active = true
    tbl.logFrame.BorderSizePixel = 0
    tbl.logFrame.Size = UDim2.new(0.95, 0, 0.649, 0)
    tbl.logFrame.Position = UDim2.new(0.024, 0, 0.09, 0)
    tbl.logFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.logFrame.Visible = false
    tbl.logFrame.Name = "logFrame"
    tbl.logFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.logFrame.Parent = tbl.MainFrame

    tbl.UICorner_7.CornerRadius = UDim.new(0.02, 0)
    tbl.UICorner_7.Parent = tbl.logFrame

    tbl.logButtons.BorderSizePixel = 0
    tbl.logButtons.Size = UDim2.new(0.9059, 0, 0.120071, 0)
    tbl.logButtons.Position = UDim2.new(0.0879368, 0, 0.878761, 0)
    tbl.logButtons.BackgroundTransparency = 1
    tbl.logButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.logButtons.Name = "logButtons"
    tbl.logButtons.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    tbl.logButtons.Parent = tbl.logFrame

    tbl.logOutput.BorderSizePixel = 0
    tbl.logOutput.Size = UDim2.new(0.110762, 0, 1, 0)
    tbl.logOutput.BackgroundTransparency = 1
    tbl.logOutput.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.logOutput.ClipsDescendants = true
    tbl.logOutput.Name = "logOutput"
    tbl.logOutput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.logOutput.Parent = tbl.logButtons

    tbl.Button_1.ZIndex = 2
    tbl.Button_1.ScaleType = Enum.ScaleType.Fit
    tbl.Button_1.Image = "rbxassetid://3926305904"
    tbl.Button_1.ImageRectSize = Vector2.new(36, 36)
    tbl.Button_1.Size = UDim2.new(0.23, 0, 1, 0)
    tbl.Button_1.Name = "Button"
    tbl.Button_1.LayoutOrder = 7
    tbl.Button_1.BackgroundTransparency = 1
    tbl.Button_1.Position = UDim2.new(0, 0, 5.09924e-07, 0)
    tbl.Button_1.ImageRectOffset = Vector2.new(724, 724)
    tbl.Button_1.Parent = tbl.logOutput

    tbl.TextLabel.TextWrapped = true
    tbl.TextLabel.BorderSizePixel = 0
    tbl.TextLabel.TextScaled = true
    tbl.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.TextLabel.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextLabel.TextSize = 14
    tbl.TextLabel.Size = UDim2.new(0.728848, 0, 0.568112, 0)
    tbl.TextLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
    tbl.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextLabel.Text = "Log Output"
    tbl.TextLabel.Position = UDim2.new(0.26, 0, 0.215944, 0)
    tbl.TextLabel.BackgroundTransparency = 1
    tbl.TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    tbl.TextLabel.Parent = tbl.logOutput

    tbl.UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    tbl.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    tbl.UIListLayout.Padding = UDim.new(0.03, 0)
    tbl.UIListLayout.ItemLineAlignment = Enum.ItemLineAlignment.Center
    tbl.UIListLayout.Parent = tbl.logOutput

    tbl.UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
    tbl.UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center
    tbl.UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
    tbl.UIListLayout_1.Padding = UDim.new(0.015, 0)
    tbl.UIListLayout_1.Parent = tbl.logButtons

    tbl.logWarning.BorderSizePixel = 0
    tbl.logWarning.Size = UDim2.new(0.133679, 0, 1, 0)
    tbl.logWarning.Position = UDim2.new(0.125762, 0, 0, 0)
    tbl.logWarning.BackgroundTransparency = 1
    tbl.logWarning.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.logWarning.ClipsDescendants = true
    tbl.logWarning.Name = "logWarning"
    tbl.logWarning.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.logWarning.Parent = tbl.logButtons

    tbl.Button_2.ZIndex = 2
    tbl.Button_2.ScaleType = Enum.ScaleType.Fit
    tbl.Button_2.Image = "rbxassetid://3926305904"
    tbl.Button_2.ImageRectSize = Vector2.new(36, 36)
    tbl.Button_2.Size = UDim2.new(0.206312, 0, 1, 0)
    tbl.Button_2.Name = "Button"
    tbl.Button_2.LayoutOrder = 7
    tbl.Button_2.BackgroundTransparency = 1
    tbl.Button_2.Position = UDim2.new(0, 0, 5.09924e-07, 0)
    tbl.Button_2.ImageRectOffset = Vector2.new(724, 724)
    tbl.Button_2.Parent = tbl.logWarning

    tbl.TextLabel_1.TextWrapped = true
    tbl.TextLabel_1.BorderSizePixel = 0
    tbl.TextLabel_1.TextScaled = true
    tbl.TextLabel_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.TextLabel_1.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextLabel_1.TextSize = 14
    tbl.TextLabel_1.Size = UDim2.new(0.74, 0, 0.568112, 0)
    tbl.TextLabel_1.TextColor3 = Color3.fromRGB(225, 225, 225)
    tbl.TextLabel_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextLabel_1.Text = "Log Warning	"
    tbl.TextLabel_1.Position = UDim2.new(0.26, 0, 0.215944, 0)
    tbl.TextLabel_1.BackgroundTransparency = 1
    tbl.TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left
    tbl.TextLabel_1.Parent = tbl.logWarning

    tbl.UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
    tbl.UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
    tbl.UIListLayout_2.Padding = UDim.new(0.03, 0)
    tbl.UIListLayout_2.ItemLineAlignment = Enum.ItemLineAlignment.Center
    tbl.UIListLayout_2.Parent = tbl.logWarning

    tbl.logError.BorderSizePixel = 0
    tbl.logError.Size = UDim2.new(0.110762, 0, 1, 0)
    tbl.logError.BackgroundTransparency = 1
    tbl.logError.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.logError.ClipsDescendants = true
    tbl.logError.Name = "logError"
    tbl.logError.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.logError.Parent = tbl.logButtons

    tbl.Button_3.ZIndex = 2
    tbl.Button_3.ScaleType = Enum.ScaleType.Fit
    tbl.Button_3.Image = "rbxassetid://3926305904"
    tbl.Button_3.ImageRectSize = Vector2.new(36, 36)
    tbl.Button_3.Size = UDim2.new(0.23, 0, 1, 0)
    tbl.Button_3.Name = "Button"
    tbl.Button_3.LayoutOrder = 7
    tbl.Button_3.BackgroundTransparency = 1
    tbl.Button_3.Position = UDim2.new(0, 0, 5.09924e-07, 0)
    tbl.Button_3.ImageRectOffset = Vector2.new(724, 724)
    tbl.Button_3.Parent = tbl.logError

    tbl.TextLabel_2.TextWrapped = true
    tbl.TextLabel_2.BorderSizePixel = 0
    tbl.TextLabel_2.TextScaled = true
    tbl.TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextLabel_2.TextSize = 14
    tbl.TextLabel_2.Size = UDim2.new(0.728848, 0, 0.41773, 0)
    tbl.TextLabel_2.TextColor3 = Color3.fromRGB(225, 225, 225)
    tbl.TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextLabel_2.Text = "Log Error"
    tbl.TextLabel_2.Position = UDim2.new(0.26, 0, 0.366327, 0)
    tbl.TextLabel_2.BackgroundTransparency = 1
    tbl.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
    tbl.TextLabel_2.Parent = tbl.logError

    tbl.UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
    tbl.UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center
    tbl.UIListLayout_3.Padding = UDim.new(0.03, 0)
    tbl.UIListLayout_3.ItemLineAlignment = Enum.ItemLineAlignment.Center
    tbl.UIListLayout_3.Parent = tbl.logError

    tbl.logInfo.BorderSizePixel = 0
    tbl.logInfo.Size = UDim2.new(0.110762, 0, 1, 0)
    tbl.logInfo.BackgroundTransparency = 1
    tbl.logInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.logInfo.ClipsDescendants = true
    tbl.logInfo.Name = "logInfo"
    tbl.logInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.logInfo.Parent = tbl.logButtons

    tbl.Button_4.ZIndex = 2
    tbl.Button_4.ScaleType = Enum.ScaleType.Fit
    tbl.Button_4.Image = "rbxassetid://3926305904"
    tbl.Button_4.ImageRectSize = Vector2.new(36, 36)
    tbl.Button_4.Size = UDim2.new(0.23, 0, 1, 0)
    tbl.Button_4.Name = "Button"
    tbl.Button_4.LayoutOrder = 7
    tbl.Button_4.BackgroundTransparency = 1
    tbl.Button_4.Position = UDim2.new(0, 0, 5.09924e-07, 0)
    tbl.Button_4.ImageRectOffset = Vector2.new(724, 724)
    tbl.Button_4.Parent = tbl.logInfo

    tbl.TextLabel_3.TextWrapped = true
    tbl.TextLabel_3.BorderSizePixel = 0
    tbl.TextLabel_3.TextScaled = true
    tbl.TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextLabel_3.TextSize = 14
    tbl.TextLabel_3.Size = UDim2.new(0.728848, 0, 0.384311, 0)
    tbl.TextLabel_3.TextColor3 = Color3.fromRGB(225, 225, 225)
    tbl.TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextLabel_3.Text = "Log Info"
    tbl.TextLabel_3.Position = UDim2.new(0.26, 0, 0.399745, 0)
    tbl.TextLabel_3.BackgroundTransparency = 1
    tbl.TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
    tbl.TextLabel_3.Parent = tbl.logInfo

    tbl.UIListLayout_4.FillDirection = Enum.FillDirection.Horizontal
    tbl.UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Center
    tbl.UIListLayout_4.Padding = UDim.new(0.03, 0)
    tbl.UIListLayout_4.ItemLineAlignment = Enum.ItemLineAlignment.Center
    tbl.UIListLayout_4.Parent = tbl.logInfo

    tbl.cclrbtn.BorderSizePixel = 3
    tbl.cclrbtn.ScaleType = Enum.ScaleType.Fit
    tbl.cclrbtn.AutoButtonColor = false
    tbl.cclrbtn.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    tbl.cclrbtn.BorderMode = Enum.BorderMode.Inset
    tbl.cclrbtn.Selectable = false
    tbl.cclrbtn.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.cclrbtn.Size = UDim2.new(0.153167, 0, 0.784056, 0)
    tbl.cclrbtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.cclrbtn.Name = "cclrbtn"
    tbl.cclrbtn.Position = UDim2.new(0.60255, 0, 0.392027, 0)
    tbl.cclrbtn.Parent = tbl.logButtons

    tbl.Title.TextWrapped = true
    tbl.Title.BorderSizePixel = 0
    tbl.Title.TextScaled = true
    tbl.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title.TextSize = 14
    tbl.Title.Name = "Title"
    tbl.Title.Size = UDim2.new(0.602599, 0, 0.475464, 0)
    tbl.Title.TextColor3 = Color3.fromRGB(250, 250, 250)
    tbl.Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title.Text = "Clear Logs"
    tbl.Title.Position = UDim2.new(0.494504, 0, 0.5, 0)
    tbl.Title.BackgroundTransparency = 1
    tbl.Title.Parent = tbl.cclrbtn

    tbl.UICorner_8.CornerRadius = UDim.new(0.08, 0)
    tbl.UICorner_8.Parent = tbl.cclrbtn

    tbl.UIStroke_4.LineJoinMode = Enum.LineJoinMode.Miter
    tbl.UIStroke_4.Thickness = 3
    tbl.UIStroke_4.Color = Color3.fromRGB(60, 66, 83)
    tbl.UIStroke_4.Enabled = false
    tbl.UIStroke_4.Parent = tbl.cclrbtn

    tbl.TextLabel_4.TextWrapped = true
    tbl.TextLabel_4.BorderSizePixel = 0
    tbl.TextLabel_4.TextScaled = true
    tbl.TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextLabel_4.TextSize = 14
    tbl.TextLabel_4.Size = UDim2.new(0.300339, 0, 0.492921, 0)
    tbl.TextLabel_4.TextColor3 = Color3.fromRGB(225, 225, 225)
    tbl.TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextLabel_4.Text = "Note: There is like 280 line limit on roblox :/"
    tbl.TextLabel_4.Position = UDim2.new(0.694134, 0, 0.291135, 0)
    tbl.TextLabel_4.BackgroundTransparency = 1
    tbl.TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
    tbl.TextLabel_4.Parent = tbl.logButtons

    tbl.consoleFrame.BorderSizePixel = 0
    tbl.consoleFrame.CanvasSize = UDim2.new(0, 0, 0.87, 0)
    tbl.consoleFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    tbl.consoleFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tbl.consoleFrame.Size = UDim2.new(0.975214, 0, 0.853, 0)
    tbl.consoleFrame.BackgroundTransparency = 1
    tbl.consoleFrame.Active = true
    tbl.consoleFrame.ScrollBarImageTransparency = 0.8
    tbl.consoleFrame.ScrollBarThickness = 10
    tbl.consoleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.consoleFrame.Name = "consoleFrame"
    tbl.consoleFrame.Position = UDim2.new(0.0167858, 0, 0.0257617, 0)
    tbl.consoleFrame.Parent = tbl.logFrame

    tbl.GlobalLog.Name = "GlobalLog"
    tbl.GlobalLog.Parent = tbl.consoleFrame

    tbl.TextBox.BorderSizePixel = 0
    tbl.TextBox.RichText = true
    tbl.TextBox.TextYAlignment = Enum.TextYAlignment.Top
    tbl.TextBox.BackgroundColor3 = Color3.fromRGB(39, 53, 255)
    tbl.TextBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextBox.TextStrokeColor3 = Color3.fromRGB(211, 211, 211)
    tbl.TextBox.TextSize = 26
    tbl.TextBox.Name = "TextBox"
    tbl.TextBox.AutomaticSize = Enum.AutomaticSize.Y
    tbl.TextBox.Size = UDim2.new(1, 0, 1, 0)
    tbl.TextBox.TextColor3 = Color3.fromRGB(211, 211, 211)
    tbl.TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextBox.Text = ""
    tbl.TextBox.LineHeight = 1.3
    tbl.TextBox.BackgroundTransparency = 1
    tbl.TextBox.TextXAlignment = Enum.TextXAlignment.Left
    tbl.TextBox.Parent = tbl.consoleFrame

    tbl.SettingsFrame.Active = true
    tbl.SettingsFrame.BorderSizePixel = 0
    tbl.SettingsFrame.Size = UDim2.new(0.95, 0, 0.649, 0)
    tbl.SettingsFrame.Position = UDim2.new(0.024, 0, 0.09, 0)
    tbl.SettingsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.SettingsFrame.Visible = false
    tbl.SettingsFrame.Name = "SettingsFrame"
    tbl.SettingsFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.SettingsFrame.Parent = tbl.MainFrame

    tbl.UICorner_9.CornerRadius = UDim.new(0.02, 0)
    tbl.UICorner_9.Parent = tbl.SettingsFrame

    tbl.sample.BorderSizePixel = 0
    tbl.sample.Size = UDim2.new(0.939366, 0, 0.171716, 0)
    tbl.sample.Position = UDim2.new(0.0299999, 0, 0.0520692, 0)
    tbl.sample.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.sample.Name = "sample"
    tbl.sample.BackgroundColor3 = Color3.fromRGB(30, 34, 42)
    tbl.sample.Parent = tbl.SettingsFrame

    tbl.UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Right
    tbl.UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
    tbl.UIListLayout_5.Padding = UDim.new(0.1, 0)
    tbl.UIListLayout_5.Parent = tbl.sample

    tbl.UICorner_10.CornerRadius = UDim.new(0.1, 0)
    tbl.UICorner_10.Parent = tbl.sample

    tbl.Title_1.TextWrapped = true
    tbl.Title_1.BorderSizePixel = 0
    tbl.Title_1.TextScaled = true
    tbl.Title_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_1.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title_1.TextSize = 100
    tbl.Title_1.Name = "Title"
    tbl.Title_1.Size = UDim2.new(0.895877, 0, 0, 0)
    tbl.Title_1.TextColor3 = Color3.fromRGB(250, 250, 250)
    tbl.Title_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_1.Text = ""
    tbl.Title_1.Position = UDim2.new(0.552062, 0, 0, 0)
    tbl.Title_1.BackgroundTransparency = 1
    tbl.Title_1.TextXAlignment = Enum.TextXAlignment.Left
    tbl.Title_1.Parent = tbl.sample

    tbl.Title_2.TextWrapped = true
    tbl.Title_2.BorderSizePixel = 0
    tbl.Title_2.TextScaled = true
    tbl.Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_2.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title_2.TextSize = 100
    tbl.Title_2.Name = "Title"
    tbl.Title_2.Size = UDim2.new(0.909815, 0, 0.349235, 0)
    tbl.Title_2.TextColor3 = Color3.fromRGB(250, 250, 250)
    tbl.Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_2.Text = "Enable Trigon Desktop Connection"
    tbl.Title_2.Position = UDim2.new(0.545092, 0, 0.274617, 0)
    tbl.Title_2.BackgroundTransparency = 1
    tbl.Title_2.TextXAlignment = Enum.TextXAlignment.Left
    tbl.Title_2.Parent = tbl.sample

    tbl.Title_3.TextWrapped = true
    tbl.Title_3.BorderSizePixel = 0
    tbl.Title_3.TextScaled = true
    tbl.Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_3.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_3.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title_3.TextSize = 100
    tbl.Title_3.Name = "Title"
    tbl.Title_3.Size = UDim2.new(0.909815, 0, 0.273333, 0)
    tbl.Title_3.TextColor3 = Color3.fromRGB(250, 250, 250)
    tbl.Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_3.Text = "{comming soon}"
    tbl.Title_3.Position = UDim2.new(0.545092, 0, 0.685901, 0)
    tbl.Title_3.BackgroundTransparency = 1
    tbl.Title_3.TextXAlignment = Enum.TextXAlignment.Left
    tbl.Title_3.Parent = tbl.sample

    tbl.ImageLabel.BorderSizePixel = 0
    tbl.ImageLabel.ScaleType = Enum.ScaleType.Fit
    tbl.ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.ImageLabel.Image = "rbxassetid://15865858307"
    tbl.ImageLabel.Size = UDim2.new(0.0631573, 0, 0.173628, 0)
    tbl.ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ImageLabel.BackgroundTransparency = 1
    tbl.ImageLabel.Position = UDim2.new(0.0408212, 0, 0.0501573, 0)
    tbl.ImageLabel.Parent = tbl.SettingsFrame

    tbl.homeFrame.Active = true
    tbl.homeFrame.BorderSizePixel = 0
    tbl.homeFrame.Size = UDim2.new(0.949745, 0, 0.646527, 0)
    tbl.homeFrame.Position = UDim2.new(0.0244645, 0, 0.0897571, 0)
    tbl.homeFrame.BackgroundTransparency = 0.45
    tbl.homeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.homeFrame.ClipsDescendants = true
    tbl.homeFrame.Name = "homeFrame"
    tbl.homeFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.homeFrame.Parent = tbl.MainFrame

    tbl.UICorner_11.CornerRadius = UDim.new(0.02, 0)
    tbl.UICorner_11.Parent = tbl.homeFrame

    tbl.changelogFrame.BorderSizePixel = 0
    tbl.changelogFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
    tbl.changelogFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.changelogFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tbl.changelogFrame.Size = UDim2.new(0.209419, 0, 1.00031, 0)
    tbl.changelogFrame.BackgroundTransparency = 0.35
    tbl.changelogFrame.Active = true
    tbl.changelogFrame.ScrollBarImageTransparency = 0.64
    tbl.changelogFrame.ScrollBarThickness = 5
    tbl.changelogFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.changelogFrame.Name = "changelogFrame"
    tbl.changelogFrame.Position = UDim2.new(0.00924501, 0, 0, 0)
    tbl.changelogFrame.Parent = tbl.homeFrame

    tbl.ScriptBox.TextWrapped = true
    tbl.ScriptBox.LineHeight = 1.41
    tbl.ScriptBox.BorderSizePixel = 0
    tbl.ScriptBox.RichText = true
    tbl.ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
    tbl.ScriptBox.BackgroundColor3 = Color3.fromRGB(75, 0, 0)
    tbl.ScriptBox.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.ScriptBox.Position = UDim2.new(0.0470594, 0, 0.0200526, 0)
    tbl.ScriptBox.BackgroundTransparency = 1
    tbl.ScriptBox.AutomaticSize = Enum.AutomaticSize.Y
    tbl.ScriptBox.TextSize = 22
    tbl.ScriptBox.ClipsDescendants = true
    tbl.ScriptBox.Size = UDim2.new(0.952941, 0, 0.982121, 0)
    tbl.ScriptBox.TextColor3 = Color3.fromRGB(150, 150, 150)
    tbl.ScriptBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ScriptBox_1.Text = "~~ Changelog v0.02 ~~\n    + Added changelog\n    + Added game script section (will be adding different game scripts soon)\n    + Added Console Logging\n\n~~ Changelog v0.01 ~~\n- Tridog release :o"
    tbl.ScriptBox.MultiLine = true
    tbl.ScriptBox.CursorPosition = -1
    tbl.ScriptBox.Name = "ScriptBox"
    tbl.ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
    tbl.ScriptBox.ClearTextOnFocus = false
    tbl.ScriptBox.Parent = tbl.changelogFrame

    tbl.UICorner_12.CornerRadius = UDim.new(1, 0)
    tbl.UICorner_12.Parent = tbl.changelogFrame

    tbl.UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
    tbl.UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
    tbl.UIListLayout_6.Padding = UDim.new(0.018, 0)
    tbl.UIListLayout_6.Parent = tbl.homeFrame

    tbl.scriptsFrame.BorderSizePixel = 0
    tbl.scriptsFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
    tbl.scriptsFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.scriptsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tbl.scriptsFrame.Size = UDim2.new(0.467, 0, 1, 0)
    tbl.scriptsFrame.BackgroundTransparency = 0.35
    tbl.scriptsFrame.Active = true
    tbl.scriptsFrame.ScrollBarImageTransparency = 0.64
    tbl.scriptsFrame.ScrollBarThickness = 5
    tbl.scriptsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.scriptsFrame.Name = "scriptsFrame"
    tbl.scriptsFrame.Position = UDim2.new(-0.0123267, 0, -0.0421236, 0)
    tbl.scriptsFrame.Parent = tbl.homeFrame

    tbl.UICorner_13.CornerRadius = UDim.new(1, 0)
    tbl.UICorner_13.Parent = tbl.scriptsFrame

    tbl.UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tbl.UIListLayout_7.Padding = UDim.new(0.01, 0)
    tbl.UIListLayout_7.Parent = tbl.scriptsFrame

    tbl._GameHeader.BorderSizePixel = 0
    tbl._GameHeader.Size = UDim2.new(1, 0, 0.157089, 0)
    tbl._GameHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl._GameHeader.Name = "#GameHeader"
    tbl._GameHeader.BackgroundColor3 = Color3.fromRGB(35, 39, 49)
    tbl._GameHeader.Parent = tbl.scriptsFrame

    tbl.Title_4.TextWrapped = true
    tbl.Title_4.BorderSizePixel = 0
    tbl.Title_4.TextScaled = true
    tbl.Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_4.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_4.TextSize = 14
    tbl.Title_4.Name = "Title"
    tbl.Title_4.Size = UDim2.new(0.998909, 0, 0.572671, 0)
    tbl.Title_4.TextColor3 = Color3.fromRGB(180, 193, 216)
    tbl.Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_4.Text = "{game_name}"
    tbl.Title_4.Position = UDim2.new(0, 0, 0.2, 0)
    tbl.Title_4.BackgroundTransparency = 1
    tbl.Title_4.Parent = tbl._GameHeader

    tbl.UICorner_14.CornerRadius = UDim.new(0.1, 0)
    tbl.UICorner_14.Parent = tbl._GameHeader

    tbl.TextButton.TextWrapped = true
    tbl.TextButton.Active = false
    tbl.TextButton.BorderSizePixel = 0
    tbl.TextButton.BackgroundColor3 = Color3.fromRGB(55, 60, 76)
    tbl.TextButton.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.TextButton.Position = UDim2.new(0.0264026, 0, 0.157089, 0)
    tbl.TextButton.TextSize = 16
    tbl.TextButton.Size = UDim2.new(0.950495, 0, 0.1, 0)
    tbl.TextButton.TextColor3 = Color3.fromRGB(180, 193, 216)
    tbl.TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.TextButton.Text = "No scripts found for this game..."
    tbl.TextButton.Parent = tbl.scriptsFrame

    tbl.UICorner_15.CornerRadius = UDim.new(0.1, 0)
    tbl.UICorner_15.Parent = tbl.TextButton

    tbl.localplrFrame.BorderSizePixel = 0
    tbl.localplrFrame.Size = UDim2.new(0.287, 0, 1, 0)
    tbl.localplrFrame.Position = UDim2.new(0.209419, 0, 3.06074e-08, 0)
    tbl.localplrFrame.BackgroundTransparency = 0.4
    tbl.localplrFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.localplrFrame.Visible = false
    tbl.localplrFrame.Name = "localplrFrame"
    tbl.localplrFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.localplrFrame.Parent = tbl.homeFrame

    tbl.UIListLayout_8.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tbl.UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
    tbl.UIListLayout_8.Padding = UDim.new(0.01, 0)
    tbl.UIListLayout_8.Parent = tbl.localplrFrame

    tbl.Header.BorderSizePixel = 0
    tbl.Header.Size = UDim2.new(1, 0, 0.157089, 0)
    tbl.Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Header.Name = "Header"
    tbl.Header.BackgroundColor3 = Color3.fromRGB(35, 39, 49)
    tbl.Header.Parent = tbl.localplrFrame

    tbl.Title_5.TextWrapped = true
    tbl.Title_5.BorderSizePixel = 0
    tbl.Title_5.TextScaled = true
    tbl.Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_5.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_5.TextSize = 14
    tbl.Title_5.Name = "Title"
    tbl.Title_5.Size = UDim2.new(0.998909, 0, 0.572671, 0)
    tbl.Title_5.TextColor3 = Color3.fromRGB(180, 193, 216)
    tbl.Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_5.Text = "Local Player"
    tbl.Title_5.Position = UDim2.new(0, 0, 0.2, 0)
    tbl.Title_5.BackgroundTransparency = 1
    tbl.Title_5.Parent = tbl.Header

    tbl.UICorner_16.CornerRadius = UDim.new(0.1, 0)
    tbl.UICorner_16.Parent = tbl.Header

    tbl.walkspeed.BorderSizePixel = 0
    tbl.walkspeed.Size = UDim2.new(0.912001, 0, 0.127863, 0)
    tbl.walkspeed.Position = UDim2.new(0.00907725, 0, 0.167089, 0)
    tbl.walkspeed.BackgroundTransparency = 1
    tbl.walkspeed.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.walkspeed.Name = "walkspeed"
    tbl.walkspeed.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    tbl.walkspeed.Parent = tbl.localplrFrame

    tbl.Slider.BorderSizePixel = 0
    tbl.Slider.Size = UDim2.new(0.944831, 0, 0.393775, 0)
    tbl.Slider.Position = UDim2.new(0.0289786, 0, 0.594506, 0)
    tbl.Slider.BackgroundTransparency = 1
    tbl.Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Slider.Name = "Slider"
    tbl.Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Slider:SetAttribute("ColorEnabled1", Color3.fromRGB(231, 174, 174))
    tbl.Slider:SetAttribute("ColorEnabled2", Color3.fromRGB(156, 19, 19))
    tbl.Slider:SetAttribute("IsEnabled", true)
    tbl.Slider:SetAttribute("ColorDisabled1", Color3.fromRGB(202, 202, 202))
    tbl.Slider:SetAttribute("ColorDisabled2", Color3.fromRGB(158, 158, 158))
    tbl.Slider:SetAttribute("ValuePercent", 50)
    tbl.Slider:SetAttribute("ValueIncrement", 1)
    tbl.Slider.Parent = tbl.walkspeed

    tbl.Image.BorderSizePixel = 0
    tbl.Image.Size = UDim2.new(1, 0, 1, 0)
    tbl.Image.BackgroundTransparency = 1
    tbl.Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Image.Name = "Image"
    tbl.Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Image.Parent = tbl.Slider

    tbl.Bar_Background.AnchorPoint = Vector2.new(0, 0.5)
    tbl.Bar_Background.BorderSizePixel = 0
    tbl.Bar_Background.Size = UDim2.new(1, 0, 0.15, 0)
    tbl.Bar_Background.Position = UDim2.new(0, 0, 0.5, 0)
    tbl.Bar_Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Bar_Background.Name = "Bar-Background"
    tbl.Bar_Background.BackgroundColor3 = Color3.fromRGB(101, 112, 141)
    tbl.Bar_Background.Parent = tbl.Image

    tbl.UICorner_17.CornerRadius = UDim.new(0.5, 0)
    tbl.UICorner_17.Parent = tbl.Bar_Background

    tbl.Bar_Foreground.AnchorPoint = Vector2.new(0, 0.5)
    tbl.Bar_Foreground.ZIndex = 2
    tbl.Bar_Foreground.BorderSizePixel = 0
    tbl.Bar_Foreground.Size = UDim2.new(0.5, 0, 0.3, 0)
    tbl.Bar_Foreground.Position = UDim2.new(0, 0, 0.5, 0)
    tbl.Bar_Foreground.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Bar_Foreground.Name = "Bar-Foreground"
    tbl.Bar_Foreground.BackgroundColor3 = Color3.fromRGB(65, 68, 91)
    tbl.Bar_Foreground.Parent = tbl.Image

    tbl.UICorner_18.CornerRadius = UDim.new(0.5, 0)
    tbl.UICorner_18.Parent = tbl.Bar_Foreground

    tbl.Thumb.ImageColor3 = Color3.fromRGB(65, 68, 91)
    tbl.Thumb.ZIndex = 3
    tbl.Thumb.BorderSizePixel = 0
    tbl.Thumb.ScaleType = Enum.ScaleType.Fit
    tbl.Thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Thumb.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Thumb.Image = "rbxassetid://11953889677"
    tbl.Thumb.Size = UDim2.new(0.0778816, 0, 1, 0)
    tbl.Thumb.Name = "Thumb"
    tbl.Thumb.BackgroundTransparency = 1
    tbl.Thumb.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Thumb:SetAttribute("IsDragging", false)
    tbl.Thumb.Parent = tbl.Image

    tbl.UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
    tbl.UIAspectRatioConstraint.Parent = tbl.Thumb

    tbl.Thumb_Pressed.ImageColor3 = Color3.fromRGB(65, 68, 91)
    tbl.Thumb_Pressed.BorderSizePixel = 0
    tbl.Thumb_Pressed.ScaleType = Enum.ScaleType.Fit
    tbl.Thumb_Pressed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Thumb_Pressed.ImageTransparency = 0.8
    tbl.Thumb_Pressed.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Thumb_Pressed.Image = "rbxassetid://11953889677"
    tbl.Thumb_Pressed.Size = UDim2.new(2, 0, 2, 0)
    tbl.Thumb_Pressed.Name = "Thumb-Pressed"
    tbl.Thumb_Pressed.BackgroundTransparency = 1
    tbl.Thumb_Pressed.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Thumb_Pressed.Visible = false
    tbl.Thumb_Pressed.Parent = tbl.Thumb

    tbl.Configuration.Parent = tbl.Slider

    tbl.ObjectBarBackground.Name = "ObjectBarBackground"
    tbl.ObjectBarBackground.Parent = tbl.Configuration

    tbl.ObjectBarForeground.Name = "ObjectBarForeground"
    tbl.ObjectBarForeground.Parent = tbl.Configuration

    tbl.ObjectThumbNormal.Name = "ObjectThumbNormal"
    tbl.ObjectThumbNormal.Parent = tbl.Configuration

    tbl.ObjectThumbPressed.Name = "ObjectThumbPressed"
    tbl.ObjectThumbPressed.Parent = tbl.Configuration

    tbl.Title_6.TextWrapped = true
    tbl.Title_6.BorderSizePixel = 0
    tbl.Title_6.TextScaled = true
    tbl.Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_6.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_6.TextSize = 14
    tbl.Title_6.Name = "Title"
    tbl.Title_6.Size = UDim2.new(0.998909, 0, 0.527078, 0)
    tbl.Title_6.TextColor3 = Color3.fromRGB(180, 193, 216)
    tbl.Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_6.Text = "Walk Speed Modified: 0"
    tbl.Title_6.Position = UDim2.new(0.00612932, 0, -0.013275, 0)
    tbl.Title_6.BackgroundTransparency = 1
    tbl.Title_6.Parent = tbl.walkspeed

    tbl.jumspeed.BorderSizePixel = 0
    tbl.jumspeed.Size = UDim2.new(0.912001, 0, 0.127863, 0)
    tbl.jumspeed.Position = UDim2.new(0.00907725, 0, 0.167089, 0)
    tbl.jumspeed.BackgroundTransparency = 1
    tbl.jumspeed.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.jumspeed.Name = "jumspeed"
    tbl.jumspeed.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    tbl.jumspeed.Parent = tbl.localplrFrame

    tbl.Slider_1.BorderSizePixel = 0
    tbl.Slider_1.Size = UDim2.new(0.944831, 0, 0.393775, 0)
    tbl.Slider_1.Position = UDim2.new(0.0289786, 0, 0.594506, 0)
    tbl.Slider_1.BackgroundTransparency = 1
    tbl.Slider_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Slider_1.Name = "Slider"
    tbl.Slider_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Slider_1:SetAttribute("ColorEnabled1", Color3.fromRGB(231, 174, 174))
    tbl.Slider_1:SetAttribute("ColorEnabled2", Color3.fromRGB(156, 19, 19))
    tbl.Slider_1:SetAttribute("IsEnabled", true)
    tbl.Slider_1:SetAttribute("ColorDisabled1", Color3.fromRGB(202, 202, 202))
    tbl.Slider_1:SetAttribute("ColorDisabled2", Color3.fromRGB(158, 158, 158))
    tbl.Slider_1:SetAttribute("ValuePercent", 50)
    tbl.Slider_1:SetAttribute("ValueIncrement", 1)
    tbl.Slider_1.Parent = tbl.jumspeed

    tbl.Image_1.BorderSizePixel = 0
    tbl.Image_1.Size = UDim2.new(1, 0, 1, 0)
    tbl.Image_1.BackgroundTransparency = 1
    tbl.Image_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Image_1.Name = "Image"
    tbl.Image_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Image_1.Parent = tbl.Slider_1

    tbl.Bar_Background_1.AnchorPoint = Vector2.new(0, 0.5)
    tbl.Bar_Background_1.BorderSizePixel = 0
    tbl.Bar_Background_1.Size = UDim2.new(1, 0, 0.15, 0)
    tbl.Bar_Background_1.Position = UDim2.new(0, 0, 0.5, 0)
    tbl.Bar_Background_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Bar_Background_1.Name = "Bar-Background"
    tbl.Bar_Background_1.BackgroundColor3 = Color3.fromRGB(231, 174, 174)
    tbl.Bar_Background_1.Parent = tbl.Image_1

    tbl.UICorner_19.CornerRadius = UDim.new(0.5, 0)
    tbl.UICorner_19.Parent = tbl.Bar_Background_1

    tbl.Bar_Foreground_1.AnchorPoint = Vector2.new(0, 0.5)
    tbl.Bar_Foreground_1.ZIndex = 2
    tbl.Bar_Foreground_1.BorderSizePixel = 0
    tbl.Bar_Foreground_1.Size = UDim2.new(0.5, 0, 0.3, 0)
    tbl.Bar_Foreground_1.Position = UDim2.new(0, 0, 0.5, 0)
    tbl.Bar_Foreground_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Bar_Foreground_1.Name = "Bar-Foreground"
    tbl.Bar_Foreground_1.BackgroundColor3 = Color3.fromRGB(156, 19, 19)
    tbl.Bar_Foreground_1.Parent = tbl.Image_1

    tbl.UICorner_20.CornerRadius = UDim.new(0.5, 0)
    tbl.UICorner_20.Parent = tbl.Bar_Foreground_1

    tbl.Thumb_1.ImageColor3 = Color3.fromRGB(156, 19, 19)
    tbl.Thumb_1.ZIndex = 3
    tbl.Thumb_1.BorderSizePixel = 0
    tbl.Thumb_1.ScaleType = Enum.ScaleType.Fit
    tbl.Thumb_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Thumb_1.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Thumb_1.Image = "rbxassetid://11953889677"
    tbl.Thumb_1.Size = UDim2.new(0.0778816, 0, 1, 0)
    tbl.Thumb_1.Name = "Thumb"
    tbl.Thumb_1.BackgroundTransparency = 1
    tbl.Thumb_1.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Thumb_1:SetAttribute("IsDragging", false)
    tbl.Thumb_1.Parent = tbl.Image_1

    tbl.UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Height
    tbl.UIAspectRatioConstraint_1.Parent = tbl.Thumb_1

    tbl.Thumb_Pressed_1.ImageColor3 = Color3.fromRGB(156, 19, 19)
    tbl.Thumb_Pressed_1.BorderSizePixel = 0
    tbl.Thumb_Pressed_1.ScaleType = Enum.ScaleType.Fit
    tbl.Thumb_Pressed_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Thumb_Pressed_1.ImageTransparency = 0.8
    tbl.Thumb_Pressed_1.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Thumb_Pressed_1.Image = "rbxassetid://11953889677"
    tbl.Thumb_Pressed_1.Size = UDim2.new(2, 0, 2, 0)
    tbl.Thumb_Pressed_1.Name = "Thumb-Pressed"
    tbl.Thumb_Pressed_1.BackgroundTransparency = 1
    tbl.Thumb_Pressed_1.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Thumb_Pressed_1.Visible = false
    tbl.Thumb_Pressed_1.Parent = tbl.Thumb_1

    tbl.Configuration_1.Parent = tbl.Slider_1

    tbl.ObjectBarBackground_1.Name = "ObjectBarBackground"
    tbl.ObjectBarBackground_1.Parent = tbl.Configuration_1

    tbl.ObjectBarForeground_1.Name = "ObjectBarForeground"
    tbl.ObjectBarForeground_1.Parent = tbl.Configuration_1

    tbl.ObjectThumbNormal_1.Name = "ObjectThumbNormal"
    tbl.ObjectThumbNormal_1.Parent = tbl.Configuration_1

    tbl.ObjectThumbPressed_1.Name = "ObjectThumbPressed"
    tbl.ObjectThumbPressed_1.Parent = tbl.Configuration_1

    tbl.Scripts.Name = "Scripts"
    tbl.Scripts.Parent = tbl.Slider_1

    tbl.FormSliderHorizontalLocalScript.Enabled = false
    tbl.FormSliderHorizontalLocalScript.Name = "FormSliderHorizontalLocalScript"
    tbl.FormSliderHorizontalLocalScript.Disabled = true
    tbl.FormSliderHorizontalLocalScript.Parent = tbl.Scripts

    tbl.Title_7.TextWrapped = true
    tbl.Title_7.BorderSizePixel = 0
    tbl.Title_7.TextScaled = true
    tbl.Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_7.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_7.TextSize = 14
    tbl.Title_7.Name = "Title"
    tbl.Title_7.Size = UDim2.new(0.998909, 0, 0.527078, 0)
    tbl.Title_7.TextColor3 = Color3.fromRGB(180, 193, 216)
    tbl.Title_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_7.Text = "Jump Speed Modified: 0"
    tbl.Title_7.Position = UDim2.new(0.00612932, 0, -0.013275, 0)
    tbl.Title_7.BackgroundTransparency = 1
    tbl.Title_7.Parent = tbl.jumspeed

    tbl.LocalPlayerHandle.Name = "LocalPlayerHandle"
    tbl.LocalPlayerHandle.Parent = tbl.localplrFrame

    tbl.FormSliderClass.Name = "FormSliderClass"
    tbl.FormSliderClass.Parent = tbl.localplrFrame

    tbl.ExtendDraggableClass.Name = "ExtendDraggableClass"
    tbl.ExtendDraggableClass.Parent = tbl.localplrFrame

    tbl.CurPos.TextWrapped = true
    tbl.CurPos.BorderSizePixel = 0
    tbl.CurPos.TextScaled = true
    tbl.CurPos.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.CurPos.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.CurPos.TextSize = 14
    tbl.CurPos.Name = "CurPos"
    tbl.CurPos.Size = UDim2.new(0.898733, 0, 0.085544, 0)
    tbl.CurPos.TextColor3 = Color3.fromRGB(180, 193, 216)
    tbl.CurPos.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.CurPos.Text = "Current location: "
    tbl.CurPos.Position = UDim2.new(0.000272832, 0, 0.442814, 0)
    tbl.CurPos.BackgroundTransparency = 1
    tbl.CurPos.Parent = tbl.localplrFrame

    tbl.ExecFrame.Active = true
    tbl.ExecFrame.BorderSizePixel = 0
    tbl.ExecFrame.Size = UDim2.new(0.949745, 0, 0.649132, 0)
    tbl.ExecFrame.Position = UDim2.new(0.0244645, 0, 0.0897571, 0)
    tbl.ExecFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ExecFrame.Visible = false
    tbl.ExecFrame.Name = "ExecFrame"
    tbl.ExecFrame.BackgroundColor3 = Color3.fromRGB(38, 42, 53)
    tbl.ExecFrame.Parent = tbl.MainFrame

    tbl.Buttons.Active = true
    tbl.Buttons.BorderSizePixel = 0
    tbl.Buttons.Size = UDim2.new(1, 0, 0.246428, 0)
    tbl.Buttons.Position = UDim2.new(0, 0, 0.752548, 0)
    tbl.Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Buttons.Name = "Buttons"
    tbl.Buttons.BackgroundColor3 = Color3.fromRGB(31, 34, 43)
    tbl.Buttons.Parent = tbl.ExecFrame

    tbl.UIListLayout_9.FillDirection = Enum.FillDirection.Horizontal
    tbl.UIListLayout_9.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tbl.UIListLayout_9.VerticalAlignment = Enum.VerticalAlignment.Center
    tbl.UIListLayout_9.Padding = UDim.new(0.01, 0)
    tbl.UIListLayout_9.Parent = tbl.Buttons

    tbl.Button1.BorderSizePixel = 3
    tbl.Button1.ScaleType = Enum.ScaleType.Fit
    tbl.Button1.AutoButtonColor = false
    tbl.Button1.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    tbl.Button1.BorderMode = Enum.BorderMode.Inset
    tbl.Button1.Selectable = false
    tbl.Button1.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Button1.Size = UDim2.new(0.226347, 0, 0.721644, 0)
    tbl.Button1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Button1.Name = "Button1"
    tbl.Button1.Position = UDim2.new(0.145479, 0, 0.454178, 0)
    tbl.Button1.Parent = tbl.Buttons

    tbl.UIStroke_5.LineJoinMode = Enum.LineJoinMode.Miter
    tbl.UIStroke_5.Thickness = 3
    tbl.UIStroke_5.Color = Color3.fromRGB(60, 66, 83)
    tbl.UIStroke_5.Enabled = false
    tbl.UIStroke_5.Parent = tbl.Button1

    tbl.UICorner_21.CornerRadius = UDim.new(0.08, 0)
    tbl.UICorner_21.Parent = tbl.Button1

    tbl.Title_8.TextWrapped = true
    tbl.Title_8.BorderSizePixel = 0
    tbl.Title_8.TextScaled = true
    tbl.Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_8.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_8.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title_8.TextSize = 100
    tbl.Title_8.Name = "Title"
    tbl.Title_8.Size = UDim2.new(0.340682, 0, 0.729158, 0)
    tbl.Title_8.TextColor3 = Color3.fromRGB(250, 250, 250)
    tbl.Title_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_8.Text = "Execute"
    tbl.Title_8.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Title_8.BackgroundTransparency = 1
    tbl.Title_8.Parent = tbl.Button1

    tbl.Button4.BorderSizePixel = 3
    tbl.Button4.ScaleType = Enum.ScaleType.Fit
    tbl.Button4.AutoButtonColor = false
    tbl.Button4.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    tbl.Button4.BorderMode = Enum.BorderMode.Inset
    tbl.Button4.Selectable = false
    tbl.Button4.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Button4.Size = UDim2.new(0.226347, 0, 0.721644, 0)
    tbl.Button4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Button4.Name = "Button4"
    tbl.Button4.Position = UDim2.new(0.854521, 0, 0.454178, 0)
    tbl.Button4.Parent = tbl.Buttons

    tbl.Title_9.TextWrapped = true
    tbl.Title_9.BorderSizePixel = 0
    tbl.Title_9.TextScaled = true
    tbl.Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_9.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_9.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title_9.TextSize = 14
    tbl.Title_9.Name = "Title"
    tbl.Title_9.Size = UDim2.new(0.313498, 0, 0.782088, 0)
    tbl.Title_9.TextColor3 = Color3.fromRGB(250, 250, 250)
    tbl.Title_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_9.Text = "Clear"
    tbl.Title_9.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Title_9.BackgroundTransparency = 1
    tbl.Title_9.Parent = tbl.Button4

    tbl.UICorner_22.CornerRadius = UDim.new(0.08, 0)
    tbl.UICorner_22.Parent = tbl.Button4

    tbl.UIStroke_6.LineJoinMode = Enum.LineJoinMode.Miter
    tbl.UIStroke_6.Thickness = 3
    tbl.UIStroke_6.Color = Color3.fromRGB(60, 66, 83)
    tbl.UIStroke_6.Enabled = false
    tbl.UIStroke_6.Parent = tbl.Button4

    tbl.Button3.BorderSizePixel = 3
    tbl.Button3.ScaleType = Enum.ScaleType.Fit
    tbl.Button3.AutoButtonColor = false
    tbl.Button3.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    tbl.Button3.BorderMode = Enum.BorderMode.Inset
    tbl.Button3.Selectable = false
    tbl.Button3.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Button3.Size = UDim2.new(0.226347, 0, 0.721644, 0)
    tbl.Button3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Button3.Name = "Button3"
    tbl.Button3.Position = UDim2.new(0.618174, 0, 0.454178, 0)
    tbl.Button3.Parent = tbl.Buttons

    tbl.Title_10.TextWrapped = true
    tbl.Title_10.BorderSizePixel = 0
    tbl.Title_10.TextScaled = true
    tbl.Title_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_10.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_10.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title_10.TextSize = 14
    tbl.Title_10.Name = "Title"
    tbl.Title_10.Size = UDim2.new(0.347791, 0, 0.782034, 0)
    tbl.Title_10.TextColor3 = Color3.fromRGB(250, 250, 250)
    tbl.Title_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_10.Text = "Paste"
    tbl.Title_10.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Title_10.BackgroundTransparency = 1
    tbl.Title_10.Parent = tbl.Button3

    tbl.UICorner_23.CornerRadius = UDim.new(0.08, 0)
    tbl.UICorner_23.Parent = tbl.Button3

    tbl.UIStroke_7.LineJoinMode = Enum.LineJoinMode.Miter
    tbl.UIStroke_7.Thickness = 3
    tbl.UIStroke_7.Color = Color3.fromRGB(60, 66, 83)
    tbl.UIStroke_7.Enabled = false
    tbl.UIStroke_7.Parent = tbl.Button3

    tbl.Button2.BorderSizePixel = 3
    tbl.Button2.ScaleType = Enum.ScaleType.Fit
    tbl.Button2.AutoButtonColor = false
    tbl.Button2.BackgroundColor3 = Color3.fromRGB(44, 48, 61)
    tbl.Button2.BorderMode = Enum.BorderMode.Inset
    tbl.Button2.Selectable = false
    tbl.Button2.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Button2.Size = UDim2.new(0.226347, 0, 0.721644, 0)
    tbl.Button2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Button2.Name = "Button2"
    tbl.Button2.Position = UDim2.new(0.381826, 0, 0.454178, 0)
    tbl.Button2.Parent = tbl.Buttons

    tbl.Title_11.TextWrapped = true
    tbl.Title_11.BorderSizePixel = 0
    tbl.Title_11.TextScaled = true
    tbl.Title_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.Title_11.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.Title_11.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl.Title_11.TextSize = 14
    tbl.Title_11.Name = "Title"
    tbl.Title_11.Size = UDim2.new(0.730181, 0, 0.653414, 0)
    tbl.Title_11.TextColor3 = Color3.fromRGB(250, 250, 250)
    tbl.Title_11.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.Title_11.Text = "Execute from Clipboard"
    tbl.Title_11.Position = UDim2.new(0.5, 0, 0.5, 0)
    tbl.Title_11.BackgroundTransparency = 1
    tbl.Title_11.Parent = tbl.Button2

    tbl.UICorner_24.CornerRadius = UDim.new(0.08, 0)
    tbl.UICorner_24.Parent = tbl.Button2

    tbl.UIStroke_8.LineJoinMode = Enum.LineJoinMode.Miter
    tbl.UIStroke_8.Thickness = 3
    tbl.UIStroke_8.Color = Color3.fromRGB(60, 66, 83)
    tbl.UIStroke_8.Enabled = false
    tbl.UIStroke_8.Parent = tbl.Button2

    tbl.UICorner_25.CornerRadius = UDim.new(0.1, 0)
    tbl.UICorner_25.Parent = tbl.Buttons

    tbl.ScrollingFrame.BorderSizePixel = 0
    tbl.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
    tbl.ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tbl.ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tbl.ScrollingFrame.Size = UDim2.new(0.975214, 0, 0.675238, 0)
    tbl.ScrollingFrame.BackgroundTransparency = 1
    tbl.ScrollingFrame.Active = true
    tbl.ScrollingFrame.ScrollBarImageTransparency = 0.64
    tbl.ScrollingFrame.ScrollBarThickness = 18
    tbl.ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ScrollingFrame.Position = UDim2.new(0.0167858, 0, 0.0257617, 0)
    tbl.ScrollingFrame.Parent = tbl.ExecFrame

    tbl.LocalScript.Parent = tbl.ScrollingFrame

    tbl.ScriptBox_1.BorderSizePixel = 0
    tbl.ScriptBox_1.RichText = true
    tbl.ScriptBox_1.TextYAlignment = Enum.TextYAlignment.Top
    tbl.ScriptBox_1.BackgroundColor3 = Color3.fromRGB(75, 0, 0)
    tbl.ScriptBox_1.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    tbl.ScriptBox_1.BackgroundTransparency = 1
    tbl.ScriptBox_1.AutomaticSize = Enum.AutomaticSize.Y
    tbl.ScriptBox_1.TextSize = 30
    tbl.ScriptBox_1.ClipsDescendants = true
    tbl.ScriptBox_1.Size = UDim2.new(1, 0, 1, 0)
    tbl.ScriptBox_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    tbl.ScriptBox_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tbl.ScriptBox_1.Text = "-- We recommend only uisng loadstrings | Trigon Mobile v0.1 {Beta}"
    tbl.ScriptBox_1.MultiLine = true
    tbl.ScriptBox_1.Name = "ScriptBox"
    tbl.ScriptBox_1.TextXAlignment = Enum.TextXAlignment.Left
    tbl.ScriptBox_1.ClearTextOnFocus = false
    tbl.ScriptBox_1.Parent = tbl.ScrollingFrame

    tbl.Highlighter.Name = "Highlighter"
    tbl.Highlighter.Parent = tbl.ScriptBox_1

    tbl.lexer.Name = "lexer"
    tbl.lexer.Parent = tbl.Highlighter

    tbl.language.Name = "language"
    tbl.language.Parent = tbl.lexer

    tbl.theme.Name = "theme"
    tbl.theme.Parent = tbl.Highlighter

    tbl.types.Name = "types"
    tbl.types.Parent = tbl.Highlighter

    tbl.utility.Name = "utility"
    tbl.utility.Parent = tbl.Highlighter

    tbl.UICorner_26.CornerRadius = UDim.new(0.02, 0)
    tbl.UICorner_26.Parent = tbl.ExecFrame

    tbl.LocalScript_1.Parent = tbl.TrigonMain

    local modules, cache = {}, {}

    local o_require = require;
    local function require(module)
        local real, cached = modules[module], cache[module]

        if cached then return cached end

        if not real then return o_require(module) end

        cache[module] = real()

        return cache[module]
    end

    modules[tbl.FormSliderClass] = function()
        local script = tbl.FormSliderClass

    	--[[
    	
    		Copyright © 2023, MapleMarvel (https://www.roblox.com/users/263710410/profile). All Rights Reserved.
    		
    		
    		FormSliderClass:
    		Class that sets slider functionality.
    			
    	--]]


        -- Class
        local FormSliderClass = {}
        FormSliderClass.__index = FormSliderClass


        -- Constructor
        function FormSliderClass.new(paramGuiObject, paramDirection, minvalue, maxvalue)
            local self = setmetatable({}, FormSliderClass)


            -- Validate
            if paramGuiObject == nil then
                error("Required parameters missing for constructor FormSliderClass.new.")
            end

            -- Instance Properties
            self.GuiObject = paramGuiObject  -- The GuiObject extended by this class
            self.Direction = paramDirection or Enum.Axis.X  -- Slider direction
            self.Connections = {}  -- Event connections


            -- Initialize

            -- Configuration Variables
            local configuration = self.GuiObject:WaitForChild("Configuration")
            local guiObjectBarBackgroundVar = configuration:WaitForChild("ObjectBarBackground")
            local guiObjectBarForegroundVar = configuration:WaitForChild("ObjectBarForeground")
            local guiObjectThumbNormalVar = configuration:WaitForChild(("ObjectThumbNormal"))
            local guiObjectThumbPressedVar = configuration:WaitForChild(("ObjectThumbPressed"))
            local guiObjectBarBackground
            local guiObjectBarForeground
            local guiObjectThumbNormal
            local guiObjectThumbPressed

            -- Validate
            if guiObjectBarBackgroundVar and guiObjectBarForegroundVar and guiObjectThumbNormalVar and guiObjectThumbPressedVar then

                -- Wait for the objects to load
                while not guiObjectBarBackgroundVar.Value do task.wait() end
                while not guiObjectBarForegroundVar.Value do task.wait() end
                while not guiObjectThumbNormalVar.Value do task.wait() end
                while not guiObjectThumbPressedVar.Value do task.wait() end

                -- Get values
                guiObjectBarBackground = guiObjectBarBackgroundVar.Value
                guiObjectBarForeground = guiObjectBarForegroundVar.Value
                guiObjectThumbNormal = guiObjectThumbNormalVar.Value
                guiObjectThumbPressed = guiObjectThumbPressedVar.Value

            end

            -- Make thumb draggable
            local ExtendDraggableClass = require(script.Parent:WaitForChild("ExtendDraggableClass"))
            local draggableThumbNormal = ExtendDraggableClass.new(guiObjectThumbNormal, false, self.Direction)


            -- Local function
            local function RefreshGui()

                -- Get current attribute values
                local attributesParent = self.GuiObject

                local attributeIsEnabled = attributesParent:GetAttribute("IsEnabled")
                local attributeColorDisabled1 = attributesParent:GetAttribute("ColorDisabled1")
                local attributeColorDisabled2 = attributesParent:GetAttribute("ColorDisabled2")
                local attributeColorEnabled1 = attributesParent:GetAttribute("ColorEnabled1")
                local attributeColorEnabled2 = attributesParent:GetAttribute("ColorEnabled2")
                local attributeValueIncrement = attributesParent:GetAttribute(("ValueIncrement"))
                local attributeValuePercent = attributesParent:GetAttribute(("ValuePercent"))

                warn(minvalue, maxvalue)
                -- Validate
                local newValuePercent = math.clamp(attributeValuePercent, minvalue, maxvalue)
                if newValuePercent ~= attributeValuePercent then
                    attributesParent:SetAttribute("ValuePercent", newValuePercent)
                end

                -- Update slider elements
                if self.Direction == Enum.Axis.X then
                    -- Horizontal

                    -- Thumb position
                    guiObjectThumbNormal.Position = UDim2.new(newValuePercent / maxvalue, guiObjectThumbNormal.Position.X.Offset, guiObjectThumbNormal.Position.Y.Scale, guiObjectThumbNormal.Position.Y.Offset)

                    -- Foreground bar length
                    guiObjectBarForeground.Size = UDim2.new(newValuePercent / maxvalue, guiObjectBarForeground.Size.X.Offset, guiObjectBarForeground.Size.Y.Scale, guiObjectBarForeground.Size.Y.Offset)

                else
                    -- Vertical

                    -- Thumb position
                    guiObjectThumbNormal.Position = UDim2.new(guiObjectThumbNormal.Position.X.Scale, guiObjectThumbNormal.Position.X.Offset, 1 - (newValuePercent / maxvalue), guiObjectThumbNormal.Position.Y.Offset)

                    -- Foreground bar length
                    guiObjectBarForeground.Size = UDim2.new(guiObjectBarForeground.Size.X.Scale, guiObjectBarForeground.Size.X.Offset, newValuePercent / maxvalue, guiObjectBarForeground.Size.Y.Offset)

                end

                -- Dragging settings
                draggableThumbNormal:SetDraggingEnabled(attributeIsEnabled)
                draggableThumbNormal:SetDraggingIncrement(attributeValueIncrement)

                -- If enabled
                if attributeIsEnabled == true then

                    -- Enabled colors
                    guiObjectBarBackground.BackgroundColor3 = attributeColorEnabled1
                    guiObjectBarForeground.BackgroundColor3 = attributeColorEnabled2
                    guiObjectThumbNormal.ImageColor3 = attributeColorEnabled2
                    guiObjectThumbPressed.ImageColor3 = attributeColorEnabled2

                else

                    -- Disabled colors
                    guiObjectBarBackground.BackgroundColor3 = attributeColorDisabled1
                    guiObjectBarForeground.BackgroundColor3 = attributeColorDisabled2
                    guiObjectThumbNormal.ImageColor3 = attributeColorDisabled2
                    guiObjectThumbPressed.ImageColor3 = attributeColorDisabled2

                end

            end

            -- Refresh Gui
            RefreshGui()


            -- Disconnect existing connections
            local keyConnection1 = "AttributeChanged"
            local keyConnection2 = "ThumbPosition"
            local keyConnection3 = "AttributeChangedSignal" .. "IsDragging"
            if self.Connections[keyConnection1] then self.Connections[keyConnection1]:Disconnect() end
            if self.Connections[keyConnection2] then self.Connections[keyConnection2]:Disconnect() end
            if self.Connections[keyConnection3] then self.Connections[keyConnection3]:Disconnect() end

            -- Events

            -- Attribute Event - AttributeChanged
            -- Triggered when any attribute changes
            self.Connections[keyConnection1] = self.GuiObject.AttributeChanged:Connect(function(attributeName)

                RefreshGui()

            end)


            -- Instance Event - GetPropertyChangedSignal
            -- Triggered when thumb is dragged
            self.Connections[keyConnection2] = guiObjectThumbNormal:GetPropertyChangedSignal("Position"):Connect(function()

                -- Get current attribute values
                local attributesParent = self.GuiObject
                local attributeValuePercent = attributesParent:GetAttribute(("ValuePercent"))

                -- Get new thumb position
                local thumbPositionPercent = 0
                if self.Direction == Enum.Axis.X then
                    thumbPositionPercent = guiObjectThumbNormal.Position.X.Scale * maxvalue
                else
                    thumbPositionPercent = (1 - guiObjectThumbNormal.Position.Y.Scale) * maxvalue  -- Zero is at the bottom
                end

                -- Update slider value based on thumb position
                local newValuePercent = math.clamp(thumbPositionPercent, minvalue, maxvalue)
                if newValuePercent ~= attributeValuePercent then
                    attributesParent:SetAttribute("ValuePercent", newValuePercent)
                end

            end)


            -- Attribute Event - GetAttributeChangedSignal
            -- Triggered when specific attribute changes
            self.Connections[keyConnection3] = guiObjectThumbNormal:GetAttributeChangedSignal("IsDragging"):Connect(function()

                -- Show pressed thumb when dragging
                local attributeIsDragging = guiObjectThumbNormal:GetAttribute("IsDragging") or false
                guiObjectThumbPressed.Visible = attributeIsDragging

            end)


            return self

        end



        return FormSliderClass

    end

    modules[tbl.ExtendDraggableClass] = function()
        local script = tbl.ExtendDraggableClass

    	--[[
    	
    		Copyright © 2023, MapleMarvel (https://www.roblox.com/users/263710410/profile). All Rights Reserved.
    		
    		
    		ExtendDraggableClass:
    		Class that extends the object so that it can be dragged.
    			
    	--]]


        -- Class
        local ExtendDraggableClass = {}
        ExtendDraggableClass.__index = ExtendDraggableClass


        -- Constructor
        function ExtendDraggableClass.new(paramGuiObject, paramDraggingEnabled, paramDraggingDirection)
            local self = setmetatable({}, ExtendDraggableClass)


            -- Validate
            if paramGuiObject == nil then
                error("Required parameters missing for constructor ExtendDraggableClass.new.")
            end

            -- Instance Properties
            self.GuiObject = paramGuiObject  -- The GuiObject extended by this class
            self.IsDragging = false  -- True when the user is dragging
            self.DraggingEnabled = paramDraggingEnabled or true  -- Enable or disable dragging
            self.DraggingDirection = paramDraggingDirection or Enum.Axis.X  -- Direction of dragging
            self.DraggingIncrement = 1  -- Dragging increment for descrete intervals
            self.Connections = {}  -- Event connections


            -- Initialize

            -- Local variables
            local dragInput
            local dragStartScreenPosition
            local startGuiObjectPosition
            local parentAbsoluteSize
            local cameraType

            -- Set attribute
            self.GuiObject:SetAttribute("IsDragging", self.IsDragging)

            -- Local function
            local function RoundToIncrement(paramNumber, paramMultiple)

                local roundedNumber = paramNumber

                -- Validate
                if paramMultiple ~= 0 then

                    -- Rounds to nearest multiple
                    if paramNumber > 0 then
                        roundedNumber = math.ceil(paramNumber / paramMultiple) * paramMultiple
                    elseif paramNumber < 0 then
                        roundedNumber = math.floor(paramNumber / paramMultiple) * paramMultiple
                    else
                        roundedNumber = paramMultiple
                    end

                end

                return roundedNumber
            end

            -- Local function
            local function RefreshGui(paramInput)

                -- Get the new position
                local deltaScreenPosition = paramInput.Position - dragStartScreenPosition
                local deltaXScale = deltaScreenPosition.X / parentAbsoluteSize.X
                local deltaYScale = deltaScreenPosition.Y / parentAbsoluteSize.Y
                local newXScale = startGuiObjectPosition.X.Scale + deltaXScale
                local newYScale = startGuiObjectPosition.Y.Scale + deltaYScale

                newXScale = RoundToIncrement(newXScale, self.DraggingIncrement / 100)
                newYScale = RoundToIncrement(newYScale, self.DraggingIncrement / 100)

                newXScale = math.round(newXScale * 10000) / 10000  -- Round to avoid roundoff errors
                newYScale = math.round(newYScale * 10000) / 10000

                newXScale = math.clamp(newXScale, 0, 1)
                newYScale = math.clamp(newYScale, 0, 1)

                -- Horizontal or vertical direction
                if self.DraggingDirection == Enum.Axis.X then
                    newYScale = startGuiObjectPosition.Y.Scale  -- Ignore vertical movement
                else
                    newXScale = startGuiObjectPosition.X.Scale  -- Ignore horizontal movement
                end

                -- Prevent camera moving on mobile during drag
                if paramInput.UserInputType == Enum.UserInputType.Touch then
                    workspace.Camera.CameraType = Enum.CameraType.Scriptable
                end

                -- Move the gui object
                self.GuiObject.Position = UDim2.new(newXScale, startGuiObjectPosition.X.Offset, newYScale, startGuiObjectPosition.Y.Offset)

                -- Reset camera on mobile
                if paramInput.UserInputType == Enum.UserInputType.Touch then
                    workspace.Camera.CameraType = cameraType
                end

            end


            -- Disconnect existing connections
            local keyConnection1 = "GuiObjectInputBegan"
            local keyConnection2 = "GuiObjectInputChanged"
            local keyConnection3 = "UserInputServiceInputChanged"
            if self.Connections[keyConnection1] then self.Connections[keyConnection1]:Disconnect() end
            if self.Connections[keyConnection2] then self.Connections[keyConnection2]:Disconnect() end
            if self.Connections[keyConnection3] then self.Connections[keyConnection3]:Disconnect() end


            -- Events

            -- GuiObject Event - InputBegan
            -- Triggered when input begins on the GuiObject
            self.Connections[keyConnection1] = self.GuiObject.InputBegan:Connect(function(input)

                -- If dragging enabled
                if self.DraggingEnabled == true then

                    -- Initialize dragging variables
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then

                        self.IsDragging  = true
                        self.GuiObject:SetAttribute("IsDragging", self.IsDragging)

                        dragStartScreenPosition = input.Position
                        startGuiObjectPosition = self.GuiObject.Position
                        parentAbsoluteSize = self.GuiObject.Parent.AbsoluteSize
                        cameraType = workspace.Camera.CameraType

                        -- Handle when dragging ends
                        input.Changed:Connect(function()
                            if input.UserInputState == Enum.UserInputState.End then
                                self.IsDragging  = false
                                self.GuiObject:SetAttribute("IsDragging", self.IsDragging)
                            end
                        end)

                    end

                end

            end)

            -- GuiObject Event - InputChanged
            -- Triggered when input changes on the GuiObject
            self.Connections[keyConnection2] = self.GuiObject.InputChanged:Connect(function(paramInput)

                -- If dragging enabled
                if self.DraggingEnabled == true then

                    -- Update drag position
                    if paramInput.UserInputType == Enum.UserInputType.MouseMovement or paramInput.UserInputType == Enum.UserInputType.Touch then
                        dragInput = paramInput
                    end

                end

            end)

            -- UserInputService Event - InputChanged
            -- Triggered when input changes by the user
            self.Connections[keyConnection3] = game:GetService("UserInputService").InputChanged:Connect(function(paramInput)

                -- If the user is dragging the GuiObject
                if paramInput == dragInput and self.IsDragging then
                    RefreshGui(paramInput)
                end

            end)


            return self

        end


        -- Instance Methods

        -- SetDraggingEnabled
        function ExtendDraggableClass:SetDraggingEnabled(paramIsEnabled)

            -- Validate
            if paramIsEnabled ~= nil then

                -- Update property
                self.DraggingEnabled = paramIsEnabled

                -- Update property
                if not paramIsEnabled then
                    self.IsDragging = false
                    self.GuiObject:SetAttribute("IsDragging", self.IsDragging)
                end

            end

        end


        -- SetDraggingIncrement
        function ExtendDraggableClass:SetDraggingIncrement(paramIncrement)

            -- Validate
            if paramIncrement ~= nil then

                -- Update property
                self.DraggingIncrement = paramIncrement

            end

        end


        return ExtendDraggableClass

    end

    modules[tbl.Highlighter] = function()
        local script = tbl.Highlighter

        local types = require(script.types)
        local utility = require(script.utility)
        local theme = require(script.theme)

        local Highlighter = {
            defaultLexer = require(script.lexer) :: types.Lexer,

            _textObjectData = {} :: { [types.TextObject]: types.ObjectData },
            _cleanups = {} :: { [types.TextObject]: () -> () },
        }

    	--[[
    		Gathers the info that is needed in order to set up a line label.
    	]]
        function Highlighter._getLabelingInfo(textObject: types.TextObject)
            local data = Highlighter._textObjectData[textObject]
            if not data then
                return
            end

            local src = utility.convertTabsToSpaces(utility.removeControlChars(textObject.Text))
            local numLines = #string.split(src, "\n")
            if numLines == 0 then
                return
            end

            local textBounds = utility.getTextBounds(textObject)
            local textHeight = textBounds.Y / numLines

            return {
                data = data,
                numLines = numLines,
                textBounds = textBounds,
                textHeight = textHeight,
                innerAbsoluteSize = utility.getInnerAbsoluteSize(textObject),
                textColor = theme.getColor("iden"),
                textFont = textObject.FontFace,
                textSize = textObject.TextSize,
                labelSize = UDim2.new(1, 0, 0, math.ceil(textHeight)),
            }
        end

    	--[[
    		Aligns and matches the line labels to the textObject.
    	]]
        function Highlighter._alignLabels(textObject: types.TextObject)
            local labelingInfo = Highlighter._getLabelingInfo(textObject)
            if not labelingInfo then
                return
            end

            for lineNumber, lineLabel in labelingInfo.data.Labels do
                -- Align line label
                lineLabel.TextColor3 = labelingInfo.textColor
                lineLabel.FontFace = labelingInfo.textFont
                lineLabel.TextSize = labelingInfo.textSize
                lineLabel.Size = labelingInfo.labelSize
                lineLabel.Position =
                    UDim2.fromScale(0, labelingInfo.textHeight * (lineNumber - 1) / labelingInfo.innerAbsoluteSize.Y)
            end
        end

    	--[[
    		Creates and populates the line labels with the appropriate rich text.
    	]]
        function Highlighter._populateLabels(props: types.HighlightProps)
            -- Gather props
            local textObject = props.textObject
            local src = utility.convertTabsToSpaces(utility.removeControlChars(props.src or textObject.Text))
            local lexer = props.lexer or Highlighter.defaultLexer
            local customLang = props.customLang
            local forceUpdate = props.forceUpdate

            -- Avoid updating when unnecessary
            local data = Highlighter._textObjectData[textObject]
            if (data == nil) or (data.Text == src) then
                if forceUpdate ~= true then
                    return
                end
            end

            -- Ensure textObject matches sanitized src
            textObject.Text = src

            local lineLabels = data.Labels
            local previousLines = data.Lines

            local lines = string.split(src, "\n")

            data.Lines = lines
            data.Text = src
            data.Lexer = lexer
            data.CustomLang = customLang

            -- Shortcut empty textObjects
            if src == "" then
                for l = 1, #lineLabels do
                    if lineLabels[l].Text == "" then
                        continue
                    end
                    lineLabels[l].Text = ""
                end
                return
            end

            local idenColor = theme.getColor("iden")
            local labelingInfo = Highlighter._getLabelingInfo(textObject)

            local richTextBuffer, bufferIndex, lineNumber = table.create(5), 0, 1
            for token: types.TokenName, content: string in lexer.scan(src) do
                local Color = if customLang and customLang[content]
                    then theme.getColor("custom")
                    else theme.getColor(token) or idenColor

                local tokenLines = string.split(utility.sanitizeRichText(content), "\n")

                for l, tokenLine in tokenLines do
                    -- Find line label
                    local lineLabel = lineLabels[lineNumber]
                    if not lineLabel then
                        local newLabel = Instance.new("TextLabel")
                        newLabel.Name = "Line_" .. lineNumber
                        newLabel.AutoLocalize = false
                        newLabel.RichText = true
                        newLabel.BackgroundTransparency = 1
                        newLabel.Text = ""
                        newLabel.TextXAlignment = Enum.TextXAlignment.Left
                        newLabel.TextYAlignment = Enum.TextYAlignment.Top
                        newLabel.TextColor3 = labelingInfo.textColor
                        newLabel.FontFace = labelingInfo.textFont
                        newLabel.TextSize = labelingInfo.textSize
                        newLabel.Size = labelingInfo.labelSize
                        newLabel.Position =
                            UDim2.fromScale(0, labelingInfo.textHeight * (lineNumber - 1) / labelingInfo.innerAbsoluteSize.Y)

                        newLabel.Parent = textObject.SyntaxHighlights
                        lineLabels[lineNumber] = newLabel
                        lineLabel = newLabel
                    end

                    -- If multiline token, then set line & move to next
                    if l > 1 then
                        if forceUpdate or lines[lineNumber] ~= previousLines[lineNumber] then
                            -- Set line
                            lineLabels[lineNumber].Text = table.concat(richTextBuffer)
                        end
                        -- Move to next line
                        lineNumber += 1
                        bufferIndex = 0
                        table.clear(richTextBuffer)
                    end

                    -- If changed, add token to line
                    if forceUpdate or lines[lineNumber] ~= previousLines[lineNumber] then
                        bufferIndex += 1
                        -- Only add RichText tags when the color is non-default and the characters are non-whitespace
                        if Color ~= idenColor and string.find(tokenLine, "[%S%C]") then
                            richTextBuffer[bufferIndex] = theme.getColoredRichText(Color, tokenLine)
                        else
                            richTextBuffer[bufferIndex] = tokenLine
                        end
                    end
                end
            end

            -- Set final line
            if richTextBuffer[1] and lineLabels[lineNumber] then
                lineLabels[lineNumber].Text = table.concat(richTextBuffer)
            end

            -- Clear unused line labels
            for l = lineNumber + 1, #lineLabels do
                if lineLabels[l].Text == "" then
                    continue
                end
                lineLabels[l].Text = ""
            end
        end

    	--[[
    		Highlights the given textObject with the given props and returns a cleanup function.
    		Highlighting will automatically update when needed, so the cleanup function will disconnect
    		those connections and remove all labels.
    	]]
        function Highlighter.highlight(props: types.HighlightProps): () -> ()
            -- Gather props
            local textObject = props.textObject
            local src = utility.convertTabsToSpaces(utility.removeControlChars(props.src or textObject.Text))
            local lexer = props.lexer or Highlighter.defaultLexer
            local customLang = props.customLang

            -- Avoid updating when unnecessary
            if Highlighter._cleanups[textObject] then
                -- Already been initialized, so just update
                Highlighter._populateLabels(props)
                Highlighter._alignLabels(textObject)
                return Highlighter._cleanups[textObject]
            end

            -- Ensure valid object properties
            textObject.RichText = false
            textObject.Text = src
            textObject.TextXAlignment = Enum.TextXAlignment.Left
            textObject.TextYAlignment = Enum.TextYAlignment.Top
            textObject.BackgroundColor3 = theme.getColor("background")
            textObject.TextColor3 = theme.getColor("iden")
            textObject.TextTransparency = 0.5

            -- Build the highlight labels
            local lineFolder = textObject:FindFirstChild("SyntaxHighlights")
            if lineFolder == nil then
                local newLineFolder = Instance.new("Folder")
                newLineFolder.Name = "SyntaxHighlights"
                newLineFolder.Parent = textObject

                lineFolder = newLineFolder
            end

            local data = {
                Text = "",
                Labels = {},
                Lines = {},
                Lexer = lexer,
                CustomLang = customLang,
            }
            Highlighter._textObjectData[textObject] = data

            -- Add a cleanup handler for this textObject
            local connections: { [string]: RBXScriptConnection } = {}
            local function cleanup()
                lineFolder:Destroy()

                Highlighter._textObjectData[textObject] = nil
                Highlighter._cleanups[textObject] = nil

                for _key, connection in connections do
                    connection:Disconnect()
                end
                table.clear(connections)
            end
            Highlighter._cleanups[textObject] = cleanup

            connections["AncestryChanged"] = textObject.AncestryChanged:Connect(function()
                if textObject.Parent then
                    return
                end

                cleanup()
            end)
            connections["TextChanged"] = textObject:GetPropertyChangedSignal("Text"):Connect(function()
                Highlighter._populateLabels(props)
            end)
            connections["TextBoundsChanged"] = textObject:GetPropertyChangedSignal("TextBounds"):Connect(function()
                Highlighter._alignLabels(textObject)
            end)
            connections["AbsoluteSizeChanged"] = textObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                Highlighter._alignLabels(textObject)
            end)
            connections["FontFaceChanged"] = textObject:GetPropertyChangedSignal("FontFace"):Connect(function()
                Highlighter._alignLabels(textObject)
            end)

            -- Populate the labels
            Highlighter._populateLabels(props)
            Highlighter._alignLabels(textObject)

            return cleanup
        end

    	--[[
    		Refreshes all highlighted textObjects. Used when the theme changes.
    	]]
        function Highlighter.refresh(): ()
            -- Rehighlight existing labels using latest colors
            for textObject, data in Highlighter._textObjectData do
                for _, lineLabel in data.Labels do
                    lineLabel.TextColor3 = theme.getColor("iden")
                end

                Highlighter.highlight({
                    textObject = textObject,
                    forceUpdate = true,
                    src = data.Text,
                    lexer = data.Lexer,
                    customLang = data.CustomLang,
                })
            end
        end

    	--[[
    		Sets the token colors to the given colors and refreshes all highlighted textObjects.
    	]]
        function Highlighter.setTokenColors(colors: types.TokenColors): ()
            theme.setColors(colors)

            Highlighter.refresh()
        end

    	--[[
    		Gets a token color by name.
    		Mainly useful for setting "background" token color on other UI objects behind your text.
    	]]
        function Highlighter.getTokenColor(tokenName: types.TokenName): Color3
            return theme.getColor(tokenName)
        end

    	--[[
    		Matches the token colors to the Studio theme settings and refreshes all highlighted textObjects.
    		Does nothing when not run in a Studio plugin.
    	]]
        function Highlighter.matchStudioSettings(): ()
            local applied = theme.matchStudioSettings(Highlighter.refresh)
            if applied then
                Highlighter.refresh()
            end
        end

        return Highlighter

    end

    modules[tbl.lexer] = function()
        local script = tbl.lexer

    	--[=[
    		Lexical scanner for creating a sequence of tokens from Lua source code.
    		This is a heavily modified and Roblox-optimized version of
    		the original Penlight Lexer module:
    			https://github.com/stevedonovan/Penlight
    		Authors:
    			stevedonovan <https://github.com/stevedonovan> ----------- Original Penlight lexer author
    			ryanjmulder <https://github.com/ryanjmulder> ------------- Penlight lexer contributer
    			mpeterv <https://github.com/mpeterv> --------------------- Penlight lexer contributer
    			Tieske <https://github.com/Tieske> ----------------------- Penlight lexer contributer
    			boatbomber <https://github.com/boatbomber> --------------- Roblox port, added builtin token,
    			                                                           added patterns for incomplete syntax, bug fixes,
    			                                                           behavior changes, token optimization, thread optimization
    			                                                           Added lexer.navigator() for non-sequential reads
    			Sleitnick <https://github.com/Sleitnick> ----------------- Roblox optimizations
    			howmanysmall <https://github.com/howmanysmall> ----------- Lua + Roblox optimizations
    	
    		List of possible tokens:
    			- iden
    			- keyword
    			- builtin
    			- string
    			- number
    			- comment
    			- operator
    	--]=]

        local lexer = {}

        local Prefix, Suffix, Cleaner = "^[%c%s]*", "[%c%s]*", "[%c%s]+"
        local UNICODE = "[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]+"
        local NUMBER_A = "0[xX][%da-fA-F_]+"
        local NUMBER_B = "0[bB][01_]+"
        local NUMBER_C = "%d+%.?%d*[eE][%+%-]?%d+"
        local NUMBER_D = "%d+[%._]?[%d_eE]*"
        local OPERATORS = "[:;<>/~%*%(%)%-={},%.#%^%+%%]+"
        local BRACKETS = "[%[%]]+" -- needs to be separate pattern from other operators or it'll mess up multiline strings
        local IDEN = "[%a_][%w_]*"
        local STRING_EMPTY = "(['\"])%1" --Empty String
        local STRING_PLAIN = "(['\"])[^\n]-([^\\]%1)" --TODO: Handle escaping escapes
        local STRING_INTER = "`[^\n]-`"
        local STRING_INCOMP_A = "(['\"]).-\n" --Incompleted String with next line
        local STRING_INCOMP_B = "(['\"])[^\n]*" --Incompleted String without next line
        local STRING_MULTI = "%[(=*)%[.-%]%1%]" --Multiline-String
        local STRING_MULTI_INCOMP = "%[=*%[.-.*" --Incompleted Multiline-String
        local COMMENT_MULTI = "%-%-%[(=*)%[.-%]%1%]" --Completed Multiline-Comment
        local COMMENT_MULTI_INCOMP = "%-%-%[=*%[.-.*" --Incompleted Multiline-Comment
        local COMMENT_PLAIN = "%-%-.-\n" --Completed Singleline-Comment
        local COMMENT_INCOMP = "%-%-.*" --Incompleted Singleline-Comment
        -- local TYPED_VAR = ":%s*([%w%?%| \t]+%s*)" --Typed variable, parameter, function

        local lang = require(script.language)
        local lua_keyword = lang.keyword
        local lua_builtin = lang.builtin
        local lua_libraries = lang.libraries

        lexer.language = lang

        local lua_matches = {
            -- Indentifiers
            { Prefix .. IDEN .. Suffix, "var" },

            -- Numbers
            { Prefix .. NUMBER_A .. Suffix, "number" },
            { Prefix .. NUMBER_B .. Suffix, "number" },
            { Prefix .. NUMBER_C .. Suffix, "number" },
            { Prefix .. NUMBER_D .. Suffix, "number" },

            -- Strings
            { Prefix .. STRING_EMPTY .. Suffix, "string" },
            { Prefix .. STRING_PLAIN .. Suffix, "string" },
            { Prefix .. STRING_INCOMP_A .. Suffix, "string" },
            { Prefix .. STRING_INCOMP_B .. Suffix, "string" },
            { Prefix .. STRING_MULTI .. Suffix, "string" },
            { Prefix .. STRING_MULTI_INCOMP .. Suffix, "string" },
            { Prefix .. STRING_INTER .. Suffix, "string_inter" },

            -- Comments
            { Prefix .. COMMENT_MULTI .. Suffix, "comment" },
            { Prefix .. COMMENT_MULTI_INCOMP .. Suffix, "comment" },
            { Prefix .. COMMENT_PLAIN .. Suffix, "comment" },
            { Prefix .. COMMENT_INCOMP .. Suffix, "comment" },

            -- Operators
            { Prefix .. OPERATORS .. Suffix, "operator" },
            { Prefix .. BRACKETS .. Suffix, "operator" },

            -- Unicode
            { Prefix .. UNICODE .. Suffix, "iden" },

            -- Unknown
            { "^.", "iden" },
        }

        -- To reduce the amount of table indexing during lexing, we separate the matches now
        local PATTERNS, TOKENS = {}, {}
        for i, m in lua_matches do
            PATTERNS[i] = m[1]
            TOKENS[i] = m[2]
        end

        --- Create a plain token iterator from a string.
        -- @tparam string s a string.

        function lexer.scan(s: string)
            local index = 1
            local size = #s
            local previousContent1, previousContent2, previousContent3, previousToken = "", "", "", ""

            local thread = coroutine.create(function()
                while index <= size do
                    local matched = false
                    for tokenType, pattern in ipairs(PATTERNS) do
                        -- Find match
                        local start, finish = string.find(s, pattern, index)
                        if start == nil then
                            continue
                        end

                        -- Move head
                        index = finish + 1
                        matched = true

                        -- Gather results
                        local content = string.sub(s, start, finish)
                        local rawToken = TOKENS[tokenType]
                        local processedToken = rawToken

                        -- Process token
                        if rawToken == "var" then
                            -- Since we merge spaces into the tok, we need to remove them
                            -- in order to check the actual word it contains
                            local cleanContent = string.gsub(content, Cleaner, "")

                            if lua_keyword[cleanContent] then
                                processedToken = "keyword"
                            elseif lua_builtin[cleanContent] then
                                processedToken = "builtin"
                            elseif string.find(previousContent1, "%.[%s%c]*$") and previousToken ~= "comment" then
                                -- The previous was a . so we need to special case indexing things
                                local parent = string.gsub(previousContent2, Cleaner, "")
                                local lib = lua_libraries[parent]
                                if lib and lib[cleanContent] and not string.find(previousContent3, "%.[%s%c]*$") then
                                    -- Indexing a builtin lib with existing item, treat as a builtin
                                    processedToken = "builtin"
                                else
                                    -- Indexing a non builtin, can't be treated as a keyword/builtin
                                    processedToken = "iden"
                                end
                                -- print("indexing",parent,"with",cleanTok,"as",t2)
                            else
                                processedToken = "iden"
                            end
                        elseif rawToken == "string_inter" then
                            if not string.find(content, "[^\\]{") then
                                -- This inter string doesnt actually have any inters
                                processedToken = "string"
                            else
                                -- We're gonna do our own yields, so the main loop won't need to
                                -- Our yields will be a mix of string and whatever is inside the inters
                                processedToken = nil

                                local isString = true
                                local subIndex = 1
                                local subSize = #content
                                while subIndex <= subSize do
                                    -- Find next brace
                                    local subStart, subFinish = string.find(content, "^.-[^\\][{}]", subIndex)
                                    if subStart == nil then
                                        -- No more braces, all string
                                        coroutine.yield("string", string.sub(content, subIndex))
                                        break
                                    end

                                    if isString then
                                        -- We are currently a string
                                        subIndex = subFinish + 1
                                        coroutine.yield("string", string.sub(content, subStart, subFinish))

                                        -- This brace opens code
                                        isString = false
                                    else
                                        -- We are currently in code
                                        subIndex = subFinish
                                        local subContent = string.sub(content, subStart, subFinish - 1)
                                        for innerToken, innerContent in lexer.scan(subContent) do
                                            coroutine.yield(innerToken, innerContent)
                                        end

                                        -- This brace opens string/closes code
                                        isString = true
                                    end
                                end
                            end
                        end

                        -- Record last 3 tokens for the indexing context check
                        previousContent3 = previousContent2
                        previousContent2 = previousContent1
                        previousContent1 = content
                        previousToken = processedToken or rawToken
                        if processedToken then
                            coroutine.yield(processedToken, content)
                        end
                        break
                    end

                    -- No matches found
                    if not matched then
                        return
                    end
                end

                -- Completed the scan
                return
            end)

            return function()
                if coroutine.status(thread) == "dead" then
                    return
                end

                local success, token, content = coroutine.resume(thread)
                if success and token then
                    return token, content
                end

                return
            end
        end

        function lexer.navigator()
            local nav = {
                Source = "",
                TokenCache = table.create(50),

                _RealIndex = 0,
                _UserIndex = 0,
                _ScanThread = nil,
            }

            function nav:Destroy()
                self.Source = nil
                self._RealIndex = nil
                self._UserIndex = nil
                self.TokenCache = nil
                self._ScanThread = nil
            end

            function nav:SetSource(SourceString)
                self.Source = SourceString

                self._RealIndex = 0
                self._UserIndex = 0
                table.clear(self.TokenCache)

                self._ScanThread = coroutine.create(function()
                    for Token, Src in lexer.scan(self.Source) do
                        self._RealIndex += 1
                        self.TokenCache[self._RealIndex] = { Token, Src }
                        coroutine.yield(Token, Src)
                    end
                end)
            end

            function nav.Next()
                nav._UserIndex += 1

                if nav._RealIndex >= nav._UserIndex then
                    -- Already scanned, return cached
                    return table.unpack(nav.TokenCache[nav._UserIndex])
                else
                    if coroutine.status(nav._ScanThread) == "dead" then
                        -- Scan thread dead
                        return
                    else
                        local success, token, src = coroutine.resume(nav._ScanThread)
                        if success and token then
                            -- Scanned new data
                            return token, src
                        else
                            -- Lex completed
                            return
                        end
                    end
                end
            end

            function nav.Peek(PeekAmount)
                local GoalIndex = nav._UserIndex + PeekAmount

                if nav._RealIndex >= GoalIndex then
                    -- Already scanned, return cached
                    if GoalIndex > 0 then
                        return table.unpack(nav.TokenCache[GoalIndex])
                    else
                        -- Invalid peek
                        return
                    end
                else
                    if coroutine.status(nav._ScanThread) == "dead" then
                        -- Scan thread dead
                        return
                    else
                        local IterationsAway = GoalIndex - nav._RealIndex

                        local success, token, src = nil, nil, nil

                        for _ = 1, IterationsAway do
                            success, token, src = coroutine.resume(nav._ScanThread)
                            if not (success or token) then
                                -- Lex completed
                                break
                            end
                        end

                        return token, src
                    end
                end
            end

            return nav
        end

        return lexer

    end

    modules[tbl.language] = function()
        local script = tbl.language

        local language = {
            keyword = {
                ["and"] = "keyword",
                ["break"] = "keyword",
                ["continue"] = "keyword",
                ["do"] = "keyword",
                ["else"] = "keyword",
                ["elseif"] = "keyword",
                ["end"] = "keyword",
                ["export"] = "keyword",
                ["false"] = "keyword",
                ["for"] = "keyword",
                ["function"] = "keyword",
                ["if"] = "keyword",
                ["in"] = "keyword",
                ["local"] = "keyword",
                ["nil"] = "keyword",
                ["not"] = "keyword",
                ["or"] = "keyword",
                ["repeat"] = "keyword",
                ["return"] = "keyword",
                ["self"] = "keyword",
                ["then"] = "keyword",
                ["true"] = "keyword",
                ["type"] = "keyword",
                ["typeof"] = "keyword",
                ["until"] = "keyword",
                ["while"] = "keyword",
            },

            builtin = {
                -- Luau Functions
                ["assert"] = "function",
                ["error"] = "function",
                ["getfenv"] = "function",
                ["getmetatable"] = "function",
                ["ipairs"] = "function",
                ["loadstring"] = "function",
                ["newproxy"] = "function",
                ["next"] = "function",
                ["pairs"] = "function",
                ["pcall"] = "function",
                ["print"] = "function",
                ["rawequal"] = "function",
                ["rawget"] = "function",
                ["rawlen"] = "function",
                ["rawset"] = "function",
                ["select"] = "function",
                ["setfenv"] = "function",
                ["setmetatable"] = "function",
                ["tonumber"] = "function",
                ["tostring"] = "function",
                ["unpack"] = "function",
                ["xpcall"] = "function",

                -- Luau Functions (Deprecated)
                ["collectgarbage"] = "function",

                -- Luau Variables
                ["_G"] = "table",
                ["_VERSION"] = "string",

                -- Luau Tables
                ["bit32"] = "table",
                ["coroutine"] = "table",
                ["debug"] = "table",
                ["math"] = "table",
                ["os"] = "table",
                ["string"] = "table",
                ["table"] = "table",
                ["utf8"] = "table",

                -- Roblox Functions
                ["DebuggerManager"] = "function",
                ["delay"] = "function",
                ["gcinfo"] = "function",
                ["PluginManager"] = "function",
                ["require"] = "function",
                ["settings"] = "function",
                ["spawn"] = "function",
                ["tick"] = "function",
                ["time"] = "function",
                ["UserSettings"] = "function",
                ["wait"] = "function",
                ["warn"] = "function",

                -- Roblox Functions (Deprecated)
                ["Delay"] = "function",
                ["ElapsedTime"] = "function",
                ["elapsedTime"] = "function",
                ["printidentity"] = "function",
                ["Spawn"] = "function",
                ["Stats"] = "function",
                ["stats"] = "function",
                ["Version"] = "function",
                ["version"] = "function",
                ["Wait"] = "function",
                ["ypcall"] = "function",

                -- Roblox Variables
                ["game"] = "Instance",
                ["plugin"] = "Instance",
                ["script"] = "Instance",
                ["shared"] = "Instance",
                ["workspace"] = "Instance",

                -- Roblox Variables (Deprecated)
                ["Game"] = "Instance",
                ["Workspace"] = "Instance",

                -- Roblox Tables
                ["Axes"] = "table",
                ["BrickColor"] = "table",
                ["CatalogSearchParams"] = "table",
                ["CFrame"] = "table",
                ["Color3"] = "table",
                ["ColorSequence"] = "table",
                ["ColorSequenceKeypoint"] = "table",
                ["DateTime"] = "table",
                ["DockWidgetPluginGuiInfo"] = "table",
                ["Enum"] = "table",
                ["Faces"] = "table",
                ["FloatCurveKey"] = "table",
                ["Font"] = "table",
                ["Instance"] = "table",
                ["NumberRange"] = "table",
                ["NumberSequence"] = "table",
                ["NumberSequenceKeypoint"] = "table",
                ["OverlapParams"] = "table",
                ["PathWaypoint"] = "table",
                ["PhysicalProperties"] = "table",
                ["Random"] = "table",
                ["Ray"] = "table",
                ["RaycastParams"] = "table",
                ["Rect"] = "table",
                ["Region3"] = "table",
                ["Region3int16"] = "table",
                ["RotationCurveKey"] = "table",
                ["SharedTable"] = "table",
                ["task"] = "table",
                ["TweenInfo"] = "table",
                ["UDim"] = "table",
                ["UDim2"] = "table",
                ["Vector2"] = "table",
                ["Vector2int16"] = "table",
                ["Vector3"] = "table",
                ["Vector3int16"] = "table",
            },

            libraries = {

                -- Luau Libraries
                bit32 = {
                    arshift = "function",
                    band = "function",
                    bnot = "function",
                    bor = "function",
                    btest = "function",
                    bxor = "function",
                    countlz = "function",
                    countrz = "function",
                    extract = "function",
                    lrotate = "function",
                    lshift = "function",
                    replace = "function",
                    rrotate = "function",
                    rshift = "function",
                },

                coroutine = {
                    close = "function",
                    create = "function",
                    isyieldable = "function",
                    resume = "function",
                    running = "function",
                    status = "function",
                    wrap = "function",
                    yield = "function",
                },

                debug = {
                    dumpheap = "function",
                    getmemorycategory = "function",
                    info = "function",
                    loadmodule = "function",
                    profilebegin = "function",
                    profileend = "function",
                    resetmemorycategory = "function",
                    setmemorycategory = "function",
                    traceback = "function",
                },

                math = {
                    abs = "function",
                    acos = "function",
                    asin = "function",
                    atan2 = "function",
                    atan = "function",
                    ceil = "function",
                    clamp = "function",
                    cos = "function",
                    cosh = "function",
                    deg = "function",
                    exp = "function",
                    floor = "function",
                    fmod = "function",
                    frexp = "function",
                    ldexp = "function",
                    log10 = "function",
                    log = "function",
                    max = "function",
                    min = "function",
                    modf = "function",
                    noise = "function",
                    pow = "function",
                    rad = "function",
                    random = "function",
                    randomseed = "function",
                    round = "function",
                    sign = "function",
                    sin = "function",
                    sinh = "function",
                    sqrt = "function",
                    tan = "function",
                    tanh = "function",

                    huge = "number",
                    pi = "number",
                },

                os = {
                    clock = "function",
                    date = "function",
                    difftime = "function",
                    time = "function",
                },

                string = {
                    byte = "function",
                    char = "function",
                    find = "function",
                    format = "function",
                    gmatch = "function",
                    gsub = "function",
                    len = "function",
                    lower = "function",
                    match = "function",
                    pack = "function",
                    packsize = "function",
                    rep = "function",
                    reverse = "function",
                    split = "function",
                    sub = "function",
                    unpack = "function",
                    upper = "function",
                },

                table = {
                    clear = "function",
                    clone = "function",
                    concat = "function",
                    create = "function",
                    find = "function",
                    foreach = "function",
                    foreachi = "function",
                    freeze = "function",
                    getn = "function",
                    insert = "function",
                    isfrozen = "function",
                    maxn = "function",
                    move = "function",
                    pack = "function",
                    remove = "function",
                    sort = "function",
                    unpack = "function",
                },

                utf8 = {
                    char = "function",
                    codepoint = "function",
                    codes = "function",
                    graphemes = "function",
                    len = "function",
                    nfcnormalize = "function",
                    nfdnormalize = "function",
                    offset = "function",

                    charpattern = "string",
                },

                -- Roblox Libraries
                Axes = {
                    new = "function",
                },

                BrickColor = {
                    Black = "function",
                    Blue = "function",
                    DarkGray = "function",
                    Gray = "function",
                    Green = "function",
                    new = "function",
                    New = "function",
                    palette = "function",
                    Random = "function",
                    random = "function",
                    Red = "function",
                    White = "function",
                    Yellow = "function",
                },

                CatalogSearchParams = {
                    new = "function",
                },

                CFrame = {
                    Angles = "function",
                    fromAxisAngle = "function",
                    fromEulerAngles = "function",
                    fromEulerAnglesXYZ = "function",
                    fromEulerAnglesYXZ = "function",
                    fromMatrix = "function",
                    fromOrientation = "function",
                    lookAt = "function",
                    new = "function",

                    identity = "CFrame",
                },

                Color3 = {
                    fromHex = "function",
                    fromHSV = "function",
                    fromRGB = "function",
                    new = "function",
                    toHSV = "function",
                },

                ColorSequence = {
                    new = "function",
                },

                ColorSequenceKeypoint = {
                    new = "function",
                },

                DateTime = {
                    fromIsoDate = "function",
                    fromLocalTime = "function",
                    fromUniversalTime = "function",
                    fromUnixTimestamp = "function",
                    fromUnixTimestampMillis = "function",
                    now = "function",
                },

                DockWidgetPluginGuiInfo = {
                    new = "function",
                },

                Enum = {},

                Faces = {
                    new = "function",
                },

                FloatCurveKey = {
                    new = "function",
                },

                Font = {
                    fromEnum = "function",
                    fromId = "function",
                    fromName = "function",
                    new = "function",
                },

                Instance = {
                    new = "function",
                },

                NumberRange = {
                    new = "function",
                },

                NumberSequence = {
                    new = "function",
                },

                NumberSequenceKeypoint = {
                    new = "function",
                },

                OverlapParams = {
                    new = "function",
                },

                PathWaypoint = {
                    new = "function",
                },

                PhysicalProperties = {
                    new = "function",
                },

                Random = {
                    new = "function",
                },

                Ray = {
                    new = "function",
                },

                RaycastParams = {
                    new = "function",
                },

                Rect = {
                    new = "function",
                },

                Region3 = {
                    new = "function",
                },

                Region3int16 = {
                    new = "function",
                },

                RotationCurveKey = {
                    new = "function",
                },

                SharedTable = {
                    clear = "function",
                    clone = "function",
                    cloneAndFreeze = "function",
                    increment = "function",
                    isFrozen = "function",
                    new = "function",
                    size = "function",
                    update = "function",
                },

                task = {
                    cancel = "function",
                    defer = "function",
                    delay = "function",
                    desynchronize = "function",
                    spawn = "function",
                    synchronize = "function",
                    wait = "function",
                },

                TweenInfo = {
                    new = "function",
                },

                UDim = {
                    new = "function",
                },

                UDim2 = {
                    fromOffset = "function",
                    fromScale = "function",
                    new = "function",
                },

                Vector2 = {
                    new = "function",

                    one = "Vector2",
                    xAxis = "Vector2",
                    yAxis = "Vector2",
                    zero = "Vector2",
                },

                Vector2int16 = {
                    new = "function",
                },

                Vector3 = {
                    fromAxis = "function",
                    FromAxis = "function",
                    fromNormalId = "function",
                    FromNormalId = "function",
                    new = "function",

                    one = "Vector3",
                    xAxis = "Vector3",
                    yAxis = "Vector3",
                    zAxis = "Vector3",
                    zero = "Vector3",
                },

                Vector3int16 = {
                    new = "function",
                },
            },
        }

        -- Filling up language.libraries.Enum table
        local enumLibraryTable = language.libraries.Enum

        for _, enum in ipairs(Enum:GetEnums()) do
            --TODO: Remove tostring from here once there is a better way to get the name of an Enum
            enumLibraryTable[tostring(enum)] = "Enum"
        end

        return language

    end

    modules[tbl.theme] = function()
        local script = tbl.theme

        local DEFAULT_TOKEN_COLORS = {
            ["background"] = Color3.fromRGB(47, 47, 47),
            ["iden"] = Color3.fromRGB(234, 234, 234),
            ["keyword"] = Color3.fromRGB(215, 174, 255),
            ["builtin"] = Color3.fromRGB(131, 206, 255),
            ["string"] = Color3.fromRGB(196, 255, 193),
            ["number"] = Color3.fromRGB(255, 125, 125),
            ["comment"] = Color3.fromRGB(140, 140, 155),
            ["operator"] = Color3.fromRGB(255, 239, 148),
            ["custom"] = Color3.fromRGB(119, 122, 255),
        }

        local types = require(script.Parent.types)

        local Theme = {
            tokenColors = {},
            tokenRichTextFormatter = {},
        }

        function Theme.setColors(tokenColors: types.TokenColors)
            assert(type(tokenColors) == "table", "Theme.updateColors expects a table")

            for tokenName, color in tokenColors do
                Theme.tokenColors[tokenName] = color
            end
        end

        function Theme.getColoredRichText(color: Color3, text: string): string
            return '<font color="#' .. color:ToHex() .. '">' .. text .. "</font>"
        end

        function Theme.getColor(tokenName: types.TokenName): Color3
            return Theme.tokenColors[tokenName]
        end

        function Theme.matchStudioSettings(refreshCallback: () -> ()): boolean
            local success = pcall(function()
                -- When not used in a Studio plugin, this will error
                -- and the pcall will just silently return
                local studio = settings().Studio
                local studioTheme = studio.Theme

                local function getTokens()
                    return {
                        ["background"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptBackground),
                        ["iden"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptText),
                        ["keyword"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptKeyword),
                        ["builtin"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptBuiltInFunction),
                        ["string"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptString),
                        ["number"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptNumber),
                        ["comment"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptComment),
                        ["operator"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptOperator),
                        ["custom"] = studioTheme:GetColor(Enum.StudioStyleGuideColor.ScriptBool),
                    }
                end

                Theme.setColors(getTokens())
                studio.ThemeChanged:Connect(function()
                    studioTheme = studio.Theme
                    Theme.setColors(getTokens())
                    refreshCallback()
                end)
            end)
            return success
        end

        -- Initialize
        Theme.setColors(DEFAULT_TOKEN_COLORS)

        return Theme

    end

    modules[tbl.types] = function()
        local script = tbl.types

        export type TextObject = TextLabel | TextBox

        export type TokenName =
            "background"
        | "iden"
        | "keyword"
        | "builtin"
        | "string"
        | "number"
        | "comment"
        | "operator"
        | "custom"

        export type TokenColors = {
            ["background"]: Color3?,
            ["iden"]: Color3?,
            ["keyword"]: Color3?,
            ["builtin"]: Color3?,
            ["string"]: Color3?,
            ["number"]: Color3?,
            ["comment"]: Color3?,
            ["operator"]: Color3?,
            ["custom"]: Color3?,
        }

        export type HighlightProps = {
            textObject: TextObject,
            src: string?,
            forceUpdate: boolean?,
            lexer: Lexer?,
            customLang: { [string]: string }?,
        }

        export type Lexer = {
            scan: (src: string) -> () -> (string, string),
            navigator: () -> any,
            finished: boolean?,
        }

        export type ObjectData = {
            Text: string,
            Labels: { TextLabel },
            Lines: { string },
            Lexer: Lexer?,
            CustomLang: { [string]: string }?,
        }

        return nil

    end

    modules[tbl.utility] = function()
        local script = tbl.utility

        local types = require(script.Parent.types)

        local Utility = {}

        function Utility.sanitizeRichText(s: string): string
            return string.gsub(
                string.gsub(string.gsub(string.gsub(string.gsub(s, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), '"', "&quot;"),
                "'",
                "&apos;"
            )
        end

        function Utility.convertTabsToSpaces(s: string): string
            return string.gsub(s, "\t", "    ")
        end

        function Utility.removeControlChars(s: string): string
            return string.gsub(s, "[\0\1\2\3\4\5\6\7\8\11\12\13\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
        end

        function Utility.getInnerAbsoluteSize(textObject: types.TextObject): Vector2
            local fullSize = textObject.AbsoluteSize

            local padding: UIPadding? = textObject:FindFirstChildWhichIsA("UIPadding")
            if padding then
                local offsetX = padding.PaddingLeft.Offset + padding.PaddingRight.Offset
                local scaleX = (fullSize.X * padding.PaddingLeft.Scale) + (fullSize.X * padding.PaddingRight.Scale)
                local offsetY = padding.PaddingTop.Offset + padding.PaddingBottom.Offset
                local scaleY = (fullSize.Y * padding.PaddingTop.Scale) + (fullSize.Y * padding.PaddingBottom.Scale)
                return Vector2.new(fullSize.X - (scaleX + offsetX), fullSize.Y - (scaleY + offsetY))
            else
                return fullSize
            end
        end

        function Utility.getTextBounds(textObject: types.TextObject): Vector2
            if textObject.ContentText == "" then
                return Vector2.zero
            end

            local textBounds = textObject.TextBounds

            -- Wait for TextBounds to be non-NaN and non-zero because Roblox
            while (textBounds.Y ~= textBounds.Y) or (textBounds.Y < 1) do
                task.wait()
                textBounds = textObject.TextBounds
            end
            return textBounds
        end

        return Utility

    end

    task.spawn(function()
        local script = tbl.GlobalLog

        _G.logPrint = false  
        _G.logWarn = false  
        _G.logError = false  
        _G.logInfo = false  

        local TextService = game:GetService("TextService")
        local LogService = game:GetService("LogService")
        local frame = script.Parent
        local messageBox = frame:WaitForChild("TextBox")

        messageBox.RichText = true
        messageBox.Selectable = false
        messageBox.Active = false

        local function formatMessage(message, messageType)
            local color = ""
            local formattedType = ""

            if messageType == Enum.MessageType.MessageOutput then
                color = "#cffeff" 
                formattedType = "Print"
            elseif messageType == Enum.MessageType.MessageWarning then
                color = "#ffa73b" 
                formattedType = "Warn"
            elseif messageType == Enum.MessageType.MessageError then
                color = "#FF005D" 
                formattedType = "Error"
            elseif messageType == Enum.MessageType.MessageInfo then
                color = "#5cb0ff" 
                formattedType = "Info"
            else
                color = "#FFFFFF" 
                formattedType = "Other"
            end

            return string.format('<font color="%s"><b>[%s]</b></font> %s', color, formattedType, message)
        end

        local function updateMessageBoxSize()
            local textSize = TextService:GetTextSize(
                messageBox.Text, 
                messageBox.TextSize, 
                messageBox.Font, 
                Vector2.new(messageBox.AbsoluteSize.X, 20000)
            )

            messageBox.Size = UDim2.new(messageBox.Size.X.Scale, messageBox.Size.X.Offset, 0, textSize.Y)
        end


        local function onMessageOut(message, messageType)
            if (messageType == Enum.MessageType.MessageOutput and not _G.logPrint) or
                (messageType == Enum.MessageType.MessageWarning and not _G.logWarn) or
                (messageType == Enum.MessageType.MessageError and not _G.logError) or
                (messageType == Enum.MessageType.MessageInfo and not _G.logInfo) then
                return 
            end

            local timeStamp = os.date("%X")
            local formattedMessage = formatMessage(message, messageType)
            messageBox.Text = messageBox.Text .. timeStamp .. " - " .. formattedMessage .. "\n"

            updateMessageBoxSize()

            frame.CanvasPosition = Vector2.new(0, messageBox.TextBounds.Y)
        end


        LogService.MessageOut:Connect(onMessageOut)

    end)

    task.spawn(function()
        local script = tbl.LocalPlayerHandle

        -- Services
        local Players = game:GetService("Players")

        --local plr property
        local lplayer = Players.LocalPlayer
        local character = lplayer.Character or lplayer.CharacterAdded:Wait()

        -- Modules
        local FormSliderClass = require(script.Parent:WaitForChild("FormSliderClass"))

        -- GUI Variables
        local WalKSpeedSlider = script.Parent:WaitForChild("walkspeed"):WaitForChild("Slider")
        local JumpSpeedSlider = script.Parent:WaitForChild("jumspeed"):WaitForChild("Slider")
        local curpos = script.Parent:WaitForChild("CurPos")
        -- Add slider functionality
        local WalKSpeedSliderSet = FormSliderClass.new(WalKSpeedSlider, Enum.Axis.X, 0, 50)  -- Horizontal, -> paramGuiObject, paramDirection, minvalue, maxvalue slider

        -- Meow
        WalKSpeedSlider:GetAttributeChangedSignal("ValuePercent"):Connect(function()
            --print(WalKSpeedSlider:GetAttribute("ValuePercent"), WalKSpeedSlider:GetAttribute("ValueIncrement"))
            WalKSpeedSlider.Parent.Title.Text = "Player Walk Speed: "..math.floor(WalKSpeedSlider:GetAttribute("ValuePercent"))
            character.Humanoid.WalkSpeed = math.floor(WalKSpeedSlider:GetAttribute("ValuePercent"))
        end)



        coroutine.resume(coroutine.create(function()
            while wait() do
                if character then
                    local vector = character.HumanoidRootPart.Position
                    local pos = Vector3.new(math.floor(vector.X), math.floor(vector.Y), math.floor(vector.Z))
                    curpos.Text = "Current Position: "..tostring(pos)
                end
            end
        end))



    end)

    task.spawn(function()
        local script = tbl.LocalScript

        local Highlighter = require(script.Parent.ScriptBox.Highlighter)
        local myTextLabel = script.Parent.ScriptBox

        Highlighter.highlight({
            textObject = myTextLabel,
        })

    end)

    task.spawn(function()
        local script = tbl.LocalScript_1


        local plr = game.Players.LocalPlayer
        local MainFrame = script.Parent.MainFrame
        local buttons = MainFrame.BottomMenuFrame.MenuList

        local execBtn = buttons:WaitForChild("ExecBtn")
        local cloudBtn = buttons:WaitForChild("CloudBtn")
        local HBtn = buttons:WaitForChild("HBtn")
        local settingsBtn = buttons:WaitForChild("SettingsBtn")

        local execFrame = MainFrame:WaitForChild("ExecFrame")
        local logFrame = MainFrame:WaitForChild("logFrame")
        local homeFrame = MainFrame:WaitForChild("homeFrame")
        local settingsFrame = MainFrame:WaitForChild("SettingsFrame")

        local excbtn = execFrame.Buttons.Button1
        local execlipbtn = execFrame.Buttons.Button2
        local pastebtn = execFrame.Buttons.Button3
        local clearbtn = execFrame.Buttons.Button4

        local ScriptBox = execFrame.ScrollingFrame.ScriptBox

        local ExitBtn = MainFrame.BottomMenuFrame.LeftFrame.ExitBtn

        ----//////////////////----
        ----/// Menu Buttons
        ----//////////////////----

        local function hideAllFrames()
            execFrame.Visible = false
            logFrame.Visible = false
            homeFrame.Visible = false
            settingsFrame.Visible = false
            execBtn.UIStroke.Enabled = false    
            HBtn.UIStroke.Enabled = false    
            cloudBtn.UIStroke.Enabled = false    
            settingsBtn.UIStroke.Enabled = false    
        end

        local function showFrame(frame, btn)
            hideAllFrames()
            frame.Visible = true
            btn.UIStroke.Enabled = true
        end

        execBtn.Activated:Connect(function()
            showFrame(execFrame, execBtn)
        end)

        cloudBtn.Activated:Connect(function()
            showFrame(logFrame, cloudBtn)
        end)

        HBtn.Activated:Connect(function()
            showFrame(homeFrame, HBtn)
        end)

        settingsBtn.Activated:Connect(function()
            showFrame(settingsFrame, settingsBtn)
        end)

        hideAllFrames()

        homeFrame.Visible = true

        ----//////////////////----
        ----/// Exec Buttons
        ----//////////////////----

        excbtn.Activated:Connect(function()
            excbtn.UIStroke.Enabled = true
            executecode(ScriptBox.Text)
            print("Trigon - Executed script")
            wait(0.1)
            excbtn.UIStroke.Enabled = false
        end) 

        execlipbtn.Activated:Connect(function()
            execlipbtn.UIStroke.Enabled = true
            executecode(getclipboard())
            print("Trigon - Executed from clipboard")
            wait(0.1)
            execlipbtn.UIStroke.Enabled = false
        end)  

        pastebtn.Activated:Connect(function()
            pastebtn.UIStroke.Enabled = true
            ScriptBox.Text = getclipboard()
            print("Trigon - Pasted from clipboard")
            wait(0.1)
            pastebtn.UIStroke.Enabled = false
        end) 

        clearbtn.Activated:Connect(function()
            clearbtn.UIStroke.Enabled = true
            ScriptBox.Text = ""
            wait(0.1)
            clearbtn.UIStroke.Enabled = false
        end)  


        ----//////////////////----
        ----/// Other
        ----//////////////////----

        ExitBtn.Activated:Connect(function()
            script.Parent.Enabled = not script.Parent.Enabled
        end)

        ScriptBox.Focused:Connect(function()
            for _, item in pairs(ScriptBox.SyntaxHighlights:GetChildren()) do
                item.Visible = false
            end
        end)

        ScriptBox.FocusLost:Connect(function()
            for _, item in pairs(ScriptBox.SyntaxHighlights:GetChildren()) do
                item.Visible = true
            end
        end)




        ----//////////////////----
        ----/// Default Page
        ----//////////////////----

        local HttpService = game:GetService("HttpService")

        local jsonString = [[
    	{
    	  "15842384180x": {
    	    "_scripts": [
    	      {"scriptName": "Script 1", "text": "script executed"},
    	      {"scriptName": "script 2", "text": "script executed"}
    	    ]
    	  },
    	  "987654321": {
    	    "_scripts": [
    	      {"scriptName": "scriptName 3", "text": "Quote 1 from scriptName 3 in Game 987654321"}
    	    ]
    	  },
    	  "global": {
    	    "_scripts": [
    	      {"scriptName": "Infinite Yield", "text": "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source\",true))()"},
    	      {"scriptName": "Dark Dex v4", "text": "getgenv().Key = \"Bash\" loadstring(game:HttpGet(\"https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AIY%20Dex\",true))()"},
    	      {"scriptName": "Bypassed Dark Dex v3", "text": "loadstring(game:HttpGet('https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua', true))()"}
    	    ]
    	  }
    	}
    	]]



        local scriptList = HttpService:JSONDecode(jsonString)
        local scriptsFrame = MainFrame.homeFrame.scriptsFrame
        local scriptButton = scriptsFrame.TextButton
        local currentPlaceId = tostring(game.PlaceId) 


        scriptsFrame["#GameHeader"].Title.Text = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

        local function createscriptButtons(_scripts)
            local yPos = 0
            for i, scriptData in ipairs(_scripts) do
                local newButton = scriptButton:Clone()
                newButton.Parent = scriptsFrame
                newButton.Text = scriptData.scriptName
                newButton.Position = UDim2.new(newButton.Position.X.Scale, newButton.Position.X.Offset, newButton.Position.Y.Scale, yPos)
                yPos = yPos + newButton.Size.Y.Offset + 5
                newButton.Visible = true

                newButton.MouseButton1Click:Connect(function()
                    --print(scriptData.text)
                    executecode(scriptData.text)
                end)
            end
        end

        local scriptToUse
        if scriptList[currentPlaceId] and scriptList[currentPlaceId]._scripts then
            scriptToUse = scriptList[currentPlaceId]._scripts
        elseif scriptList["global"] and scriptList["global"]._scripts then
            scriptToUse = scriptList["global"]._scripts
        end

        if scriptToUse then
            createscriptButtons(scriptToUse)
        else
            print("No _scripts available.")
        end

        scriptButton.Visible = false


        ----//////////////////----
        ----/// Console Log Page
        ----//////////////////----

        logButtons = logFrame.logButtons
        consoleFrame = logFrame.consoleFrame

        outputCBX = logButtons.logOutput.Button
        warningCBX = logButtons.logWarning.Button
        errorCBX = logButtons.logError.Button
        infoCBX = logButtons.logInfo.Button
        consoleclrbtn = logButtons.cclrbtn

        local function ccupdt(value, button)
            if _G[value] then
                button.Image = "rbxassetid://3926305904"
                button.ImageRectSize = Vector2.new(36, 36) 
                button.ImageRectOffset = Vector2.new(724, 724) 
            else
                button.Image = "rbxassetid://3926311105"        
                button.ImageRectSize = Vector2.new(48, 48) 
                button.ImageRectOffset = Vector2.new(4, 836) 
            end
        end

        outputCBX.Activated:Connect(function()
            ccupdt("logPrint",outputCBX)
            _G.logPrint = not _G.logPrint
            print(_G.logPrint)
        end)

        warningCBX.Activated:Connect(function()
            ccupdt("logWarn",warningCBX)
            _G.logWarn = not _G.logWarn
        end)

        errorCBX.Activated:Connect(function()
            ccupdt("logError",errorCBX)
            _G.logError = not _G.logError
        end)

        infoCBX.Activated:Connect(function()
            ccupdt("logInfo",infoCBX)
            _G.logInfo = not _G.logInfo
        end)

        consoleclrbtn.Activated:Connect(function()
            consoleFrame.TextBox.Text = ""
        end)
    end)
end

main()
loader()


