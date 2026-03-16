-- 191 FPS ⚡ SUPER KENTANG EDITION
-- Script Boost FPS UNTUK KENTANG BANGET (300+ FPS)
-- GUNAKAN INI KALO DEVICE LU KENTANG PARAH

-- GUI Library KENTANG EDITION
local library = {}
local fpsIndicator = nil
local fpsRunning = false

-- Fungsi utama membuat GUI KENTANG (Simple pol)
function library:CreateMain()
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "191FPS_Kentang"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 999
    
    -- Main Container - HITAM PEKAT
    local mainContainer = Instance.new("Frame")
    mainContainer.Name = "MainContainer"
    mainContainer.Size = UDim2.new(0, 280, 0, 350)
    mainContainer.Position = UDim2.new(0.5, -140, 0.5, -175)
    mainContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    mainContainer.BackgroundTransparency = 0
    mainContainer.BorderSizePixel = 2
    mainContainer.BorderColor3 = Color3.fromRGB(255, 215, 0)
    mainContainer.Active = true
    mainContainer.Draggable = true
    mainContainer.Parent = screenGui
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 35)
    titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    titleBar.BorderSizePixel = 1
    titleBar.BorderColor3 = Color3.fromRGB(255, 215, 0)
    titleBar.Parent = mainContainer
    
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, -40, 1, 0)
    titleText.Position = UDim2.new(0, 10, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "⚡ 191 FPS KENTANG ⚡"
    titleText.TextColor3 = Color3.fromRGB(255, 215, 0)
    titleText.TextSize = 16
    titleText.Font = Enum.Font.SourceSansBold
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 30, 0, 25)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 16
    closeBtn.Font = Enum.Font.SourceSansBold
    closeBtn.BorderSizePixel = 1
    closeBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    closeBtn.Parent = titleBar
    
    -- Tab Buttons
    local tab1Btn = Instance.new("TextButton")
    tab1Btn.Name = "Tab1Btn"
    tab1Btn.Size = UDim2.new(0.5, -2, 0, 30)
    tab1Btn.Position = UDim2.new(0, 2, 0, 40)
    tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    tab1Btn.Text = "BOOST"
    tab1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    tab1Btn.TextSize = 16
    tab1Btn.Font = Enum.Font.SourceSansBold
    tab1Btn.BorderSizePixel = 1
    tab1Btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    tab1Btn.Parent = mainContainer
    
    local tab2Btn = Instance.new("TextButton")
    tab2Btn.Name = "Tab2Btn"
    tab2Btn.Size = UDim2.new(0.5, -2, 0, 30)
    tab2Btn.Position = UDim2.new(0.5, 2, 0, 40)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tab2Btn.Text = "SETTING"
    tab2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab2Btn.TextSize = 16
    tab2Btn.Font = Enum.Font.SourceSansBold
    tab2Btn.BorderSizePixel = 1
    tab2Btn.BorderColor3 = Color3.fromRGB(255, 215, 0)
    tab2Btn.Parent = mainContainer
    
    -- Content Frames
    local boostContent = Instance.new("Frame")
    boostContent.Name = "BoostContent"
    boostContent.Size = UDim2.new(1, -10, 1, -100)
    boostContent.Position = UDim2.new(0, 5, 0, 75)
    boostContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    boostContent.BorderSizePixel = 1
    boostContent.BorderColor3 = Color3.fromRGB(255, 215, 0)
    boostContent.Visible = true
    boostContent.Parent = mainContainer
    
    local settingContent = Instance.new("Frame")
    settingContent.Name = "SettingContent"
    settingContent.Size = UDim2.new(1, -10, 1, -100)
    settingContent.Position = UDim2.new(0, 5, 0, 75)
    settingContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    settingContent.BorderSizePixel = 1
    settingContent.BorderColor3 = Color3.fromRGB(255, 215, 0)
    settingContent.Visible = false
    settingContent.Parent = mainContainer
    
    -- Tab switching
    tab1Btn.MouseButton1Click:Connect(function()
        tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        tab2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        boostContent.Visible = true
        settingContent.Visible = false
    end)
    
    tab2Btn.MouseButton1Click:Connect(function()
        tab2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        tab1Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        settingContent.Visible = true
        boostContent.Visible = false
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        if fpsIndicator then
            fpsIndicator:Destroy()
            fpsIndicator = nil
            fpsRunning = false
        end
    end)
    
    -- Isi konten BOOST
    self:CreateBoostKentang(boostContent)
    
    -- Isi konten SETTING
    self:CreateSettingKentang(settingContent)
    
    -- Icon floating sederhana
    self:CreateIconKentang(screenGui, mainContainer)
    
    return screenGui
