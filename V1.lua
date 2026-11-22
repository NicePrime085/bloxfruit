--// SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

--// CẤU HÌNH HỆ THỐNG
local CONFIG = {
	Title = "KEY SYSTEM",
	SubTitle = "Hệ thống xác thực cao cấp • Phiên bản 4D",
	GetKeyLink = "https://seerunsray.github.io/key/",
	KeyPrefix = "bloxfruitkey_",
	KeyPattern = "^bloxfruitkey_[a-zA-Z0-9]+$",
	MinRandomLength = 6,
	TargetScript = 'loadstring(game:HttpGet("https://darkwen.vercel.app/s/-jnjsSN6RWK9JRBYfWZ1VQ/blox-fruit"))()',
	AccentColor1 = Color3.fromRGB(0, 210, 255),
	AccentColor2 = Color3.fromRGB(160, 32, 240),
	BgColor = Color3.fromRGB(12, 14, 22),
}

--// DỌN DẸP UI CŨ NẾU TỒN TẠI
local ParentGui = pcall(function() return CoreGui.Name end) and CoreGui or LocalPlayer:WaitForChild("PlayerGui")
for _, v in ipairs(ParentGui:GetChildren()) do
	if v.Name == "KeySystem_4D_UI" then
		v:Destroy()
	end
end

--// KHỞI TẠO SCREENGUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystem_4D_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = ParentGui

-- Hiệu ứng làm mờ nền (Blur)
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Name = "KeySystemBlur"
BlurEffect.Size = 0
BlurEffect.Parent = game:GetService("Lighting")
TweenService:Create(BlurEffect, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {Size = 18}):Play()

--// KHUNG CHÍNH (CONTAINER HỖ TRỢ HIỆU ỨNG PARALLAX 4D)
local MainWrapper = Instance.new("Frame")
MainWrapper.Name = "MainWrapper"
MainWrapper.Size = UDim2.new(0, 440, 0, 242)
MainWrapper.Position = UDim2.new(0.5, 0, 0.5, 0)
MainWrapper.AnchorPoint = Vector2.new(0.5, 0.5)
MainWrapper.BackgroundTransparency = 1
MainWrapper.Parent = ScreenGui

-- Bóng đổ phát sáng ngoài (4D Outer Glow)
local OuterGlow = Instance.new("ImageLabel")
OuterGlow.Name = "OuterGlow"
OuterGlow.Size = UDim2.new(1, 60, 1, 60)
OuterGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
OuterGlow.AnchorPoint = Vector2.new(0.5, 0.5)
OuterGlow.BackgroundTransparency = 1
OuterGlow.Image = "rbxassetid://5028857084"
OuterGlow.ImageColor3 = CONFIG.AccentColor1
OuterGlow.ImageTransparency = 0.45
OuterGlow.ScaleType = Enum.ScaleType.Slice
OuterGlow.SliceCenter = Rect.new(24, 24, 276, 276)
OuterGlow.ZIndex = 1
OuterGlow.Parent = MainWrapper

-- Khung nền Glassmorphism chính
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = CONFIG.BgColor
MainFrame.BackgroundTransparency = 0.12
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 2
MainFrame.Parent = MainWrapper

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- Viền Gradient xoay 360 độ (4D Border)
local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2.2
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Color = Color3.fromRGB(255, 255, 255)
MainStroke.Parent = MainFrame

local StrokeGradient = Instance.new("UIGradient")
StrokeGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, CONFIG.AccentColor1),
	ColorSequenceKeypoint.new(0.5, CONFIG.AccentColor2),
	ColorSequenceKeypoint.new(1, CONFIG.AccentColor1)
})
StrokeGradient.Parent = MainStroke

-- Lưới nền 4D chuyển động bên trong
local GridOverlay = Instance.new("ImageLabel")
GridOverlay.Name = "GridOverlay"
GridOverlay.Size = UDim2.new(1.5, 0, 1.5, 0)
GridOverlay.Position = UDim2.new(-0.25, 0, -0.25, 0)
GridOverlay.BackgroundTransparency = 1
GridOverlay.Image = "rbxassetid://6071575925"
GridOverlay.ImageColor3 = CONFIG.AccentColor1
GridOverlay.ImageTransparency = 0.92
GridOverlay.ScaleType = Enum.ScaleType.Tile
GridOverlay.TileSize = UDim2.new(0, 35, 0, 35)
GridOverlay.ZIndex = 2
GridOverlay.Parent = MainFrame

