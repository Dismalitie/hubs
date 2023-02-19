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

cameratab:CreateButton("Freecam", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxSkriptr/RBLXSkriptr/main/Free%20Camera.lua", true))()
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

--guitab
gui:CreateButton("Hide UI Instances", function()
local hideui = false
hideui = not hideui
while hideui == true do
wait(0.001)
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
end)
gui:CreateButton("Hide Players", function()
local hideplayers = false
hideplayers = not hideplayers
while hideplayers == true do
wait(0.001)
   local players = game:GetService("Players")
local player = players.LocalPlayer

-- Hide all other players
for _, otherPlayer in ipairs(players:GetPlayers()) do
    if otherPlayer ~= player then
        local character = otherPlayer.Character
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 1
                end
            end
        end
    end
end
end
end)

gui:CreateButton("Hide Chat Bubbles", function()
local chatService = game:GetService("Chat")

-- Hide all chat bubbles
chatService:SetBubbleChatEnabled(false)
end)
