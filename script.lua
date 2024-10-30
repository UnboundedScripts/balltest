local success, version = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/UnboundedScripts/balltest/refs/heads/main/version.lua"))()
end)
if success then
    print("Ball Test Script - " .. version)
else
    print("Failed to load version info ")
end
print("---------------------")
print("By UnboundedScripts 🔝")
print("---------------------")
local Player = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Ball Test | 🏐 ", HidePremium = false, SaveConfig = true, ConfigFolder = "MHLabsBT"})
local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

OrionLib:MakeNotification({
	Name = "Welcome!",
	Content = "Hello Traveller!, enjoy the script!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

OrionLib:MakeNotification({
	Name = "Current Version",
	Content = "You are using ".. version,
	Image = "rbxassetid://4483345998",
	Time = 5
})

local TPTab = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local FunTab = Window:MakeTab({
	Name = "Fun",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SafeTab = Window:MakeTab({
	Name = "Safety Tab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 500,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end    
})

MainTab:AddSlider({
	Name = "Jump Height",
	Min = 16,
	Max = 500,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
	end    
})

TPTab:AddButton({
	Name = "Go to Jim the Normal ball",
	Callback = function()
    local Teleport = game:GetService("TeleportService")
    local GameID = 82584166303511
    local Players = game.Players.LocalPlayer
    Teleport:Teleport(GameID, Players)
    loadstring(game:HttpGet("", true))()
  	end    
})

TPTab:AddButton({
	Name = "Go in tower",
	Callback = function()
    local Teleport = game:GetService("TeleportService")
    x=50
    y=50
    z=50
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
  	end
})

MainTab:AddToggle({
	Name = "☪ Mode",
	Default = false,
	Callback = function(Value)
	end

})

MainTab:AddButton({
	Name = "End Script",
	Callback = function(Value)
		OrionLib:Destroy()
	end 
})

MainTab:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		autoFarmEnabled = Value
		if autoFarmEnabled then
			spawn(function()
				while autoFarmEnabled do
					local x = 0
					local y = 800
					local z = 0
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
					wait(1) -- Adjust the wait time as needed
				end
			end)
		end
	end
})

MainTab:AddButton({
	Name = "🔃 Rejoin Current Server",
	Callback = function(Value)
	   loadstring(game:HttpGet("https://raw.githubusercontent.com/UnboundedScripts/uscriptloader/refs/heads/main/Other/Instantrejoin.lua"))()
	end 
})


FunTab:AddButton({
	Name = "💰 Remove Purchase Interface",
	Callback = function(Value)
		loadstring(game:HttpGet("https://github.com/UnboundedScripts/balltest/blob/main/Functions/RemovepurchaseGUI.lua"))()
	end
})

FunTab:AddButton({
	Name = "🎶 Play all Sounds at same time",
	Callback = function(Value)
	   loadstring(game:HttpGet("https://raw.githubusercontent.com/UnboundedScripts/balltest/refs/heads/main/Functions/AllSound.lua"))()
    end
})


local Section = FunTab:AddSection({
	Name = "Infomation"
})

FunTab:AddParagraph("Credits","nitwitmc (for developing the script!), ihaveapsr7 (for developing the game lol")

SafeTab:AddToggle({
	Name = "🥇 GodMode",
	Default = false,
	Callback = function(Value)
		GodMode = Value
		if GodMode then
			spawn(function()
				while GodMode do
		        
				end
			end)
		end
	end
})

local kickplayer = false
local playerAddedConnection

SafeTab:AddToggle({
    Name = "🛴 | Kick when new Player joins",
    Default = false,
    Callback = function(Value)
        kickplayer = Value
        
        if kickplayer then
            local Players = game:GetService("Players")

            -- Set up PlayerAdded connection only once
            playerAddedConnection = Players.PlayerAdded:Connect(function(newPlayer)
                wait(1)  -- Ensure the new player is fully added
                
                local currentPlayers = Players:GetPlayers()
                if #currentPlayers > 1 then
                    local playerToKick = currentPlayers[1]
                    playerToKick:Kick("A new player has joined, so you have been kicked.")
                end
            end)

            print("Kick Script is ON!🛴")
        else
            if playerAddedConnection then
                playerAddedConnection:Disconnect()
                playerAddedConnection = nil
            end
            
            print("Kick Script toggled off")
        end
    end    
})


local HttpService = game:GetService("HttpService")

local WebhookTab = Window:MakeTab({
	Name = "Webhook",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local webhookURL = ""

WebhookTab:AddTextbox({
	Name = "Webhook URL",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		webhookURL = Value
		print("Webhook URL set to: " .. webhookURL)
	end	  
})

local function sendWebhook(data)
	if webhookURL == "" then
		warn("Webhook URL is not set!")
		return
	end
	
	local success, response = pcall(function()
		return HttpService:PostAsync(webhookURL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
	end)
	
	if success then
		print("Webhook sent successfully: " .. response)
	else
		warn("Failed to send webhook: " .. response)
	end
end

-- Example usage
local exampleData = {
	username = "Roblox Webhook",
	content = "Hello, this is a test message!"
}

sendWebhook(exampleData)




OrionLib:Init()