--// TIÊU ĐỀ (HEADER)
local HeaderFrame = Instance.new("Frame")
HeaderFrame.Name = "Header"
HeaderFrame.Size = UDim2.new(1, 0, 0, 68)
HeaderFrame.BackgroundTransparency = 1
HeaderFrame.ZIndex = 4
HeaderFrame.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, -60, 0, 32)
TitleLabel.Position = UDim2.new(0, 24, 0, 12)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.Text = CONFIG.Title
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 24
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 4
TitleLabel.Parent = HeaderFrame

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.6, CONFIG.AccentColor1),
	ColorSequenceKeypoint.new(1, CONFIG.AccentColor2)
})
TitleGradient.Parent = TitleLabel

local SubTitleLabel = Instance.new("TextLabel")
SubTitleLabel.Name = "SubTitle"
SubTitleLabel.Size = UDim2.new(1, -60, 0, 18)
SubTitleLabel.Position = UDim2.new(0, 24, 0, 42)
SubTitleLabel.BackgroundTransparency = 1
SubTitleLabel.Font = Enum.Font.GothamMedium
SubTitleLabel.Text = CONFIG.SubTitle
SubTitleLabel.TextColor3 = Color3.fromRGB(160, 175, 200)
SubTitleLabel.TextSize = 12
SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
SubTitleLabel.ZIndex = 4
SubTitleLabel.Parent = HeaderFrame

-- Nút đóng (Close Button)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -46, 0, 16)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 65, 85)
CloseBtn.BackgroundTransparency = 0.85
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 115)
CloseBtn.TextSize = 15
CloseBtn.ZIndex = 5
CloseBtn.Parent = HeaderFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Đường kẻ phân cách
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -48, 0, 1)
Divider.Position = UDim2.new(0, 24, 0, 68)
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider.BackgroundTransparency = 0.88
Divider.BorderSizePixel = 0
Divider.ZIndex = 4
Divider.Parent = MainFrame

--// Ô NHẬP KEY (TEXTBOX)
local InputContainer = Instance.new("Frame")
InputContainer.Name = "InputContainer"
InputContainer.Size = UDim2.new(1, -48, 0, 46)
InputContainer.Position = UDim2.new(0, 24, 0, 84)
InputContainer.BackgroundColor3 = Color3.fromRGB(16, 20, 32)
InputContainer.ZIndex = 4
InputContainer.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 10)
InputCorner.Parent = InputContainer

local InputStroke = Instance.new("UIStroke")
InputStroke.Thickness = 1.5
InputStroke.Color = Color3.fromRGB(60, 75, 105)
InputStroke.Parent = InputContainer

local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(1, -24, 1, 0)
KeyInput.Position = UDim2.new(0, 12, 0, 0)
KeyInput.BackgroundTransparency = 1
KeyInput.Font = Enum.Font.Code
KeyInput.PlaceholderText = "Nhập key tại đây..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(110, 125, 150)
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14
KeyInput.ClearTextOnFocus = false
KeyInput.TextXAlignment = Enum.TextXAlignment.Left
KeyInput.ZIndex = 5
KeyInput.Parent = InputContainer

-- Dòng thông báo trạng thái
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(1, -48, 0, 20)
StatusLabel.Position = UDim2.new(0, 24, 0, 138)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "● Trạng thái: Đang chờ nhập Key..."
StatusLabel.TextColor3 = Color3.fromRGB(150, 165, 190)
StatusLabel.TextSize = 12
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.ZIndex = 4
StatusLabel.Parent = MainFrame

--// KHU VỰC 2 NÚT BẤM (GET KEY & CONFIRM KEY)
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Size = UDim2.new(1, -48, 0, 46)
ButtonContainer.Position = UDim2.new(0, 24, 0, 168)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.ZIndex = 4
ButtonContainer.Parent = MainFrame

-- NÚT 1: GET KEY
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Name = "GetKeyBtn"
GetKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
GetKeyBtn.Position = UDim2.new(0, 0, 0, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(28, 36, 56)
GetKeyBtn.Text = ""
GetKeyBtn.AutoButtonColor = false
GetKeyBtn.ZIndex = 5
GetKeyBtn.Parent = ButtonContainer

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 10)
GetKeyCorner.Parent = GetKeyBtn

local GetKeyStroke = Instance.new("UIStroke")
GetKeyStroke.Thickness = 1.5
GetKeyStroke.Color = CONFIG.AccentColor1
GetKeyStroke.Parent = GetKeyBtn

local GetKeyText = Instance.new("TextLabel")
GetKeyText.Name = "Label"
GetKeyText.Size = UDim2.new(1, -12, 1, 0)
GetKeyText.Position = UDim2.new(0, 6, 0, 0)
GetKeyText.BackgroundTransparency = 1
GetKeyText.Font = Enum.Font.GothamBold
GetKeyText.Text = "🔑 GET KEY"
GetKeyText.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyText.TextSize = 14
GetKeyText.ZIndex = 6
GetKeyText.Parent = GetKeyBtn

