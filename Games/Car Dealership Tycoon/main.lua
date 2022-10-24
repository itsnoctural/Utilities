while task.wait() do
	for i,v in pairs(game:GetService("Workspace").Pumpkins:GetChildren()) do	
		game:GetService("ReplicatedStorage").Remotes.Collectibles.TryToCollect:FireServer(v)
	end
end
