-- leaked by https://discord.gg/MT6BXdH9q

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

local pos1 = Vector3.new(-352.98, -7, 74.30)
local pos2 = Vector3.new(-352.98, -6.49, 45.76)
local standing1 = Vector3.new(-336.36, -4.59, 99.51)
local standing2 = Vector3.new(-334.81, -4.59, 18.90)

local spot1_sequence = {
    CFrame.new(-370.810913, -7.00000334, 41.2687263, 0.99984771, 1.22364419e-09, 0.0174523517, -6.54859778e-10, 1, -3.2596418e-08, -0.0174523517, 3.25800258e-08, 0.99984771),
    CFrame.new(-336.355286, -5.10107088, 17.2327671, -0.999883354, -2.76150569e-08, 0.0152716246, -2.88224964e-08, 1, -7.88441525e-08, -0.0152716246, -7.9275118e-08, -0.999883354)
}

local spot2_sequence = {
    CFrame.new(-354.782867, -7.00000334, 92.8209305, -0.999997616, -1.11891862e-09, -0.00218066527, -1.11958298e-09, 1, 3.03415071e-10, 0.00218066527, 3.05855785e-10, -0.999997616),
    CFrame.new(-336.942902, -5.10106993, 99.3276443, 0.999914348, -3.63984611e-08, 0.0130875716, 3.67094941e-08, 1, -2.35254749e-08, -0.0130875716, 2.40038975e-08, 0.999914348)
}

if CoreGui:FindFirstChild("AriesHubGui") then
    CoreGui["AriesHubGui"]:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AriesHubGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

-- ===================== ESP =====================
local function createESPBox(position, labelText)
    local espFolder = Instance.new("Folder")
    espFolder.Name = "ESPBox_" .. labelText
    espFolder.Parent = workspace
    local box = Instance.new("Part")
    box.Name = "ESPPart"
    box.Size = Vector3.new(5, 0.5, 5)
    box.Position = position
    box.Anchored = true
    box.CanCollide = false
    box.Transparency = 0.5
    box.Material = Enum.Material.Neon
    box.Color = Color3.fromRGB(0, 0, 0)
    box.Parent = espFolder
    local selectionBox = Instance.new("SelectionBox")
    selectionBox.Adornee = box
    selectionBox.LineThickness = 0.05
    selectionBox.Color3 = Color3.fromRGB(255, 255, 255)
    selectionBox.Parent = box
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESPLabel"
    billboard.Adornee = box
    billboard.Size = UDim2.new(0, 150, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = box
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = labelText
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 18
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeTransparency = 0.5
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.Parent = billboard
    return espFolder
end

createESPBox(pos1, "Teleport Here")
createESPBox(pos2, "Teleport Here")
createESPBox(standing1, "Standing 1")
createESPBox(standing2, "Standing 2")

local autoSemiTpCFrame = CFrame.new(-349.325867, -7.00000238, 95.0031433, -0.999048233, -8.29406233e-09, -0.0436184891, -1.03892832e-08, 1, 4.78084594e-08, 0.0436184891, 4.82161227e-08, -0.999048233)
createESPBox(autoSemiTpCFrame.Position, "Auto tp Left")
local autoSemiTpCFrame2 = CFrame.new(-349.560211, -7.00000238, 27.0543289, -0.999961913, 5.50995267e-08, -0.00872585084, 5.48100907e-08, 1, 3.34090586e-08, 0.00872585084, 3.29295204e-08, -0.999961913)
createESPBox(autoSemiTpCFrame2.Position, "Auto tp Right")

-- ===================== GUI =====================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 280)
mainFrame.Position = UDim2.new(1, -215, 0.5, -140)
mainFrame.AnchorPoint = Vector2.new(0, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.ClipsDescendants = false
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local uiStroke = Instance.new("UIStroke", mainFrame)
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(255, 255, 255)

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
})
uiGradient.Parent = uiStroke

task.spawn(function()
    while task.wait() do
        for i = 0, 360, 2 do
            uiGradient.Rotation = i
            task.wait(0.01)
        end
    end
end)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, 4)
title.BackgroundTransparency = 1
title.Text = "Instant Steal V2"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 13
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local dividerLine = Instance.new("Frame")
dividerLine.Size = UDim2.new(0.85, 0, 0, 1)
dividerLine.Position = UDim2.new(0.075, 0, 0, 24)
dividerLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dividerLine.BorderSizePixel = 0
dividerLine.Parent = mainFrame