-- NÚT 2: CONFIRM KEY (Tách riêng chữ khỏi UIGradient để không bị mất chữ)
local ConfirmKeyBtn = Instance.new("TextButton")
ConfirmKeyBtn.Name = "ConfirmKeyBtn"
ConfirmKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
ConfirmKeyBtn.Position = UDim2.new(0.52, 0, 0, 0)
ConfirmKeyBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfirmKeyBtn.Text = ""
ConfirmKeyBtn.AutoButtonColor = false
ConfirmKeyBtn.ZIndex = 5
ConfirmKeyBtn.Parent = ButtonContainer

local ConfirmKeyCorner = Instance.new("UICorner")
ConfirmKeyCorner.CornerRadius = UDim.new(0, 10)
ConfirmKeyCorner.Parent = ConfirmKeyBtn

local ConfirmGradient = Instance.new("UIGradient")
ConfirmGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 145, 210)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 25, 190))
})
ConfirmGradient.Parent = ConfirmKeyBtn

local ConfirmKeyText = Instance.new("TextLabel")
ConfirmKeyText.Name = "Label"
ConfirmKeyText.Size = UDim2.new(1, -12, 1, 0)
ConfirmKeyText.Position = UDim2.new(0, 6, 0, 0)
ConfirmKeyText.BackgroundTransparency = 1
ConfirmKeyText.Font = Enum.Font.GothamBlack
ConfirmKeyText.Text = "✔ CONFIRM KEY"
ConfirmKeyText.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmKeyText.TextStrokeColor3 = Color3.fromRGB(10, 12, 20)
ConfirmKeyText.TextStrokeTransparency = 0.45
ConfirmKeyText.TextSize = 14
ConfirmKeyText.ZIndex = 6
ConfirmKeyText.Parent = ConfirmKeyBtn

--// HÀM HỖ TRỢ HIỆU ỨNG & THÔNG BÁO
local function SetStatus(text, color)
	StatusLabel.Text = text
	TweenService:Create(StatusLabel, TweenInfo.new(0.25), {TextColor3 = color}):Play()
end

local function ShakeUI()
	local origPos = MainWrapper.Position
	for i = 1, 6 do
		local offset = (i % 2 == 0) and 8 or -8
		TweenService:Create(MainWrapper, TweenInfo.new(0.04), {
			Position = UDim2.new(origPos.X.Scale, origPos.X.Offset + offset, origPos.Y.Scale, origPos.Y.Offset)
		}):Play()
		task.wait(0.04)
	end
	TweenService:Create(MainWrapper, TweenInfo.new(0.05), {Position = origPos}):Play()
end

local function DestroyUI()
	TweenService:Create(BlurEffect, TweenInfo.new(0.4), {Size = 0}):Play()
	TweenService:Create(MainWrapper, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		Size = UDim2.new(0, 0, 0, 0)
	}):Play()
	task.wait(0.4)
	BlurEffect:Destroy()
	ScreenGui:Destroy()
end

--// KIỂM TRA ĐỊNH DẠNG KEY: bloxfruitkey_ + chữ và số ngẫu nhiên
local function ValidateKey(inputKey)
	local cleanKey = string.gsub(inputKey, "^%s*(.-)%s*$", "%1")
	
	if not string.match(cleanKey, CONFIG.KeyPattern) then
		return false, "Key không hợp lệ!"
	end
	
	local randomPart = string.sub(cleanKey, #CONFIG.KeyPrefix + 1)
	if #randomPart < CONFIG.MinRandomLength then
		return false, "Key không hợp lệ!"
	end
	
	local hasLetter = string.match(randomPart, "%a") ~= nil
	local hasDigit = string.match(randomPart, "%d") ~= nil
	if not (hasLetter and hasDigit) then
		return false, "Key không hợp lệ!"
	end
	
	return true, "Xác nhận Key thành công! Đang khởi chạy Menu..."
end

--// SỰ KIỆN NÚT 1: GET KEY
GetKeyBtn.MouseButton1Click:Connect(function()
	TweenService:Create(GetKeyBtn, TweenInfo.new(0.1), {Size = UDim2.new(0.46, 0, 0.92, 0)}):Play()
	task.delay(0.1, function()
		TweenService:Create(GetKeyBtn, TweenInfo.new(0.1), {Size = UDim2.new(0.48, 0, 1, 0)}):Play()
	end)
	
	if setclipboard then
		setclipboard(CONFIG.GetKeyLink)
		SetStatus("✔ Đã sao chép link Get Key vào bộ nhớ tạm!", CONFIG.AccentColor1)
	elseif toclipboard then
		toclipboard(CONFIG.GetKeyLink)
		SetStatus("✔ Đã sao chép link Get Key vào bộ nhớ tạm!", CONFIG.AccentColor1)
	else
		SetStatus("🔗 Link: " .. CONFIG.GetKeyLink, CONFIG.AccentColor1)
	end
	
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "KEY SYSTEM",
			Text = "Đã copy link lấy key: " .. CONFIG.GetKeyLink,
			Duration = 5
		})
	end)
