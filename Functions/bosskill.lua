local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local baseplate = game.Workspace:FindFirstChild("Baseplate")
local attacks = game.Workspace:FindFirstChild("Attacks")

while true do
    local loopfor = attacks:GetChildren()
    
    for i, v in ipairs(loopfor) do
        local attack1Ball = v:FindFirstChild("Attack1Ball")
        if attack1Ball and attack1Ball.Parryable.Value == false then
            attack1Ball:Destroy()
            print("Removed Attack1Ball")
        end
        if attack1Ball and attack1Ball.Material == Enum.Material.Granite then
            print("Going...")
            humanoidRootPart.CFrame = attack1Ball.CFrame
            print("Teleported to Attack1Ball")
            wait(1)
            -- Teleport to baseplate after teleporting to Attack1Ball
            if baseplate then
                humanoidRootPart.CFrame = baseplate.CFrame + Vector3.new(0, 5, 0)
                print("Teleported to Baseplate")
            else
                print("Baseplate not found")
            end
        end
    end
    
    wait(1) -- Add a delay to avoid overloading the game
end
