-- 191 FPS ⚡ Hub Modern
-- Script Boost FPS Ekstrem dengan GUI Modern & Smooth

-- GUI Library Modern
local library = {}
local gui = {}
local fpsIndicator = nil
local fpsRunning = false
local blurEffect = nil
local uiCorner = 12

-- Fungsi untuk membuat efek blur (Modern)
function library:CreateBlur(parent)
    local blur = Instance.new("BlurEffect")
    blur.Name = "UIBlur"
    blur.Size = 0
    blur.Parent = parent
    return blur
end

-- Fungsi untuk membuat shadow modern
function library:CreateShadow(parent, size, transparency)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, size*2, 1, size*2)
    shadow.Position = UDim2.new(0, -size, 0, -size)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = transparency or 0.7
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.Parent = parent
end

-- Fungsi utama membuat GUI Modern
function library:CreateMain()
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "191FPSHub_Modern"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 999
    
    -- Auto detect untuk handphone
    local isMobile = game:GetService("UserInputService").TouchEnabled
    local guiSize = isMobile and UDim2.new(0, 300, 0, 420) or UDim2.new(0, 340, 0, 450)
    
    -- Blur Background Effect
    local blur = Instance.new("Frame")
    blur.Name = "BackgroundBlur"
    blur.Size = UDim2.new(1, 0, 1, 0)
    blur.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    blur.BackgroundTransparency = 0.5
    blur.BorderSizePixel = 0
    blur.Parent = screenGui
    
    -- Main Container
    local mainContainer = Instance.new("Frame")
    mainContainer.Name = "MainContainer"
    mainContainer.Size = guiSize
    mainContainer.Position = UDim2.new(0.5, -guiSize.X.Offset/2, 0.5, -guiSize.Y.Offset/2)
    mainContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    mainContainer.BackgroundTransparency = 0.05
    mainContainer.BorderSizePixel = 0
    mainContainer.Active = true
    mainContainer.Draggable = true
    mainContainer.ClipsDescendants = true
    mainContainer.Parent = screenGui
    
    -- Rounded Corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, uiCorner)
    corner.Parent = mainContainer
    
    -- Stroke (Border)
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 70)
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.Parent = mainContainer
    
    -- Shadow
    self:CreateShadow(mainContainer, 12, 0.6)
    
    -- Gradient Line Atas
    local topGradient = Instance.new("Frame")
    topGradient.Name = "TopGradient"
    topGradient.Size = UDim2.new(1, 0, 0, 3)
    topGradient.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    topGradient.BorderSizePixel = 0
    topGradient.Parent = mainContainer
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 215, 0))
    })
    gradient.Rotation = 90
    gradient.Parent = topGradient
    
    -- Title Bar Modern
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 50)
    titleBar.BackgroundTransparency = 1
    titleBar.Parent = mainContainer
    
    -- Icon Title
    local titleIcon = Instance.new("TextLabel")
    titleIcon.Name = "TitleIcon"
    titleIcon.Size = UDim2.new(0, 40, 0, 40)
    titleIcon.Position = UDim2.new(0, 15, 0, 5)
    titleIcon.BackgroundTransparency = 1
    titleIcon.Text = "⚡"
    titleIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
    titleIcon.TextScaled = true
    titleIcon.Font = Enum.Font.GothamBold
    titleIcon.Parent = titleBar
    
    -- Title Text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(0, 150, 0, 30)
    titleText.Position = UDim2.new(0, 60, 0, 10)
    titleText.BackgroundTransparency = 1
    titleText.Text = "191 FPS"
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextSize = 20
    titleText.Font = Enum.Font.GothamBold
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    -- Version Text
    local versionText = Instance.new("TextLabel")
    versionText.Name = "VersionText"
    versionText.Size = UDim2.new(0, 60, 0, 20)
    versionText.Position = UDim2.new(0, 60, 0, 30)
    versionText.BackgroundTransparency = 1
    versionText.Text = "v2.0"
    versionText.TextColor3 = Color3.fromRGB(180, 180, 180)
    versionText.TextSize = 12
    versionText.Font = Enum.Font.Gotham
    versionText.TextXAlignment = Enum.TextXAlignment.Left
    versionText.Parent = titleBar
    
    -- Close Button Modern
    local closeBtn = Instance.new("ImageButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 35, 0, 35)
    closeBtn.Position = UDim2.new(1, -45, 0, 7.5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    closeBtn.AutoButtonColor = false
    closeBtn.Image = "rbxassetid://6031094672"
    closeBtn.ImageColor3 = Color3.fromRGB(255, 100, 100)
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = titleBar
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeBtn
    
    -- Tab Buttons Modern
    local tabFrame = Instance.new("Frame")
    tabFrame.Name = "TabFrame"
    tabFrame.Size = UDim2.new(1, -30, 0, 45)
    tabFrame.Position = UDim2.new(0, 15, 0, 50)
    tabFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
    tabFrame.BorderSizePixel = 0
    tabFrame.Parent = mainContainer
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 10)
    tabCorner.Parent = tabFrame
    
    -- Tab 1 Button Modern
    local tab1Btn = Instance.new("TextButton")
    tab1Btn.Name = "Tab1Btn"
    tab1Btn.Size = UDim2.new(0.5, -5, 1, -10)
    tab1Btn.Position = UDim2.new(0, 5, 0, 5)
    tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    tab1Btn.Text = "FPS BOOST"
    tab1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    tab1Btn.TextSize = 16
    tab1Btn.Font = Enum.Font.GothamBold
    tab1Btn.BorderSizePixel = 0
    tab1Btn.AutoButtonColor = false
    tab1Btn.Parent = tabFrame
    
    local tab1Corner = Instance.new("UICorner")
    tab1Corner.CornerRadius = UDim.new(0, 8)
    tab1Corner.Parent = tab1Btn
    
    -- Tab 2 Button Modern
    local tab2Btn = Instance.new("TextButton")
    tab2Btn.Name = "Tab2Btn"
    tab2Btn.Size = UDim2.new(0.5, -5, 1, -10)
    tab2Btn.Position = UDim2.new(0.5, 5, 0, 5)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(38, 38, 42)
    tab2Btn.Text = "SETTINGS"
    tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    tab2Btn.TextSize = 16
    tab2Btn.Font = Enum.Font.GothamBold
    tab2Btn.BorderSizePixel = 0
    tab2Btn.AutoButtonColor = false
    tab2Btn.Parent = tabFrame
    
    local tab2Corner = Instance.new("UICorner")
    tab2Corner.CornerRadius = UDim.new(0, 8)
    tab2Corner.Parent = tab2Btn
    
    -- Content Frame Modern
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -30, 1, -150)
    contentFrame.Position = UDim2.new(0, 15, 0, 105)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainContainer
    
    -- Tab 1 Content (FPS BOOST)
    local tab1Content = Instance.new("Frame")
    tab1Content.Name = "Tab1Content"
    tab1Content.Size = UDim2.new(1, 0, 1, 0)
    tab1Content.BackgroundTransparency = 1
    tab1Content.Visible = true
    tab1Content.Parent = contentFrame
    
    -- Tab 2 Content (SETTINGS)
    local tab2Content = Instance.new("Frame")
    tab2Content.Name = "Tab2Content"
    tab2Content.Size = UDim2.new(1, 0, 1, 0)
    tab2Content.BackgroundTransparency = 1
    tab2Content.Visible = false
    tab2Content.Parent = contentFrame
    
    -- Tab switching dengan animasi
    tab1Btn.MouseButton1Click:Connect(function()
        tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        tab1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        tab2Btn.BackgroundColor3 = Color3.fromRGB(38, 38, 42)
        tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        tab1Content.Visible = true
        tab2Content.Visible = false
    end)
    
    tab2Btn.MouseButton1Click:Connect(function()
        tab2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        tab2Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        tab1Btn.BackgroundColor3 = Color3.fromRGB(38, 38, 42)
        tab1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        tab2Content.Visible = true
        tab1Content.Visible = false
    end)
    
    -- Close button
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        if fpsIndicator then
            fpsIndicator:Destroy()
            fpsIndicator = nil
            fpsRunning = false
        end
    end)
    
    -- Buat konten untuk Tab 1 (FPS BOOST)
    self:CreateBoostTabModern(tab1Content)
    
    -- Buat konten untuk Tab 2 (SETTINGS)
    self:CreateSettingTabModern(tab2Content)
    
    -- Buat icon floating modern
    self:CreateFloatingIconModern(screenGui, mainContainer)
    
    return screenGui
