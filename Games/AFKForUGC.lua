-- esohasl.com
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

getgenv().Settings = {
    Tokens = false,
    Click = false,
}

-- Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally2", true))()

local Window = Library:CreateWindow("AFU | EsohaSL")

Window:Section("esohasl.com")

Window:Toggle("Auto Click", {}, function(state)
    task.spawn(function()
        Settings.Click = state
        while true do
            if not Settings.Click then return end

            ReplicatedStorage.Events.Click:FireServer()
            task.wait(.1)
        end
    end)
end)

Window:Toggle("Auto Tokens", {}, function(state)
    task.spawn(function()
        Settings.Tokens = state
        while true do
            if not Settings.Tokens then return end

            for _, v in ipairs(Workspace.Tokens:GetChildren()) do
                firetouchinterest(LocalPlayer.Character:FindFirstChildOfClass("Part"), v, 0)
                firetouchinterest(LocalPlayer.Character:FindFirstChildOfClass("Part"), v, 1); task.wait(.1)
            end

            task.wait(2.5)
        end
    end)
end)

Window:Section("Anti-AFK - Enabled")

Window:Button("YouTube: EsohaSL", function()
   task.spawn(function()
        pcall(function()
            setclipboard("https://youtube.com/@esohasl")
        end)
   end)
end)

LocalPlayer.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame);
    task.wait()
    VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame);
end)
