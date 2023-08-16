-- esohasl.com
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService('TeleportService')
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

getgenv().Settings = {
    Stars = false,
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally2", true))()
local Window = Library:CreateWindow("RR | EsohaSL")

Window:Section("esohasl.com")

Window:Toggle("Auto Stars", {}, function(state)
    task.spawn(function()
        Settings.Stars = state
        while true do
            if not Settings.Stars then return end

            ReplicatedStorage.RemoteFuncs.Rocket_RemoteFunc:InvokeServer("Enter")
            local Rocket = LocalPlayer.Character:FindFirstChildOfClass("Model")
            
            if Rocket then
                Rocket:PivotTo(Workspace.Maps.Track.Planet.End:GetPivot())
            end

            task.wait(.1)
        end
    end)
end)

Window:Button("Server Hop", function()
    task.spawn(function()
        local ServersList = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))

        for _, v in pairs(ServersList.data) do
            if v.playing ~= v.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id)
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
