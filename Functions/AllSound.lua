game.Workspace.Music:Destroy()
local sounda = Instance.new("Sound")
local soundb = Instance.new("Sound")
local soundc = Instance.new("Sound")
sounda.SoundId = "rbxassetid://119805882017411"  -- Replace with your sound ID
soundb.SoundId = "rbxassetid://1846458016"  -- Replace with your sound ID
soundc.SoundId = "rbxassetid://131053904734016"  -- Replace with your sound ID
sounda.Parent = game.Workspace  -- Set the parent to Workspace or any other part
soundb.Parent = game.Workspace  -- Set the parent to Workspace or any other part
soundc.Parent = game.Workspace  -- Set the parent to Workspace or any other part


local function playSounda()
    sounda.Playing = true
end

playSounda()

local function playSoundb()
    soundb.Playing = true
end

playSoundb()

local function playSoundc()
    soundc.Playing = true
end

playSoundc()

print("Playing all sound!")