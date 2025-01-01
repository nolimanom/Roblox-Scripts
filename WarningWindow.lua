-- Создаем блюр
local blur = Instance.new("BlurEffect")
blur.Size = 10
blur.Parent = game.Lighting

-- Создаем экранный GUI для окна
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Создаем рамку окна
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- Добавляем UICorner для рамки
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = frame

-- Добавляем текст о создателе
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.4, 0)
textLabel.Position = UDim2.new(0, 0, 0, 10)
textLabel.Text = "Я (noli) не являюсь создателем этого скрипта и не обещаю его роботоспособность или безопасность"
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextSize = 11
textLabel.TextWrapped = true
textLabel.Parent = frame

-- Добавляем второй текст
local textLabel2 = Instance.new("TextLabel")
textLabel2.Size = UDim2.new(1, 0, 0.3, 0)
textLabel2.Position = UDim2.new(0, 0, 0.4, 0)
textLabel2.Text = "Вы действительно хотите выполнить этот скрипт?"
textLabel2.BackgroundTransparency = 1
textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel2.TextSize = 14
textLabel2.TextWrapped = true
textLabel2.Parent = frame

-- Создаем кнопку "Да"
local yesButton = Instance.new("TextButton")
yesButton.Size = UDim2.new(0.4, 0, 0.2, 0)
yesButton.Position = UDim2.new(0.05, 0, 0.7, 0)
yesButton.Text = "Да"
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
yesButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
yesButton.TextSize = 18
yesButton.Parent = frame

-- Добавляем UICorner для кнопки "Да"
local yesButtonCorner = Instance.new("UICorner")
yesButtonCorner.CornerRadius = UDim.new(0, 15)
yesButtonCorner.Parent = yesButton

-- Создаем кнопку "Нет"
local noButton = Instance.new("TextButton")
noButton.Size = UDim2.new(0.4, 0, 0.2, 0)
noButton.Position = UDim2.new(0.55, 0, 0.7, 0)
noButton.Text = "Нет"
noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
noButton.TextSize = 18
noButton.Parent = frame

-- Добавляем UICorner для кнопки "Нет"
local noButtonCorner = Instance.new("UICorner")
noButtonCorner.CornerRadius = UDim.new(0, 15)
noButtonCorner.Parent = noButton

-- Загружаем звук 1
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://762117042"
sound.Parent = game.Players.LocalPlayer.Character or game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Загружаем звук 2
local sound2 = Instance.new("Sound")
sound2.SoundId = "rbxassetid://942127495"
sound2.Parent = game.Players.LocalPlayer.Character or game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Функция для медленного исчезновения UI и блюра
local function fadeOut()
    -- Медленно уменьшаем блюр
    for i = 10, 0, -1 do
        blur.Size = i
        wait(0.05)
    end
    blur:Destroy()

    -- Медленно исчезаем окно
    for i = 1, 0, -0.05 do
        frame.BackgroundTransparency = i
        textLabel.TextTransparency = i
        textLabel2.TextTransparency = i
        yesButton.TextTransparency = i
        noButton.TextTransparency = i
        wait(0.05)
    end
    screenGui:Destroy()  -- Убираем окно
end

-- Обработчик для кнопки "Да"
yesButton.MouseButton1Click:Connect(function()
    sound:Play()  -- Играть звук
    noButton:Destroy()  -- Удаляем кнопку "Нет"
    yesButton:Destroy()  -- Удаляем кнопку "Да"
    
    -- Выполнение скрипта из _G.Script
    if _G.Script then
        loadstring(_G.Script)()  -- Выполняем скрипт
    end

    fadeOut()  -- Медленно исчезаем
end)

-- Обработчик для кнопки "Нет"
noButton.MouseButton1Click:Connect(function()
    sound2:Play()  -- Играть второй звук
    yesButton:Destroy()  -- Удаляем кнопку "Да"
    noButton:Destroy()  -- Удаляем кнопку "Нет"
    fadeOut()  -- Медленно исчезаем
end)
