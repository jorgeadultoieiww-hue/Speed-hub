local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local gui = script.Parent
local frame = gui:WaitForChild("MainFrame")
local speedBox = frame:WaitForChild("SpeedBox")
local applyButton = frame:WaitForChild("ApplyButton")

local MIN_SPEED = 8
local MAX_SPEED = 200
local DEFAULT_SPEED = 16

local function setSpeed(newSpeed)
	newSpeed = tonumber(newSpeed)
	if not newSpeed then return end

	if newSpeed < MIN_SPEED then newSpeed = MIN_SPEED end
	if newSpeed > MAX_SPEED then newSpeed = MAX_SPEED end

	if humanoid and humanoid.WalkSpeed ~= newSpeed then
		humanoid.WalkSpeed = newSpeed
		print("Nova velocidade:", newSpeed)
	end
end

player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
end)

applyButton.MouseButton1Click:Connect(function()
	setSpeed(speedBox.Text)
end)

speedBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		setSpeed(speedBox.Text)
	end
end)

speedBox.Text = tostring(DEFAULT_SPEED)
humanoid.WalkSpeed = DEFAULT_SPEED
