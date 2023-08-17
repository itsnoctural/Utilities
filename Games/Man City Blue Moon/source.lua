-- esohasl
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

getgenv().Settings = {
    BlueBeetle = false,
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally2", true))()
local Window = Library:CreateWindow("MCBM | EsohaSL")

Window:Section("esohasl.com")

Window:Toggle("Auto Blue Beetle", {}, function(state)
    task.spawn(function()
        Settings.BlueBeetle = state
        while true do
            if not Settings.BlueBeetle then return end

            for _, v in ipairs(Workspace.BlueBeetleHunt:GetChildren()) do
                LocalPlayer.Character:PivotTo(v:GetPivot()); task.wait(.25)
            end

            task.wait(.75)
        end
    end)
end)

Window:Button("YouTube: EsohaSL", function()
    task.spawn(function()
        pcall(function()
            setclipboard("https://www.youtube.com/@esohasl")
        end)
    end)
end)