-- ===================== State =====================
local semiTPEnabled = false
local speedAfterSteal = false
local speedConnection = nil
local SPEED_BOOST = 28

-- ===================== ResetToWork (manual) =====================
local function ResetToWork()
    local flags = {
        {"GameNetPVHeaderRotationalVelocityZeroCutoffExponent", "-5000"},
        {"LargeReplicatorWrite5", "true"},
        {"LargeReplicatorEnabled9", "true"},
        {"AngularVelociryLimit", "360"},
        {"TimestepArbiterVelocityCriteriaThresholdTwoDt", "2147483646"},
        {"S2PhysicsSenderRate", "15000"},
        {"DisableDPIScale", "true"},
        {"MaxDataPacketPerSend", "2147483647"},
        {"ServerMaxBandwith", "52"},
        {"PhysicsSenderMaxBandwidthBps", "20000"},
        {"MaxTimestepMultiplierBuoyancy", "2147483647"},
        {"SimOwnedNOUCountThresholdMillionth", "2147483647"},
        {"MaxMissedWorldStepsRemembered", "-2147483648"},
        {"CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth", "1"},
        {"StreamJobNOUVolumeLengthCap", "2147483647"},
        {"DebugSendDistInSteps", "-2147483648"},
        {"MaxTimestepMultiplierAcceleration", "2147483647"},
        {"LargeReplicatorRead5", "true"},
        {"SimExplicitlyCappedTimestepMultiplier", "2147483646"},
        {"GameNetDontSendRedundantNumTimes", "1"},
        {"CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent", "1"},
        {"CheckPVCachedRotVelThresholdPercent", "10"},
        {"LargeReplicatorSerializeRead3", "true"},
        {"ReplicationFocusNouExtentsSizeCutoffForPauseStuds", "2147483647"},
        {"NextGenReplicatorEnabledWrite4", "true"},
        {"CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth", "1"},
        {"GameNetDontSendRedundantDeltaPositionMillionth", "1"},
        {"InterpolationFrameVelocityThresholdMillionth", "5"},
        {"StreamJobNOUVolumeCap", "2147483647"},
        {"InterpolationFrameRotVelocityThresholdMillionth", "5"},
        {"WorldStepMax", "30"},
        {"TimestepArbiterHumanoidLinearVelThreshold", "1"},
        {"InterpolationFramePositionThresholdMillionth", "5"},
        {"TimestepArbiterHumanoidTurningVelThreshold", "1"},
        {"MaxTimestepMultiplierContstraint", "2147483647"},
        {"GameNetPVHeaderLinearVelocityZeroCutoffExponent", "-5000"},
        {"CheckPVCachedVelThresholdPercent", "10"},
        {"TimestepArbiterOmegaThou", "1073741823"},
        {"MaxAcceptableUpdateDelay", "1"},
        {"LargeReplicatorSerializeWrite4", "true"},
    }
    for _, data in ipairs(flags) do
        pcall(function() if setfflag then setfflag(data[1], data[2]) end end)
    end
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Dead) end
        char:ClearAllChildren()
        local f = Instance.new("Model", workspace)
        player.Character = f task.wait()
        player.Character = char f:Destroy()
    end
end

local function executeTP(sequence)
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local backpack = player:FindFirstChild("Backpack")
    if root and hum and backpack then
        local carpet = backpack:FindFirstChild("Flying Carpet")
        if carpet then hum:EquipTool(carpet) end
        task.wait(0.05)
        root.CFrame = sequence[1]
        task.wait(0.1)
        root.CFrame = sequence[2]
    end
end

-- ===================== Toggle Helper =====================
local function createToggle(text, position, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 24)
    container.Position = position
    container.BackgroundTransparency = 1
    container.Parent = mainFrame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -40, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 10
    label.Font = Enum.Font.GothamMedium
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 32, 0, 16)
    btn.Position = UDim2.new(1, -32, 0.5, -8)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = ""
    btn.Parent = container
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 11, 0, 11)
    dot.Position = UDim2.new(0, 3, 0.5, -5.5)
    dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dot.Parent = btn
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        local goal = active and UDim2.new(1, -14, 0.5, -5.5) or UDim2.new(0, 3, 0.5, -5.5)
        local col = active and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(40, 40, 40)
        TweenService:Create(dot, TweenInfo.new(0.15), {Position = goal}):Play()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = col}):Play()
        callback(active)
    end)