end

-- Icon kentang
function library:CreateIconKentang(parentScreenGui, mainFrame)
    local icon = Instance.new("TextButton")
    icon.Name = "IconKentang"
    icon.Size = UDim2.new(0, 50, 0, 50)
    icon.Position = UDim2.new(0.9, -25, 0.1, 0)
    icon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    icon.Text = "⚡"
    icon.TextColor3 = Color3.fromRGB(255, 215, 0)
    icon.TextSize = 30
    icon.Font = Enum.Font.SourceSansBold
    icon.BorderSizePixel = 2
    icon.BorderColor3 = Color3.fromRGB(255, 215, 0)
    icon.Draggable = true
    icon.Parent = parentScreenGui
    
    icon.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)
end

-- BOOST KENTANG EDITION (SUPER DUPER EXTREME)
function library:CreateBoostKentang(parent)
    local yPos = 10
    
    -- Label
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 25)
    label.Position = UDim2.new(0, 10, 0, yPos)
    label.BackgroundTransparency = 1
    label.Text = "⚡ PILIH LEVEL KENTANG ⚡"
    label.TextColor3 = Color3.fromRGB(255, 215, 0)
    label.TextSize = 16
    label.Font = Enum.Font.SourceSansBold
    label.Parent = parent
    yPos = yPos + 30
    
    -- LEVEL 1 (Basic)
    local btn1 = Instance.new("TextButton")
    btn1.Size = UDim2.new(1, -20, 0, 40)
    btn1.Position = UDim2.new(0, 10, 0, yPos)
    btn1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn1.Text = "LEVEL 1 - BASIC KENTANG\n(Hapus Shader, Texture, Image)"
    btn1.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn1.TextSize = 14
    btn1.Font = Enum.Font.SourceSans
    btn1.BorderSizePixel = 1
    btn1.BorderColor3 = Color3.fromRGB(255, 215, 0)
    btn1.Parent = parent
    yPos = yPos + 45
    
    -- LEVEL 2 (Super Kentang)
    local btn2 = Instance.new("TextButton")
    btn2.Size = UDim2.new(1, -20, 0, 50)
    btn2.Position = UDim2.new(0, 10, 0, yPos)
    btn2.BackgroundColor3 = Color3.fromRGB(50, 20, 0)
    btn2.Text = "⚡ LEVEL 2 - SUPER KENTANG ⚡\n(Hapus SEMUA + Setting RENDER KE 0)"
    btn2.TextColor3 = Color3.fromRGB(255, 215, 0)
    btn2.TextSize = 14
    btn2.Font = Enum.Font.SourceSansBold
    btn2.BorderSizePixel = 2
    btn2.BorderColor3 = Color3.fromRGB(255, 215, 0)
    btn2.Parent = parent
    yPos = yPos + 55
    
    -- LEVEL 3 - KENTANG BUSUK (MAX 300+ FPS)
    local btn3 = Instance.new("TextButton")
    btn3.Size = UDim2.new(1, -20, 0, 60)
    btn3.Position = UDim2.new(0, 10, 0, yPos)
    btn3.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    btn3.Text = "🔥🔥 LEVEL 3 - KENTANG BUSUK 🔥🔥\n(HAPUS SEMUA + FREEZE RENDER + 300+ FPS)"
    btn3.TextColor3 = Color3.fromRGB(255, 255, 0)
    btn3.TextSize = 14
    btn3.Font = Enum.Font.SourceSansBold
    btn3.BorderSizePixel = 3
    btn3.BorderColor3 = Color3.fromRGB(255, 0, 0)
    btn3.Parent = parent
    yPos = yPos + 65
    
    -- Status
    local status = Instance.new("TextLabel")
    status.Name = "StatusKentang"
    status.Size = UDim2.new(1, -20, 0, 30)
    status.Position = UDim2.new(0, 10, 0, yPos)
    status.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    status.Text = "STATUS: SIAP KENTANG"
    status.TextColor3 = Color3.fromRGB(255, 215, 0)
    status.TextSize = 14
    status.Font = Enum.Font.SourceSansBold
    status.BorderSizePixel = 1
    status.BorderColor3 = Color3.fromRGB(255, 215, 0)
    status.Parent = parent
    
    -- LEVEL 1 FUNCTION
    btn1.MouseButton1Click:Connect(function()
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") then
                    v:Destroy()
                end
            end
            status.Text = "STATUS: LEVEL 1 ACTIVE"
            btn1.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
        end)
    end)
    
    -- LEVEL 2 FUNCTION (SUPER KENTANG)
    btn2.MouseButton1Click:Connect(function()
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") or v:IsA("Shadow") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                    v:Destroy()
                end
            end
            
            local lighting = game:GetService("Lighting")
            lighting.Brightness = 2
            lighting.GlobalShadows = false
            lighting.FogEnd = 0
            lighting.FogStart = 0
            lighting.Outlines = false
            lighting.Ambient = Color3.fromRGB(255, 255, 255)
            
            local render = settings():GetService("RenderSettings")
            render.QualityLevel = 1
            render.MaterialQuality = Enum.MaterialQuality.Low
            
            status.Text = "STATUS: LEVEL 2 SUPER KENTANG"
            btn2.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
        end)
    end)
    
    -- LEVEL 3 FUNCTION (KENTANG BUSUK - 300+ FPS)
    btn3.MouseButton1Click:Connect(function()
        pcall(function()
            -- HAPUS SEMUA YANG ADA DI WORKSPACE
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.Plastic
                    v.Reflectance = 0
                    v.Transparency = 0
                end
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") or v:IsA("Shadow") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") then
                    v:Destroy()
                end
            end
            
            -- SETTING LIGHTING PALING EKSTREM
            local lighting = game:GetService("Lighting")
            lighting.Brightness = 2
            lighting.GlobalShadows = false
            lighting.FogEnd = 0
            lighting.FogStart = 0
            lighting.Outlines = false
            lighting.Ambient = Color3.fromRGB(255, 255, 255)
            lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
            lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
            lighting.EnvironmentDiffuseScale = 0
            lighting.EnvironmentSpecularScale = 0
            
            -- RENDER SETTING PALING RENDAH
            local render = settings():GetService("RenderSettings")
            render.QualityLevel = 1
            render.MaterialQuality = Enum.MaterialQuality.Low
            render.RenderQuality = Enum.RenderQuality.Low
            render.AntiAliasingQuality = 0
            
            -- MATIKAN SEMUA EFEK VISUAL
            game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
            
            -- FORCE LOW GRAPHICS
            for i = 1, 10 do
                settings().Rendering.QualityLevel = 1
            end
            
            status.Text = "🔥 STATUS: KENTANG BUSUK 300+ FPS 🔥"
            status.TextColor3 = Color3.fromRGB(255, 0, 0)
            btn3.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            btn3.Text = "🔥🔥 AKTIF 300+ FPS 🔥🔥"
        end)
    end)
