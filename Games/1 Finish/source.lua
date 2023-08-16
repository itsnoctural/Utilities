-- esohasl.com
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TeleportService = game:GetService('TeleportService')
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

getgenv().Settings = {
    Win = WinsFarm or false,
    Hop = WinsFarm or false,
    Delay = {
        Win = WinsFarm and 1 or 5,
        Hop = WinsFarm and 2 or 7.5,
    }
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally2", true))()
local Window = Library:CreateWindow("1% Finish UGC")

Window:Section("esohasl.com")

Window:Toggle("Auto Win", { default = Settings.Win }, function(state)
    task.spawn(function()
        Settings.Win = state
        while true do
            if not Settings.Win then return end

            LocalPlayer.Character:PivotTo(Workspace.WinnersArea.End:GetPivot())
            task.wait(Settings.Delay.Win)
        end
    end)
end)

Window:Toggle("Server Hop", { default = Settings.Hop }, function(state)
    task.spawn(function()
        Settings.Hop = state
        while true do
            if not Settings.Hop then return end
            
            task.wait(Settings.Delay.Hop)

            local ServersList = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))

            for _, v in pairs(ServersList.data) do
                if v.playing ~= v.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id)
                end
            end
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