end

-- ===================== Small Button Helper =====================
local function createButton(text, position, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 22)
    btn.Position = position
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.Parent = mainFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
    local s = Instance.new("UIStroke", btn)
    s.Color = Color3.fromRGB(60, 60, 60)
    s.Thickness = 1
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ===================== Toggles =====================
createToggle("Giant Potion", UDim2.new(0.05, 0, 0, 30), function(state)
    _G.AutoPotion = state
end)

createToggle("Half Tp", UDim2.new(0.05, 0, 0, 58), function(state) semiTPEnabled = state end)

createToggle("Speed After Steal", UDim2.new(0.05, 0, 0, 86), function(state)
    speedAfterSteal = state
    if not state and speedConnection then
        speedConnection:Disconnect()
        speedConnection = nil
    end
end)

-- ===================== Manual Reset Button =====================
local resetBtn = createButton("Reset (Activate)", UDim2.new(0.05, 0, 0, 114), function()
    ResetToWork()
end)
resetBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 60)
resetBtn.TextColor3 = Color3.fromRGB(180, 180, 255)

-- ===================== Steal System =====================
local CONFIG = { ANTI_STEAL_ACTIVE = false }

local allAnimalsCache = {}
local PromptMemoryCache = {}
local InternalStealCache = {}
local IsStealing = false
local StealProgress = 0
local CurrentStealTarget = nil
local AUTO_STEAL_PROX_RADIUS = 200

local function getHRP()
    local char = player.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso")
end

local function isMyBase(plotName)
    local plot = workspace.Plots:FindFirstChild(plotName)
    if not plot then return false end
    local sign = plot:FindFirstChild("PlotSign")
    return sign and sign:FindFirstChild("YourBase") and sign.YourBase.Enabled
end

local function scanSinglePlot(plot)
    if not plot or not plot:IsA("Model") or isMyBase(plot.Name) then return end
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return end
    for _, podium in ipairs(podiums:GetChildren()) do
        if podium:IsA("Model") and podium:FindFirstChild("Base") then
            table.insert(allAnimalsCache, {
                plot = plot.Name,
                slot = podium.Name,
                worldPosition = podium:GetPivot().Position,
                uid = plot.Name .. "_" .. podium.Name,
            })
        end
    end
end

local function initializeScanner()
    task.wait(2)
    local plots = workspace:WaitForChild("Plots", 10)
    for _, plot in ipairs(plots:GetChildren()) do scanSinglePlot(plot) end
    plots.ChildAdded:Connect(scanSinglePlot)
    task.spawn(function()
        while task.wait(5) do
            table.clear(allAnimalsCache)
            for _, plot in ipairs(plots:GetChildren()) do scanSinglePlot(plot) end
        end
    end)
end

local function findPrompt(animal)
    local cached = PromptMemoryCache[animal.uid]
    if cached and cached.Parent then return cached end
    local plot = workspace.Plots:FindFirstChild(animal.plot)
    local podium = plot and plot.AnimalPodiums:FindFirstChild(animal.slot)
    local prompt = podium and podium.Base.Spawn.PromptAttachment:FindFirstChildOfClass("ProximityPrompt")
    if prompt then PromptMemoryCache[animal.uid] = prompt end
    return prompt
end

local function buildStealCallbacks(prompt)
    if InternalStealCache[prompt] then return end
    local data = { holdCallbacks = {}, triggerCallbacks = {}, ready = true }
    local ok1, conns1 = pcall(getconnections, prompt.PromptButtonHoldBegan)
    if ok1 then for _, c in ipairs(conns1) do table.insert(data.holdCallbacks, c.Function) end end
    local ok2, conns2 = pcall(getconnections, prompt.Triggered)
    if ok2 then for _, c in ipairs(conns2) do table.insert(data.triggerCallbacks, c.Function) end end
    InternalStealCache[prompt] = data
end