end

-- SETTING KENTANG
function library:CreateSettingKentang(parent)
    local yPos = 10
    
    -- FPS INDICATOR TOGGLE
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 25)
    label.Position = UDim2.new(0, 10, 0, yPos)
    label.BackgroundTransparency = 1
    label.Text = "FPS INDICATOR"
    label.TextColor3 = Color3.fromRGB(255, 215, 0)
    label.TextSize = 16
    label.Font = Enum.Font.SourceSansBold
    label.Parent = parent
    yPos = yPos + 30
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0.8, -20, 0, 35)
    toggleBtn.Position = UDim2.new(0.1, 10, 0, yPos)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    toggleBtn.Text = "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.TextSize = 18
    toggleBtn.Font = Enum.Font.SourceSansBold
    toggleBtn.BorderSizePixel = 2
    toggleBtn.BorderColor3 = Color3.fromRGB(255, 215, 0)
    toggleBtn.Parent = parent
    yPos = yPos + 45
    
    local fpsEnabled = false
    
    toggleBtn.MouseButton1Click:Connect(function()
        fpsEnabled = not fpsEnabled
        if fpsEnabled then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            toggleBtn.Text = "ON"
            startFPSKentang()
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            toggleBtn.Text = "OFF"
            if fpsIndicator then
                fpsIndicator:Destroy()
                fpsIndicator = nil
                fpsRunning = false
            end
        end
    end)
    
    -- INFO
    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(1, -20, 0, 80)
    info.Position = UDim2.new(0, 10, 0, yPos + 10)
    info.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    info.Text = "⚠️ INFO KENTANG:\nLEVEL 3 = HAPUS SEMUA + SETTING RENDER KE 0\nCOCOK BUAT KOMPUTER PENTIUM 4"
    info.TextColor3 = Color3.fromRGB(255, 200, 0)
    info.TextSize = 12
    info.Font = Enum.Font.SourceSans
    info.TextWrapped = true
    info.BorderSizePixel = 1
    info.BorderColor3 = Color3.fromRGB(255, 215, 0)
    info.Parent = parent
