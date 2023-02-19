local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
 
local window = Library:NewWindow("CineHub")
 
local cameratab = window:NewSection("Camera")
local gui = window:NewSection("GUI")
local cinesettings = window:NewSection("Settings")
   cinesettings:CreateDropdown("Advanced Settings", {"true", "false"}, 2, function(advanced)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Dismalitie/hubs/main/cinehub.lua"))
   end)

-- Define variables
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local isFreecam = false
local advanced = false

--functions


-- Function to enable/disable freecam
function toggleFreecam()
    if isFreecam then
        isFreecam = false
        camera.CameraSubject = player.Character
        camera.CameraType = Enum.CameraType.Custom
    else
        isFreecam = true
        camera.CameraSubject = nil
        camera.CameraType = Enum.CameraType.Scriptable
    end
end

-- Update freecam position
UserInputService.InputChanged:Connect(function(input, gameProcessed)
    if isFreecam and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Delta
        camera.CFrame = camera.CFrame * CFrame.Angles(-math.rad(delta.y * 0.1), 0, -math.rad(delta.x * 0.1))
    end
end)

--camtab

cameratab:CreateButton("Button", function()
   
end)
 
cameratab:CreateTextbox("TextBox", function(text)
   print(text)
end)
 
cameratab:CreateToggle("Freeze Cam", function()
   if isFreecam then
      isFreecam = false
      camera.CameraSubject = player.Character
      camera.CameraType = Enum.CameraType.Custom
  else
      isFreecam = true
      camera.CameraSubject = nil
      camera.CameraType = Enum.CameraType.Scriptable
  end
end)

cameratab:CreateDropdown("DropDown", {"Hello", "World", "Hello World"}, 2, function(text)
   print(text)
end)
 
cameratab:CreateSlider("Slider", 0, 100, 15, false, function(value)
   print(value)
 end)
cameratab:CreateColorPicker("Picker", Color3.new(255, 255, 255), function(value)
   print(value)
end)

--guitab
gui:CreateToggle("Hide UI Instances", function()
local hideui = false
hideui = not hideui
while hideui == true do
wait(hideuirr)
   -- Find all children of the game's "Players" service
local children = game:GetService("Players"):GetChildren()

-- Loop through each child and check if it has a "PlayerGui" object
for _, child in ipairs(children) do
    if child:IsA("Player") and child:FindFirstChild("PlayerGui") then
        local playerGui = child.PlayerGui
        
        -- Loop through each child of the PlayerGui object and hide it
        for _, guiObject in ipairs(playerGui:GetChildren()) do
            guiObject.Enabled = false
        end
    end
end
end
while hideui == false do
   wait(hideuirr)
   -- Find all children of the game's "Players" service
local children = game:GetService("Players"):GetChildren()

-- Loop through each child and check if it has a "PlayerGui" object
for _, child in ipairs(children) do
    if child:IsA("Player") and child:FindFirstChild("PlayerGui") then
        local playerGui = child.PlayerGui
        
        -- Loop through each child of the PlayerGui object and hide it
        for _, guiObject in ipairs(playerGui:GetChildren()) do
            guiObject.Enabled = true
        end
    end
end
end
end)

if advanced == true then
   gui:CreateSlider("^^GUI Refresh Rate", 0, 5, 1, false, function(hideuirr) end)
end