end

-- Fungsi untuk membuat icon floating modern
function library:CreateFloatingIconModern(parentScreenGui, mainFrame)
    local icon = Instance.new("ImageButton")
    icon.Name = "FloatingIcon"
    icon.Size = UDim2.new(0, 60, 0, 60)
    icon.Position = UDim2.new(0.9, -30, 0.1, 0)
    icon.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    icon.AutoButtonColor = false
    icon.Image = "rbxassetid://6031108394"
    icon.ImageColor3 = Color3.fromRGB(255, 215, 0)
    icon.BorderSizePixel = 0
    icon.Draggable = true
    icon.Parent = parentScreenGui
    
    -- Icon Shadow
    local iconShadow = Instance.new("ImageLabel")
    iconShadow.Name = "IconShadow"
    iconShadow.Size = UDim2.new(1, 10, 1, 10)
    iconShadow.Position = UDim2.new(0, -5, 0, -5)
    iconShadow.BackgroundTransparency = 1
    iconShadow.Image = "rbxassetid://1316045217"
    iconShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    iconShadow.ImageTransparency = 0.7
    iconShadow.ScaleType = Enum.ScaleType.Slice
    iconShadow.SliceCenter = Rect.new(10, 10, 118, 118)
    iconShadow.Parent = icon
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 15)
    iconCorner.Parent = icon
    
    local iconStroke = Instance.new("UIStroke")
    iconStroke.Color = Color3.fromRGB(255, 215, 0)
    iconStroke.Thickness = 2
    iconStroke.Transparency = 0.3
    iconStroke.Parent = icon
    
    -- Text di dalam icon
    local iconText = Instance.new("TextLabel")
    iconText.Name = "IconText"
    iconText.Size = UDim2.new(1, 0, 1, 0)
    iconText.BackgroundTransparency = 1
    iconText.Text = "⚡"
    iconText.TextColor3 = Color3.fromRGB(255, 215, 0)
    iconText.TextScaled = true
    iconText.Font = Enum.Font.GothamBold
    iconText.Parent = icon
    
    icon.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
        -- Animasi kecil
        if mainFrame.Visible then
            mainFrame:TweenPosition(UDim2.new(0.5, -mainFrame.Size.X.Offset/2, 0.5, -mainFrame.Size.Y.Offset/2), "Out", "Quad", 0.2, true)
        end
    end)
