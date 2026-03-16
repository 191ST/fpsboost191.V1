-- 191 FPS ⚡ Hub
-- Script Boost FPS Ekstrem dengan GUI Sederhana

-- GUI Library
local library = {}
local gui = {}
local fpsIndicator = nil
local fpsRunning = false

-- Fungsi untuk membuat GUI
function library:CreateMain()
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "191FPSHub"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Auto detect untuk handphone
    local isMobile = game:GetService("UserInputService").TouchEnabled
    local guiSize = isMobile and UDim2.new(0, 280, 0, 350) or UDim2.new(0, 300, 0, 380)
    
    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = guiSize
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -190)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui
    
    -- Shadow
    local shadow = Instance.new("Frame")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 4, 1, 4)
    shadow.Position = UDim2.new(0, -2, 0, -2)
    shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    shadow.BackgroundTransparency = 0.5
    shadow.BorderSizePixel = 0
    shadow.Parent = mainFrame
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 35)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    
    -- Title Text
    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(1, -40, 1, 0)
    titleText.Position = UDim2.new(0, 10, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "191 FPS ⚡"
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextScaled = true
    titleText.Font = Enum.Font.GothamBold
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseBtn"
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 2.5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    closeBtn.TextScaled = true
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = titleBar
    
    -- Tab Buttons Frame
    local tabFrame = Instance.new("Frame")
    tabFrame.Name = "TabFrame"
    tabFrame.Size = UDim2.new(1, 0, 0, 40)
    tabFrame.Position = UDim2.new(0, 0, 0, 35)
    tabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    tabFrame.BorderSizePixel = 0
    tabFrame.Parent = mainFrame
    
    -- Tab 1 Button
    local tab1Btn = Instance.new("TextButton")
    tab1Btn.Name = "Tab1Btn"
    tab1Btn.Size = UDim2.new(0.5, -2, 1, -4)
    tab1Btn.Position = UDim2.new(0, 2, 0, 2)
    tab1Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tab1Btn.Text = "FPS SETTING"
    tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab1Btn.TextScaled = true
    tab1Btn.Font = Enum.Font.GothamSemibold
    tab1Btn.BorderSizePixel = 0
    tab1Btn.Parent = tabFrame
    
    -- Tab 2 Button
    local tab2Btn = Instance.new("TextButton")
    tab2Btn.Name = "Tab2Btn"
    tab2Btn.Size = UDim2.new(0.5, -2, 1, -4)
    tab2Btn.Position = UDim2.new(0.5, 2, 0, 2)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tab2Btn.Text = "SETTING"
    tab2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab2Btn.TextScaled = true
    tab2Btn.Font = Enum.Font.GothamSemibold
    tab2Btn.BorderSizePixel = 0
    tab2Btn.Parent = tabFrame
    
    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -20, 1, -115)
    contentFrame.Position = UDim2.new(0, 10, 0, 85)
    contentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    contentFrame.BorderSizePixel = 0
    contentFrame.Parent = mainFrame
    
    -- Tab 1 Content
    local tab1Content = Instance.new("Frame")
    tab1Content.Name = "Tab1Content"
    tab1Content.Size = UDim2.new(1, 0, 1, 0)
    tab1Content.BackgroundTransparency = 1
    tab1Content.Visible = true
    tab1Content.Parent = contentFrame
    
    -- Tab 2 Content
    local tab2Content = Instance.new("Frame")
    tab2Content.Name = "Tab2Content"
    tab2Content.Size = UDim2.new(1, 0, 1, 0)
    tab2Content.BackgroundTransparency = 1
    tab2Content.Visible = false
    tab2Content.Parent = contentFrame
    
    -- Tab switching
    tab1Btn.MouseButton1Click:Connect(function()
        tab1Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        tab2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        tab1Content.Visible = true
        tab2Content.Visible = false
    end)
    
    tab2Btn.MouseButton1Click:Connect(function()
        tab2Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        tab1Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
    
    -- Buat konten untuk Tab 1 (FPS SETTING)
    self:CreateBoostTab(tab1Content)
    
    -- Buat konten untuk Tab 2 (SETTING)
    self:CreateSettingTab(tab2Content)
    
    -- Buat icon floating
    self:CreateFloatingIcon(screenGui)
    
    return screenGui
end

-- Fungsi untuk membuat icon floating
function library:CreateFloatingIcon(parentScreenGui)
    local icon = Instance.new("TextButton")
    icon.Name = "FloatingIcon"
    icon.Size = UDim2.new(0, 50, 0, 50)
    icon.Position = UDim2.new(0.9, -25, 0.1, 0)
    icon.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    icon.Text = "⚡"
    icon.TextColor3 = Color3.fromRGB(255, 255, 0)
    icon.TextScaled = true
    icon.Font = Enum.Font.GothamBold
    icon.BorderSizePixel = 0
    icon.Draggable = true
    icon.Parent = parentScreenGui
    
    local mainFrame = parentScreenGui:FindFirstChild("MainFrame")
    
    icon.MouseButton1Click:Connect(function()
        if mainFrame then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)
end

-- Fungsi untuk membuat tab Boost
function library:CreateBoostTab(parent)
    -- Label Boost Level
    local label = Instance.new("TextLabel")
    label.Name = "BoostLabel"
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Position = UDim2.new(0, 0, 0, 10)
    label.BackgroundTransparency = 1
    label.Text = "Pilih Level Boost:"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent
    
    -- Level 1 Button
    local level1Btn = Instance.new("TextButton")
    level1Btn.Name = "Level1Btn"
    level1Btn.Size = UDim2.new(1, 0, 0, 50)
    level1Btn.Position = UDim2.new(0, 0, 0, 50)
    level1Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    level1Btn.Text = "Level 1 (Shader, Texture, Image)"
    level1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    level1Btn.TextScaled = true
    level1Btn.Font = Enum.Font.Gotham
    level1Btn.BorderSizePixel = 0
    level1Btn.Parent = parent
    
    -- Level 2 Button (MAX)
    local level2Btn = Instance.new("TextButton")
    level2Btn.Name = "Level2Btn"
    level2Btn.Size = UDim2.new(1, 0, 0, 70)
    level2Btn.Position = UDim2.new(0, 0, 0, 110)
    level2Btn.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
    level2Btn.Text = "Level 2 (MAX) ⚡\nDelete Shader, Shadow, Texture, Image"
    level2Btn.TextColor3 = Color3.fromRGB(255, 200, 0)
    level2Btn.TextScaled = true
    level2Btn.Font = Enum.Font.GothamBold
    level2Btn.BorderSizePixel = 0
    level2Btn.Parent = parent
    
    -- Status Label
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(1, 0, 0, 40)
    statusLabel.Position = UDim2.new(0, 0, 0, 190)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "Status: Belum di Boost"
    statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.Parent = parent
    
    -- Level 1 Boost Function
    level1Btn.MouseButton1Click:Connect(function()
        pcall(function()
            -- Level 1 Boost: Delete shader, texture, image
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") then
                    v:Destroy()
                end
            end
            statusLabel.Text = "Status: Level 1 Active (Shader/Texture/Image Deleted)"
        end)
    end)
    
    -- Level 2 Boost Function (MAX)
    level2Btn.MouseButton1Click:Connect(function()
        pcall(function()
            -- Level 2 MAX: Delete shader, shadow, texture, image
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Shader") or v:IsA("Texture") or v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("Decal") or v:IsA("Shadow") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                    v:Destroy()
                end
            end
            
            -- Setting kualitas grafis ke rendah
            local lighting = game:GetService("Lighting")
            lighting.Brightness = 1
            lighting.GlobalShadows = false
            lighting.FogEnd = 1e10
            lighting.Outlines = false
            
            -- Setting render ke low
            settings():GetService("RenderSettings").QualityLevel = 1
            
            statusLabel.Text = "Status: Level 2 MAX Active ⚡ (Ultra FPS Boost)"
        end)
    end)
end

-- Fungsi untuk membuat tab Setting
function library:CreateSettingTab(parent)
    -- Toggle FPS Indicator
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = "ToggleFrame"
    toggleFrame.Size = UDim2.new(1, 0, 0, 50)
    toggleFrame.Position = UDim2.new(0, 0, 0, 20)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = parent
    
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Name = "ToggleLabel"
    toggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = "FPS Indicator"
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.TextScaled = true
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Parent = toggleFrame
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "ToggleBtn"
    toggleBtn.Size = UDim2.new(0, 40, 0, 40)
    toggleBtn.Position = UDim2.new(0.8, 0, 0, 5)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    toggleBtn.Text = "OFF"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    toggleBtn.TextScaled = true
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = toggleFrame
    
    -- FPS Indicator
    local fpsEnabled = false
    
    toggleBtn.MouseButton1Click:Connect(function()
        fpsEnabled = not fpsEnabled
        if fpsEnabled then
            toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            toggleBtn.Text = "ON"
            toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            self:StartFPSIndicator()
        else
            toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            toggleBtn.Text = "OFF"
            toggleBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
            self:StopFPSIndicator()
        end
    end)
    
    -- Informasi Tambahan
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "InfoLabel"
    infoLabel.Size = UDim2.new(1, 0, 0, 100)
    infoLabel.Position = UDim2.new(0, 0, 0, 100)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = "⚠️ Info:\nLevel 2 MAX akan menghapus hampir semua efek grafis untuk FPS maksimal.\nCocok untuk device low-end!"
    infoLabel.TextColor3 = Color3.fromRGB(255, 255, 100)
    infoLabel.TextScaled = true
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.TextWrapped = true
    infoLabel.Parent = parent
end

-- Fungsi untuk memulai FPS Indicator
function library:StartFPSIndicator()
    if fpsIndicator then
        fpsIndicator:Destroy()
    end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FPSIndicator"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game:GetService("CoreGui")
    
    local frame = Instance.new("Frame")
    frame.Name = "FPSFrame"
    frame.Size = UDim2.new(0, 70, 0, 30)
    frame.Position = UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = screenGui
    
    local label = Instance.new("TextLabel")
    label.Name = "FPSLabel"
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "FPS: 60"
    label.TextColor3 = Color3.fromRGB(0, 255, 0)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = frame
    
    fpsIndicator = screenGui
    fpsRunning = true
    
    -- Update FPS
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
                label.Text = "FPS: " .. fps
                
                if fps >= 45 then
                    label.TextColor3 = Color3.fromRGB(0, 255, 0)
                elseif fps >= 30 then
                    label.TextColor3 = Color3.fromRGB(255, 255, 0)
                else
                    label.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
                
                frameCount = 0
                lastIteration = currentTime
            end
        end
    end)
end

-- Fungsi untuk menghentikan FPS Indicator
function library:StopFPSIndicator()
    if fpsIndicator then
        fpsIndicator:Destroy()
        fpsIndicator = nil
    end
    fpsRunning = false
end

-- Eksekusi utama
local mainGui = library:CreateMain()
mainGui.Parent = game:GetService("CoreGui")

-- Notifikasi sukses
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "191 FPS ⚡",
    Text = "Script berhasil dimuat!",
    Duration = 3
})
