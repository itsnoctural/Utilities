game:GetService("ReplicatedStorage").RemoteObjects.DanceGameCash:FireServer(1/0)
for i,v in pairs(game:GetService("Workspace").Buttons:GetDescendants()) do if v:IsA("Model") then game:GetService("ReplicatedStorage").RemoteObjects.RequestButtonPurchase:FireServer(v.Name) end task.wait(0.1) end 