end

-- Fungsi untuk membuat tab Boost Modern
function library:CreateBoostTabModern(parent)
    -- Scrolling Frame
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = "BoostScrolling"
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarThickness = 4
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
    scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollingFrame.Parent = parent
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.Parent = scrollingFrame
    
    -- Label Boost Level Modern
    local levelLabel = Instance.new("TextLabel")
    levelLabel.Name = "LevelLabel"
    levelLabel.Size = UDim2.new(1, 0, 0, 30)
    levelLabel.BackgroundTransparency = 1
    levelLabel.Text = "PILIH LEVEL BOOST"
    levelLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    levelLabel.TextSize = 14
    levelLabel.Font = Enum.Font.GothamBold
    levelLabel.TextXAlignment = Enum.TextXAlignment.Left
    levelLabel.Parent = scrollingFrame
    
    -- Level 1 Card Modern
    local level1Card = Instance.new("Frame")
    level1Card.Name = "Level1Card"
    level1Card.Size = UDim2.new(1, 0, 0, 90)
    level1Card.Position = UDim2.new(0, 0, 0, 40)
    level1Card.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
    level1Card.BorderSizePixel = 0
    level1Card.Parent = scrollingFrame
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 12)
    cardCorner.Parent = level1Card
    
    -- Level 1 Icon
    local level1Icon = Instance.new("TextLabel")
    level1Icon.Name = "Level1Icon"
    level1Icon.Size = UDim2.new(0, 40, 0, 40)
    level1Icon.Position = UDim2.new(0, 15, 0, 10)
    level1Icon.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    level1Icon.Text = "1"
    level1Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    level1Icon.TextSize = 20
    level1Icon.Font = Enum.Font.GothamBold
    level1Icon.Parent = level1Card
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 10)
    iconCorner.Parent = level1Icon
    
    -- Level 1 Title
    local level1Title = Instance.new("TextLabel")
    level1Title.Name = "Level1Title"
    level1Title.Size = UDim2.new(0, 200, 0, 20)
    level1Title.Position = UDim2.new(0, 65, 0, 10)
    level1Title.BackgroundTransparency = 1
    level1Title.Text = "Basic Boost"
    level1Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    level1Title.TextSize = 16
    level1Title.Font = Enum.Font.GothamBold
    level1Title.TextXAlignment = Enum.TextXAlignment.Left
    level1Title.Parent = level1Card
    
    -- Level 1 Desc
    local level1Desc = Instance.new("TextLabel")
    level1Desc.Name = "Level1Desc"
    level1Desc.Size = UDim2.new(0, 200, 0, 35)
    level1Desc.Position = UDim2.new(0, 65, 0, 30)
    level1Desc.BackgroundTransparency = 1
    level1Desc.Text = "Remove shaders, textures, images"
    level1Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    level1Desc.TextSize = 12
    level1Desc.Font = Enum.Font.Gotham
    level1Desc.TextXAlignment = Enum.TextXAlignment.Left
    level1Desc.TextWrapped = true
    level1Desc.Parent = level1Card
    
    -- Level 1 Button Modern
    local level1Btn = Instance.new("TextButton")
    level1Btn.Name = "Level1Btn"
    level1Btn.Size = UDim2.new(0, 70, 0, 35)
    level1Btn.Position = UDim2.new(1, -85, 0, 27.5)
    level1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    level1Btn.Text = "BOOST"
    level1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    level1Btn.TextSize = 14
    level1Btn.Font = Enum.Font.GothamBold
    level1Btn.BorderSizePixel = 0
    level1Btn.AutoButtonColor = false
    level1Btn.Parent = level1Card
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = level1Btn
    
    -- Level 2 Card Modern (MAX)
    local level2Card = Instance.new("Frame")
    level2Card.Name = "Level2Card"
    level2Card.Size = UDim2.new(1, 0, 0, 110)
    level2Card.Position = UDim2.new(0, 0, 0, 140)
    level2Card.BackgroundColor3 = Color3.fromRGB(38, 28, 18)
    level2Card.BorderSizePixel = 0
    level2Card.Parent = scrollingFrame
    
    local card2Corner = Instance.new("UICorner")
    card2Corner.CornerRadius = UDim.new(0, 12)
    card2Corner.Parent = level2Card
    
    -- Level 2 Glow
    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.Size = UDim2.new(1, 10, 1, 10)
    glow.Position = UDim2.new(0, -5, 0, -5)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://5028857084"
    glow.ImageColor3 = Color3.fromRGB(255, 215, 0)
    glow.ImageTransparency = 0.7
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(10, 10, 118, 118)
    glow.Parent = level2Card
    
    -- Level 2 Icon
    local level2Icon = Instance.new("TextLabel")
    level2Icon.Name = "Level2Icon"
    level2Icon.Size = UDim2.new(0, 40, 0, 40)
    level2Icon.Position = UDim2.new(0, 15, 0, 10)
    level2Icon.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    level2Icon.Text = "⚡"
    level2Icon.TextColor3 = Color3.fromRGB(0, 0, 0)
    level2Icon.TextSize = 24
    level2Icon.Font = Enum.Font.GothamBold
    level2Icon.Parent = level2Card
    
    local icon2Corner = Instance.new("UICorner")
    icon2Corner.CornerRadius = UDim.new(0, 10)
    icon2Corner.Parent = level2Icon
    
    -- Level 2 Title
    local level2Title = Instance.new("TextLabel")
    level2Title.Name = "Level2Title"
    level2Title.Size = UDim2.new(0, 200, 0, 20)
    level2Title.Position = UDim2.new(0, 65, 0, 10)
    level2Title.BackgroundTransparency = 1
    level2Title.Text = "MAX BOOST ⚡"
    level2Title.TextColor3 = Color3.fromRGB(255, 215, 0)
    level2Title.TextSize = 18
    level2Title.Font = Enum.Font.GothamBold
    level2Title.TextXAlignment = Enum.TextXAlignment.Left
    level2Title.Parent = level2Card
    
    -- Level 2 Desc
    local level2Desc = Instance.new("TextLabel")
    level2Desc.Name = "Level2Desc"
    level2Desc.Size = UDim2.new(0, 200, 0, 50)
    level2Desc.Position = UDim2.new(0, 65, 0, 30)
    level2Desc.BackgroundTransparency = 1
    level2Desc.Text = "Remove shaders, shadows, textures, images + Low graphics (MAX FPS)"
    level2Desc.TextColor3 = Color3.fromRGB(200, 200, 150)
    level2Desc.TextSize = 12
    level2Desc.Font = Enum.Font.Gotham
    level2Desc.TextXAlignment = Enum.TextXAlignment.Left
    level2Desc.TextWrapped = true
    level2Desc.Parent = level2Card
    
    -- Level 2 Button Modern
    local level2Btn = Instance.new("TextButton")
    level2Btn.Name = "Level2Btn"
    level2Btn.Size = UDim2.new(0, 70, 0, 35)
    level2Btn.Position = UDim2.new(1, -85, 0, 37.5)
    level2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    level2Btn.Text = "MAX"
    level2Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    level2Btn.TextSize = 14
    level2Btn.Font = Enum.Font.GothamBold
    level2Btn.BorderSizePixel = 0
    level2Btn.AutoButtonColor = false
    level2Btn.Parent = level2Card
    
    local btn2Corner = Instance.new("UICorner")
    btn2Corner.CornerRadius = UDim.new(0, 8)
    btn2Corner.Parent = level2Btn
    
    -- Status Modern
    local statusFrame = Instance.new("Frame")
    statusFrame.Name = "StatusFrame"
    statusFrame.Size = UDim2.new(1, 0, 0, 50)
    statusFrame.Position = UDim2.new(0, 0, 0, 260)
    statusFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
    statusFrame.BorderSizePixel = 0
    statusFrame.Parent = scrollingFrame
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 10)
    statusCorner.Parent = statusFrame
    
    local statusIcon = Instance.new("TextLabel")
    statusIcon.Name = "StatusIcon"
    statusIcon.Size = UDim2.new(0, 30, 0, 30)
    statusIcon.Position = UDim2.new(0, 10, 0, 10)
    statusIcon.BackgroundTransparency = 1
    statusIcon.Text = "ℹ️"
    statusIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
    statusIcon.TextSize = 20
    statusIcon.Font = Enum.Font.Gotham
    statusIcon.Parent = statusFrame
    
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(1, -50, 1, 0)
    statusLabel.Position = UDim2.new(0, 45, 0, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "Status: Ready to boost"
    statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusLabel.TextSize = 14
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = statusFrame
    
    -- Level 1 Boost Function
    level1Btn.MouseButton1Click:Connect(function()
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") then
                    v:Destroy()
                end
            end
            statusLabel.Text = "Status: Level 1 Active (Basic Boost)"
            statusFrame.BackgroundColor3 = Color3.fromRGB(28, 38, 28)
        end)
    end)
    
    -- Level 2 Boost Function (MAX)
    level2Btn.MouseButton1Click:Connect(function()
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") or v:IsA("Shadow") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                    v:Destroy()
                end
            end
            
            local lighting = game:GetService("Lighting")
            lighting.Brightness = 1
            lighting.GlobalShadows = false
            lighting.FogEnd = 1e10
            lighting.Outlines = false
            
            settings():GetService("RenderSettings").QualityLevel = 1
            
            statusLabel.Text = "Status: MAX BOOST ACTIVE ⚡ (Ultra FPS)"
            statusFrame.BackgroundColor3 = Color3.fromRGB(48, 28, 18)
        end)
    end)