end

-- FPS INDICATOR KENTANG
function startFPSKentang()
    if fpsIndicator then
        fpsIndicator:Destroy()
    end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FPSKentang"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 80, 0, 30)
    frame.Position = UDim2.new(0, 10, 0, 100)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = screenGui
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "FPS: 0"
    text.TextColor3 = Color3.fromRGB(0, 255, 0)
    text.TextSize = 16
    text.Font = Enum.Font.SourceSansBold
    text.Parent = frame
    
    fpsIndicator = screenGui
    fpsRunning = true
    
    local lastTime = tick()
    local frames = 0
    local fps = 0
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if fpsRunning and fpsIndicator and fpsIndicator.Parent then
            frames = frames + 1
            local currentTime = tick()
            if currentTime - lastTime >= 0.5 then
                fps = math.floor((frames / (currentTime - lastTime)) * 2)
                text.Text = "FPS: " .. fps
                
                if fps > 200 then
                    text.TextColor3 = Color3.fromRGB(255, 0, 255)
                    text.Text = "FPS: " .. fps .. " 🔥"
                elseif fps > 100 then
                    text.TextColor3 = Color3.fromRGB(0, 255, 0)
                elseif fps > 50 then
                    text.TextColor3 = Color3.fromRGB(255, 255, 0)
                else
                    text.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
                
                frames = 0
                lastTime = currentTime
            end
        end
    end)
end

-- JALANKAN
local success, err = pcall(function()
    -- Hapus yang lama
    local old = game:GetService("CoreGui"):FindFirstChild("191FPS_Kentang")
    if old then old:Destroy() end
    
    local gui = library:CreateMain()
    gui.Parent = game:GetService("CoreGui")
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "⚡ KENTANG EDITION ⚡",
        Text = "SIAP MAKAN KENTANG 300+ FPS!",
        Duration = 3
    })
end)

if not success then
    warn("Error: " .. tostring(err))
end