local function getNearestAnimal()
    local hrp = getHRP()
    if not hrp then return nil end
    local nearest, dist = nil, math.huge
    for _, animal in ipairs(allAnimalsCache) do
        local d = (hrp.Position - animal.worldPosition).Magnitude
        if d < dist and d <= AUTO_STEAL_PROX_RADIUS then dist = d; nearest = animal end
    end
    return nearest
end

-- ===================== Shared steal executor =====================
-- side = "left" → spot1_sequence, side = "right" → spot2_sequence
local function executeAutoSteal(side)
    if IsStealing then return end
    CONFIG.ANTI_STEAL_ACTIVE = true

    local animal = getNearestAnimal()
    if not animal then return end
    local prompt = findPrompt(animal)
    if not prompt then return end
    buildStealCallbacks(prompt)

    local data = InternalStealCache[prompt]
    if not data or not data.ready or IsStealing then return end

    local sequence = (side == "left") and spot1_sequence or spot2_sequence

    data.ready = false
    IsStealing = true
    StealProgress = 0
    CurrentStealTarget = animal

    local tpDone = false
    task.spawn(function()
        for _, fn in ipairs(data.holdCallbacks) do task.spawn(fn) end

        local startTime = tick()
        while tick() - startTime < 1.3 do
            StealProgress = (tick() - startTime) / 1.3

            if StealProgress >= 0.73 and not tpDone then
                tpDone = true
                local hrp = getHRP()
                if hrp then
                    hrp.CFrame = sequence[1]; task.wait(0.1)
                    hrp.CFrame = sequence[2]; task.wait(0.2)
                    local d1 = (hrp.Position - pos1).Magnitude
                    local d2 = (hrp.Position - pos2).Magnitude
                    hrp.CFrame = CFrame.new(d1 < d2 and pos1 or pos2)
                end
            end
            task.wait()
        end

        StealProgress = 1
        for _, fn in ipairs(data.triggerCallbacks) do task.spawn(fn) end
        task.wait(0.2)
        data.ready = true
        IsStealing = false
        StealProgress = 0
        CurrentStealTarget = nil
        CONFIG.ANTI_STEAL_ACTIVE = false
    end)
end

-- ===================== Auto TP Buttons =====================
createButton("Auto tp Left  [F]", UDim2.new(0.05, 0, 0, 142), function()
    executeAutoSteal("left")
end)

createButton("Auto tp Right  [R]", UDim2.new(0.05, 0, 0, 169), function()
    executeAutoSteal("right")
end)

-- ===================== Keybinds: F = Left, R = Right =====================
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        executeAutoSteal("left")
    elseif input.KeyCode == Enum.KeyCode.R then
        executeAutoSteal("right")
    end
end)

-- ===================== Progress Bar =====================
local bar = Instance.new("Frame", mainFrame)
bar.Size = UDim2.new(0.9, 0, 0, 8)
bar.Position = UDim2.new(0.05, 0, 0, 198)
bar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", bar)

local fill = Instance.new("Frame", bar)
fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
fill.Size = UDim2.new(0, 0, 1, 0)
Instance.new("UICorner", fill)