end

-- Fungsi untuk membuat tab Setting Modern
function library:CreateSettingTabModern(parent)
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = "SettingScrolling"
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarThickness = 4
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
    scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollingFrame.Parent = parent
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.Parent = scrollingFrame
    
    -- FPS Indicator Card Modern
    local fpsCard = Instance.new("Frame")
    fpsCard.Name = "FPSCard"
    fpsCard.Size = UDim2.new(1, 0, 0, 70)
    fpsCard.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
    fpsCard.BorderSizePixel = 0
    fpsCard.Parent = scrollingFrame
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 12)
    cardCorner.Parent = fpsCard
    
    -- Icon
    local fpsIcon = Instance.new("TextLabel")
    fpsIcon.Name = "FPSIcon"
    fpsIcon.Size = UDim2.new(0, 40, 0, 40)
    fpsIcon.Position = UDim2.new(0, 15, 0, 15)
    fpsIcon.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    fpsIcon.Text = "📊"
    fpsIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    fpsIcon.TextSize = 24
    fpsIcon.Font = Enum.Font.Gotham
    fpsIcon.Parent = fpsCard
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 10)
    iconCorner.Parent = fpsIcon
    
    -- Title
    local fpsTitle = Instance.new("TextLabel")
    fpsTitle.Name = "FPSTitle"
    fpsTitle.Size = UDim2.new(0, 150, 0, 25)
    fpsTitle.Position = UDim2.new(0, 65, 0, 12)
    fpsTitle.BackgroundTransparency = 1
    fpsTitle.Text = "FPS Indicator"
    fpsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    fpsTitle.TextSize = 16
    fpsTitle.Font = Enum.Font.GothamBold
    fpsTitle.TextXAlignment = Enum.TextXAlignment.Left
    fpsTitle.Parent = fpsCard
    
    -- Desc
    local fpsDesc = Instance.new("TextLabel")
    fpsDesc.Name = "FPSDesc"
    fpsDesc.Size = UDim2.new(0, 150, 0, 20)
    fpsDesc.Position = UDim2.new(0, 65, 0, 35)
    fpsDesc.BackgroundTransparency = 1
    fpsDesc.Text = "Show real-time FPS"
    fpsDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
    fpsDesc.TextSize = 12
    fpsDesc.Font = Enum.Font.Gotham
    fpsDesc.TextXAlignment = Enum.TextXAlignment.Left
    fpsDesc.Parent = fpsCard
    
    -- Toggle Switch Modern
    local toggleBtn = Instance.new("ImageButton")
    toggleBtn.Name = "ToggleBtn"
    toggleBtn.Size = UDim2.new(0, 60, 0, 30)
    toggleBtn.Position = UDim2.new(1, -75, 0, 20)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    toggleBtn.AutoButtonColor = false
    toggleBtn.Image = "rbxassetid://3570695787"
    toggleBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.ScaleType = Enum.ScaleType.Slice
    toggleBtn.SliceCenter = Rect.new(20, 20, 280, 280)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = fpsCard
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 15)
    toggleCorner.Parent = toggleBtn
    
    local toggleKnob = Instance.new("Frame")
    toggleKnob.Name = "ToggleKnob"
    toggleKnob.Size = UDim2.new(0, 26, 0, 26)
    toggleKnob.Position = UDim2.new(0, 2, 0, 2)
    toggleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleKnob.BorderSizePixel = 0
    toggleKnob.Parent = toggleBtn
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(0, 13)
    knobCorner.Parent = toggleKnob
    
    local fpsEnabled = false
    
    -- Info Card
    local infoCard = Instance.new("Frame")
    infoCard.Name = "InfoCard"
    infoCard.Size = UDim2.new(1, 0, 0, 100)
    infoCard.Position = UDim2.new(0, 0, 0, 90)
    infoCard.BackgroundColor3 = Color3.fromRGB(28, 18, 18)
    infoCard.BorderSizePixel = 0
    infoCard.Parent = scrollingFrame
    
    local infoCorner = Instance.new("UICorner")
    infoCorner.CornerRadius = UDim.new(0, 12)
    infoCorner.Parent = infoCard
    
    local infoIcon = Instance.new("TextLabel")
    infoIcon.Name = "InfoIcon"
    infoIcon.Size = UDim2.new(0, 30, 0, 30)
    infoIcon.Position = UDim2.new(0, 15, 0, 10)
    infoIcon.BackgroundTransparency = 1
    infoIcon.Text = "⚠️"
    infoIcon.TextColor3 = Color3.fromRGB(255, 200, 0)
    infoIcon.TextSize = 24
    infoIcon.Font = Enum.Font.Gotham
    infoIcon.Parent = infoCard
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "InfoLabel"
    infoLabel.Size = UDim2.new(1, -50, 1, -20)
    infoLabel.Position = UDim2.new(0, 50, 0, 10)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = "⚠️ MAX BOOST akan menghapus hampir semua efek grafis untuk FPS maksimal. Cocok untuk device low-end!"
    infoLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    infoLabel.TextSize = 13
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.TextWrapped = true
    infoLabel.TextXAlignment = Enum.TextXAlignment.Left
    infoLabel.Parent = infoCard
    
    -- Toggle function
    toggleBtn.MouseButton1Click:Connect(function()
        fpsEnabled = not fpsEnabled
        if fpsEnabled then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            toggleKnob:TweenPosition(UDim2.new(0, 32, 0, 2), "Out", "Quad", 0.1, true)
            self:StartFPSIndicatorModern()
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            toggleKnob:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.1, true)
            self:StopFPSIndicator()
        end
    end)
