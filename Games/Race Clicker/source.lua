local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

getgenv().Settings = {
    Win = false,
    Delay = 0.1,
    Rebirth = false,
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally2", true))()
local Window = Library:CreateWindow("RC | EsohaSL")

Window:Section("esohasl.com")

Window:Slider("Win Delay", { min = 0.1, max = 0.5 }, function(value)
    task.spawn(function()
        Settings.Delay = value;
    end)
end)

Window:Toggle("Auto Win", {}, function(state)
    task.spawn(function()
        Settings.Win = state
        while true do
            if not Settings.Win then return end

            if LocalPlayer.PlayerGui.TimerUI.RaceTimer.Visible then                    
                LocalPlayer.Character:PivotTo(LocalPlayer.Character:GetPivot() +  Vector3.new(50000, 0, 0))
                task.wait(Settings.Delay)
            end

            task.wait()
        end
    end)
end)

Window:Toggle("Auto Rebirth", {}, function(state)
    task.spawn(function()
        Settings.Rebirth = state
        while true do
            if not Settings.Rebirth then return end

            ReplicatedStorage.Packages.Knit.Services.RebirthService.RF.Rebirth:InvokeServer()
            task.wait(2.5)
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
