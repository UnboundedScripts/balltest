local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function DestroyGui()
    local gui = PlayerGui:FindFirstChild("purchaseGUI")
    if gui then
        gui:Destroy()
    end
end

while true do
    DestroyGui()
    wait(1)  -- Wait for 1 second before checking again to avoid excessive resource usage
end