local percentLabel = Instance.new("TextLabel", bar)
percentLabel.Size = UDim2.new(1, -2, 1, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
percentLabel.TextSize = 8
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextXAlignment = Enum.TextXAlignment.Right

task.spawn(function()
    while true do
        fill.Size = UDim2.new(math.clamp(StealProgress, 0, 1), 0, 1, 0)
        percentLabel.Text = (math.floor(StealProgress * 100 + 0.5)) .. "%"
        task.wait(0.02)
    end
end)

-- ===================== TP Spot Dropdown =====================
local dropdownContainer = Instance.new("Frame")
dropdownContainer.Name = "DropdownContainer"
dropdownContainer.Size = UDim2.new(0.9, 0, 0, 24)
dropdownContainer.Position = UDim2.new(0.05, 0, 0, 212)
dropdownContainer.BackgroundTransparency = 1
dropdownContainer.ClipsDescendants = true
dropdownContainer.Parent = mainFrame

local dropdownButton = Instance.new("TextButton")
dropdownButton.Size = UDim2.new(1, 0, 0, 24)
dropdownButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
dropdownButton.Text = "TP TO SPOT ▼"
dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dropdownButton.TextSize = 10
dropdownButton.Font = Enum.Font.GothamBold
dropdownButton.Parent = dropdownContainer
Instance.new("UICorner", dropdownButton).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", dropdownButton).Color = Color3.fromRGB(60, 60, 60)

local dropdownList = Instance.new("Frame")
dropdownList.Size = UDim2.new(1, 0, 0, 56)
dropdownList.Position = UDim2.new(0, 0, 0, 28)
dropdownList.BackgroundTransparency = 1
dropdownList.Parent = dropdownContainer

local function createListButton(text, pos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 24)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 9
    btn.Font = Enum.Font.GothamMedium
    btn.Parent = dropdownList
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    btn.MouseButton1Click:Connect(callback)
end

createListButton("TP TO SPOT 1", UDim2.new(0, 0, 0, 0), function() executeTP(spot1_sequence) end)
createListButton("TP TO SPOT 2", UDim2.new(0, 0, 0, 28), function() executeTP(spot2_sequence) end)

local dropdownOpen = false
dropdownButton.MouseButton1Click:Connect(function()
    dropdownOpen = not dropdownOpen
    local targetSize = dropdownOpen and UDim2.new(0.9, 0, 0, 88) or UDim2.new(0.9, 0, 0, 24)
    dropdownButton.Text = dropdownOpen and "TP TO SPOT ▲" or "TP TO SPOT ▼"
    TweenService:Create(dropdownContainer, TweenInfo.new(0.2), {Size = targetSize}):Play()
end)

-- ===================== Discord label =====================
local discordText = Instance.new("TextLabel")
discordText.Size = UDim2.new(1, 0, 0, 12)
discordText.Position = UDim2.new(0, 0, 1, -13)
discordText.BackgroundTransparency = 1
discordText.Text = "discord.gg/vainshub"
discordText.TextColor3 = Color3.fromRGB(120, 120, 120)
discordText.TextSize = 7
discordText.Font = Enum.Font.GothamMedium
discordText.Parent = mainFrame

-- ===================== Semi TP (ProximityPrompt) =====================
local currentEquipTask = nil
local isHolding = false

ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt, plr)
    if plr ~= player or not semiTPEnabled then return end
    isHolding = true
    if currentEquipTask then task.cancel(currentEquipTask) end
    currentEquipTask = task.spawn(function()
        task.wait(1)
        if isHolding and semiTPEnabled then
            local backpack = player:WaitForChild("Backpack", 2)
            if backpack then
                local carpet = backpack:FindFirstChild("Flying Carpet")
                if carpet and player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid:EquipTool(carpet)
                end
            end
        end
    end)
end)

ProximityPromptService.PromptButtonHoldEnded:Connect(function(prompt, plr)
    if plr ~= player then return end
    isHolding = false
    if currentEquipTask then task.cancel(currentEquipTask) end
end)

ProximityPromptService.PromptTriggered:Connect(function(prompt, plr)
    if plr ~= player or not semiTPEnabled then return end
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if root then
        local d1 = (root.Position - pos1).Magnitude
        local d2 = (root.Position - pos2).Magnitude
        root.CFrame = CFrame.new(d1 < d2 and pos1 or pos2)

        if _G.AutoPotion then
            local backpack = player:FindFirstChild("Backpack")
            if backpack then
                local potion = backpack:FindFirstChild("Giant Potion")
                if potion and player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid:EquipTool(potion)
                    task.wait(0)
                    pcall(function() potion:Activate() end)
                end
            end
        end

        if speedAfterSteal then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if speedConnection then speedConnection:Disconnect() end
                speedConnection = RunService.Heartbeat:Connect(function()
                    if not speedAfterSteal or humanoid.MoveDirection.Magnitude == 0 or not root.Parent then return end
                    local moveDir = humanoid.MoveDirection.Unit
                    root.AssemblyLinearVelocity = Vector3.new(moveDir.X * SPEED_BOOST, root.AssemblyLinearVelocity.Y, moveDir.Z * SPEED_BOOST)
                end)
            end
        end
    end
    isHolding = false
end)

-- ===================== Drag =====================
local dragging, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = mainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- ===================== Final size =====================
mainFrame.Size = UDim2.new(0, 200, 0, 280)

initializeScanner()