end)

--// SỰ KIỆN NÚT 2: CONFIRM KEY
local IsVerifying = false
ConfirmKeyBtn.MouseButton1Click:Connect(function()
	if IsVerifying then return end
	
	TweenService:Create(ConfirmKeyBtn, TweenInfo.new(0.1), {Size = UDim2.new(0.46, 0, 0.92, 0)}):Play()
	task.delay(0.1, function()
		TweenService:Create(ConfirmKeyBtn, TweenInfo.new(0.1), {Size = UDim2.new(0.48, 0, 1, 0)}):Play()
	end)
	
	local enteredKey = KeyInput.Text
	local isValid, message = ValidateKey(enteredKey)
	
	if isValid then
		IsVerifying = true
		InputStroke.Color = Color3.fromRGB(0, 255, 140)
		SetStatus("✔ " .. message, Color3.fromRGB(0, 255, 140))
		ConfirmKeyText.Text = "⏳ ĐANG MỞ MENU..."
		
		task.wait(0.8)
		DestroyUI()
		
		local success, err = pcall(function()
			loadstring(game:HttpGet("https://darkwen.vercel.app/s/-jnjsSN6RWK9JRBYfWZ1VQ/blox-fruit"))()
		end)
		
		if not success then
			warn("[Key System] Lỗi khi tải menu: " .. tostring(err))
		end
	else
		InputStroke.Color = Color3.fromRGB(255, 65, 85)
		SetStatus("✖ " .. message, Color3.fromRGB(255, 85, 100))
		ShakeUI()
	end
end)

-- Hiệu ứng Focus cho TextBox
KeyInput.Focused:Connect(function()
	TweenService:Create(InputStroke, TweenInfo.new(0.2), {Color = CONFIG.AccentColor1}):Play()
end)

KeyInput.FocusLost:Connect(function()
	TweenService:Create(InputStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(60, 75, 105)}):Play()
end)

-- Sự kiện nút Đóng
CloseBtn.MouseButton1Click:Connect(function()
	DestroyUI()
end)

--// HỆ THỐNG CHUYỂN ĐỘNG 4D (PARALLAX + XOAY VIỀN + DRAG)
local Dragging, DragInput, DragStart, StartPos

HeaderFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		Dragging = true
		DragStart = input.Position
		StartPos = MainWrapper.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				Dragging = false
			end
		end)
	end
end)

HeaderFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		DragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == DragInput and Dragging then
		local delta = input.Position - DragStart
		MainWrapper.Position = UDim2.new(
			StartPos.X.Scale,
			StartPos.X.Offset + delta.X,
			StartPos.Y.Scale,
			StartPos.Y.Offset + delta.Y
		)
	end
end)

local RotationAngle = 0
local GridOffset = 0
local RenderConn
RenderConn = RunService.RenderStepped:Connect(function(dt)
	if not ScreenGui or not ScreenGui.Parent then
		RenderConn:Disconnect()
		return
	end
	
	RotationAngle = (RotationAngle + dt * 90) % 360
	StrokeGradient.Rotation = RotationAngle
	
	GridOffset = (GridOffset + dt * 12) % 35
	GridOverlay.Position = UDim2.new(-0.25, GridOffset, -0.25, GridOffset)
	
	if not Dragging then
		local viewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
		local center = viewportSize / 2
		local offsetX = math.clamp((Mouse.X - center.X) / center.X, -1, 1)
		local offsetY = math.clamp((Mouse.Y - center.Y) / center.Y, -1, 1)
		
		MainFrame.Position = MainFrame.Position:Lerp(
			UDim2.new(0.5, offsetX * 8, 0.5, offsetY * 8),
			dt * 8
		)
		OuterGlow.Position = OuterGlow.Position:Lerp(
			UDim2.new(0.5, -offsetX * 12, 0.5, -offsetY * 12),
			dt * 6
		)
	end
end)

--// HIỆU ỨNG MỞ GIAO DIỆN (POP-IN)
MainWrapper.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(MainWrapper, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	Size = UDim2.new(0, 440, 0, 242)
}):Play()