end

-- Fungsi FPS Indicator Modern
function library:StartFPSIndicatorModern()
    if fpsIndicator then
        fpsIndicator:Destroy()
    end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FPSIndicator_Modern"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 1000
    screenGui.Parent = game:GetService("CoreGui")
    
    local frame = Instance.new("Frame")
    frame.Name = "FPSFrame"
    frame.Size = UDim2.new(0, 90, 0, 40)
    frame.Position = UDim2.new(0, 20, 0, 60)
    frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = screenGui
    
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 12)
    frameCorner.Parent = frame
    
    local frameStroke = Instance.new("UIStroke")
    frameStroke.Color = Color3.fromRGB(255, 215, 0)
    frameStroke.Thickness = 1
    frameStroke.Transparency = 0.5
    frameStroke.Parent = frame
    
    local fpsValue = Instance.new("TextLabel")
    fpsValue.Name = "FPSValue"
    fpsValue.Size = UDim2.new(0.5, 0, 1, 0)
    fpsValue.Position = UDim2.new(0, 10, 0, 0)
    fpsValue.BackgroundTransparency = 1
    fpsValue.Text = "60"
    fpsValue.TextColor3 = Color3.fromRGB(0, 255, 0)
    fpsValue.TextSize = 24
    fpsValue.Font = Enum.Font.GothamBold
    fpsValue.TextXAlignment = Enum.TextXAlignment.Left
    fpsValue.Parent = frame
    
    local fpsLabel = Instance.new("TextLabel")
    fpsLabel.Name = "FPSLabel"
    fpsLabel.Size = UDim2.new(0.5, 0, 1, 0)
    fpsLabel.Position = UDim2.new(0.5, -10, 0, 0)
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.Text = "FPS"
    fpsLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    fpsLabel.TextSize = 16
    fpsLabel.Font = Enum.Font.Gotham
    fpsLabel.TextXAlignment = Enum.TextXAlignment.Right
    fpsLabel.Parent = frame
    
    fpsIndicator = screenGui
    fpsRunning = true
    
    local lastIteration = tick()
    local frameCount = 0
    local fps = 60
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if fpsRunning and fpsIndicator and fpsIndicator.Parent then
            frameCount = frameCount + 1
            local currentTime = tick()
            local timePassed = currentTime - lastIteration
            
            if timePassed >= 1 then
                fps = math.floor(frameCount / timePassed)
                fpsValue.Text = tostring(fps)
                
                if fps >= 45 then
                    fpsValue.TextColor3 = Color3.fromRGB(0, 255, 0)
                elseif fps >= 30 then
                    fpsValue.TextColor3 = Color3.fromRGB(255, 255, 0)
                else
                    fpsValue.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
                
                frameCount = 0
                lastIteration = currentTime
            end
        end
    end)
end

function library:StopFPSIndicator()
    if fpsIndicator then
        fpsIndicator:Destroy()
        fpsIndicator = nil
    end
    fpsRunning = false
end

-- Eksekusi utama
local success, err = pcall(function()
    local mainGui = library:CreateMain()
    mainGui.Parent = game:GetService("CoreGui")
    
    -- Notifikasi sukses
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "191 FPS ⚡ Modern",
        Text = "GUI Modern berhasil dimuat!",
        Icon = "rbxassetid://6031108394",
        Duration = 3
    })
end)

if not success then
    warn("Error: " .. tostring(err))
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Error",
        Text = "Gagal memuat: " .. tostring(err),
        Duration = 5
    })
end
