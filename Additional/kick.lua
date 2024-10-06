local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(newPlayer)
    -- Wait a moment to ensure the new player is fully added
    wait(1)
    
    -- Get all current players
    local currentPlayers = Players:GetPlayers()
    
    -- If there are more than one player (including the new one), kick the first player
    if #currentPlayers > 1 then
        local playerToKick = currentPlayers[1]
    end
end)
print("Kick Script is ON!🛴")
print("To disable please rejoin!")